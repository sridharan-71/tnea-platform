import { mkdir, writeFile } from "node:fs/promises";

import { createClient } from "@supabase/supabase-js";

import {
  assertTneaCollegeCount,
  TNEA_ADMISSION_YEAR,
  TNEA_SCOPE,
} from "./lib/tnea-2026-scope.mjs";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
if (!url || !key) throw new Error("Missing Supabase public environment variables.");
const supabase = createClient(url, key);

const CONCURRENCY = 12;
const REQUEST_TIMEOUT_MS = 10_000;
const LINK_PATTERNS = {
  admissionsUrl: /\b(admission|admissions|apply now|application)\b/i,
  contactUrl: /\b(contact|contact us|reach us|location)\b/i,
  placementsUrl: /\b(placement|placements|career development|training and placement|corporate relations)\b/i,
  mandatoryDisclosureUrl: /\b(mandatory disclosure|aicte disclosure|disclosure)\b/i,
  nirfDisclosureUrl: /\b(nirf|national institutional ranking framework)\b/i,
};

function candidateUrls(value) {
  const trimmed = value.trim();
  if (/^https?:\/\//i.test(trimmed)) return [trimmed];
  return [`https://${trimmed}`, `http://${trimmed}`];
}

async function fetchPage(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);
  try {
    const response = await fetch(url, {
      redirect: "follow",
      signal: controller.signal,
      headers: {
        "User-Agent": "CampusAI-DataAudit/1.0 (+official college data verification)",
        Accept: "text/html,application/xhtml+xml,application/pdf;q=0.8,*/*;q=0.5",
      },
    });
    const contentType = response.headers.get("content-type") ?? "";
    return {
      ok: response.ok,
      status: response.status,
      finalUrl: response.url,
      contentType,
      html: contentType.includes("text/html") ? await response.text() : "",
    };
  } finally {
    clearTimeout(timeout);
  }
}

function decode(value) {
  return value
    .replace(/&amp;/g, "&")
    .replace(/&nbsp;/g, " ")
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&quot;/g, '"')
    .replace(/&#(\d+);/g, (_, code) => String.fromCodePoint(Number(code)))
    .replace(/&#x([\da-f]+);/gi, (_, code) => String.fromCodePoint(Number.parseInt(code, 16)))
    .replace(/<[^>]+>/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function discoverLinks(html, baseUrl) {
  const discovered = {};
  for (const match of html.matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    let resolved;
    try {
      resolved = new URL(match[1], baseUrl).toString();
    } catch {
      continue;
    }
    const evidence = `${decode(match[2])} ${resolved}`;
    for (const [field, pattern] of Object.entries(LINK_PATTERNS)) {
      if (!discovered[field] && pattern.test(evidence)) discovered[field] = resolved;
    }
  }
  return discovered;
}

function resolveUrl(value, baseUrl) {
  if (!value || value.startsWith("data:")) return null;
  try {
    return new URL(value, baseUrl).toString();
  } catch {
    return null;
  }
}

function discoverImages(html, baseUrl) {
  const ogImage = html.match(/<meta\b[^>]*(?:property|name)=["']og:image["'][^>]*content=["']([^"']+)["'][^>]*>/i)?.[1]
    ?? html.match(/<meta\b[^>]*content=["']([^"']+)["'][^>]*(?:property|name)=["']og:image["'][^>]*>/i)?.[1];
  let logoUrl = null;
  for (const match of html.matchAll(/<img\b([^>]*?)src=["']([^"']+)["']([^>]*)>/gi)) {
    const evidence = `${match[1]} ${match[3]}`;
    if (/\b(logo|college-logo|site-logo|brand)\b/i.test(evidence)) {
      logoUrl = resolveUrl(match[2], baseUrl);
      if (logoUrl) break;
    }
  }
  return {
    logoUrl,
    campusImageUrl: resolveUrl(ogImage, baseUrl),
  };
}

function discoverContactDetails(html) {
  const email = normalizeEmail(html.match(/href=["']mailto:([^?"']+)/i)?.[1] ?? null);
  const phone = normalizePhone(html.match(/href=["']tel:([^"']+)/i)?.[1] ?? null);
  return { email, phone };
}

function normalizeEmail(value) {
  if (!value) return null;
  const email = decode(value).split(/[,;]/)[0].trim();
  if (email.length > 100 || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return null;
  return email;
}

function imageCaption(collegeName, type) {
  const suffix = type === "logo" ? " official logo" : " official campus image";
  const maximumNameLength = 100 - suffix.length;
  return `${collegeName.slice(0, maximumNameLength).trim()}${suffix}`;
}

function normalizePhone(value) {
  if (!value) return null;

  let decoded = value;
  try {
    decoded = decodeURIComponent(value);
  } catch {
    // Keep the original value when a website contains malformed URL encoding.
  }

  const firstNumber = decoded.split(/[,;|/]|\bor\b/i)[0];
  const readable = firstNumber
    .replace(/[^+\d\s()-]/g, "")
    .replace(/\s+/g, " ")
    .trim();

  if (readable.replace(/\D/g, "").length < 7) return null;
  if (readable.length <= 20) return readable;

  const compact = `${readable.startsWith("+") ? "+" : ""}${readable.replace(/\D/g, "")}`;
  return compact.length <= 20 ? compact : compact.slice(0, 20);
}

async function auditCollege(college) {
  if (!college.website?.trim()) {
    return { ...college, status: "missing_website" };
  }
  const attempts = [];
  for (const url of candidateUrls(college.website)) {
    try {
      const page = await fetchPage(url);
      attempts.push({ url, status: page.status, finalUrl: page.finalUrl });
      if (!page.ok) continue;
      return {
        ...college,
        status: "working",
        officialWebsite: page.finalUrl,
        ...discoverLinks(page.html, page.finalUrl),
        ...discoverImages(page.html, page.finalUrl),
        ...discoverContactDetails(page.html),
        attempts,
      };
    } catch (error) {
      attempts.push({
        url,
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
  return { ...college, status: "unreachable", attempts };
}

async function mapConcurrent(items, concurrency, operation) {
  const results = new Array(items.length);
  let cursor = 0;
  async function worker() {
    while (cursor < items.length) {
      const index = cursor;
      cursor += 1;
      results[index] = await operation(items[index]);
      if ((index + 1) % 25 === 0) console.log(`Checked ${index + 1}/${items.length}`);
    }
  }
  await Promise.all(Array.from({ length: concurrency }, () => worker()));
  return results;
}

function sqlString(value) {
  return value == null ? "null" : `'${String(value).replaceAll("'", "''")}'`;
}

async function main() {
  const { data: intakes, error: intakeError } = await supabase
    .from("tnea_college_intakes")
    .select("college_code")
    .eq("admission_year", TNEA_ADMISSION_YEAR)
    .limit(10_000);
  if (intakeError) throw new Error(intakeError.message);
  const activeCodes = [...new Set(
    (intakes ?? []).map((row) => String(Number(row.college_code))),
  )];
  if (!activeCodes.length) {
    throw new Error("Official 2026 TNEA intake scope is empty; refusing a historical fallback.");
  }
  assertTneaCollegeCount(activeCodes.length, "TNEA college intake");
  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("college_id, college_code, college_name, website")
    .in("college_code", activeCodes)
    .order("college_code")
    .limit(2000);
  if (error) throw new Error(error.message);
  assertTneaCollegeCount(colleges?.length ?? 0, "College master match");

  const results = await mapConcurrent(colleges ?? [], CONCURRENCY, auditCollege);
  const working = results.filter((result) => result.status === "working");
  const rows = working.map((result) => `(
    ${result.college_id}, ${sqlString(result.officialWebsite)},
    ${sqlString(result.admissionsUrl)}, ${sqlString(result.placementsUrl)},
    ${sqlString(result.mandatoryDisclosureUrl)}, ${sqlString(result.nirfDisclosureUrl)},
    ${sqlString(result.contactUrl)}, 'pending', ${sqlString(result.officialWebsite)}, now()
  )`);
  const sql = rows.length ? `begin;

insert into public.college_official_links (
  college_id, official_website, admissions_url, placements_url,
  mandatory_disclosure_url, nirf_disclosure_url, contact_url,
  verification_status, source_url, last_verified_at
)
values
${rows.join(",\n")}
on conflict (college_id) do update set
  official_website = excluded.official_website,
  admissions_url = coalesce(excluded.admissions_url, public.college_official_links.admissions_url),
  placements_url = coalesce(excluded.placements_url, public.college_official_links.placements_url),
  mandatory_disclosure_url = coalesce(excluded.mandatory_disclosure_url, public.college_official_links.mandatory_disclosure_url),
  nirf_disclosure_url = coalesce(excluded.nirf_disclosure_url, public.college_official_links.nirf_disclosure_url),
  contact_url = coalesce(excluded.contact_url, public.college_official_links.contact_url),
  source_url = excluded.source_url,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
` : "-- No working official websites found.\n";

  const contactRows = working.filter((result) => result.email || result.phone).map((result) => `(
    ${result.college_id}, 'official', 'Official contact',
    ${sqlString(result.email)}, ${sqlString(result.phone)}, true, now()
  )`);
  const contactSql = contactRows.length ? `begin;

insert into public.college_contacts (
  college_id, contact_type, contact_name,
  email, phone, is_primary, created_at
)
select candidate.*
from (values
${contactRows.join(",\n")}
) as candidate (
  college_id, contact_type, contact_name,
  email, phone, is_primary, created_at
)
where not exists (
  select 1 from public.college_contacts existing
  where existing.college_id = candidate.college_id
    and coalesce(existing.email, '') = coalesce(candidate.email, '')
    and coalesce(existing.phone, '') = coalesce(candidate.phone, '')
);

commit;
` : "-- No official contact candidates found.\n";

  const imageRows = working.flatMap((result) => [
    result.logoUrl ? {
      collegeId: result.college_id,
      url: result.logoUrl,
      type: "logo",
      caption: imageCaption(result.college_name, "logo"),
      sourceUrl: result.officialWebsite,
    } : null,
    result.campusImageUrl && result.campusImageUrl !== result.logoUrl ? {
      collegeId: result.college_id,
      url: result.campusImageUrl,
      type: "campus",
      caption: imageCaption(result.college_name, "campus"),
      sourceUrl: result.officialWebsite,
    } : null,
  ].filter(Boolean));
  const imageValues = imageRows.map((image) => `(
    ${image.collegeId}, ${sqlString(image.url)}, ${sqlString(image.type)},
    ${sqlString(image.caption)}, 0, false, ${sqlString(image.sourceUrl)},
    'permission_required', 'Official college website', now()
  )`);
  const imageSql = imageValues.length ? `begin;

insert into public.college_images (
  college_id, image_url, image_type, caption,
  display_order, is_active, source_url,
  usage_status, attribution, last_verified_at
)
select candidate.*
from (values
${imageValues.join(",\n")}
) as candidate (
  college_id, image_url, image_type, caption,
  display_order, is_active, source_url,
  usage_status, attribution, last_verified_at
)
where not exists (
  select 1 from public.college_images existing
  where existing.college_id = candidate.college_id
    and existing.image_url = candidate.image_url
);

commit;
` : "-- No official website image candidates found.\n";

  const summary = {
    generatedAt: new Date().toISOString(),
    admissionYear: TNEA_ADMISSION_YEAR,
    scope: TNEA_SCOPE,
    total: results.length,
    working: working.length,
    unreachable: results.filter((result) => result.status === "unreachable").length,
    missingWebsite: results.filter((result) => result.status === "missing_website").length,
    placementLinks: results.filter((result) => result.placementsUrl).length,
    admissionsLinks: results.filter((result) => result.admissionsUrl).length,
    contactLinks: results.filter((result) => result.contactUrl).length,
    mandatoryDisclosureLinks: results.filter((result) => result.mandatoryDisclosureUrl).length,
    nirfDisclosureLinks: results.filter((result) => result.nirfDisclosureUrl).length,
    logoCandidates: results.filter((result) => result.logoUrl).length,
    campusImageCandidates: results.filter((result) => result.campusImageUrl).length,
    institutionalEmails: results.filter((result) => result.email).length,
    institutionalPhones: results.filter((result) => result.phone).length,
  };

  await mkdir("data/imports", { recursive: true });
  await writeFile("data/imports/college-website-audit.json", JSON.stringify({ summary, results }, null, 2));
  await writeFile("data/imports/college-official-links.sql", sql);
  await writeFile("data/imports/college-image-candidates.sql", imageSql);
  await writeFile("data/imports/college-contact-candidates.sql", contactSql);
  console.log(JSON.stringify(summary, null, 2));
}

await main();
