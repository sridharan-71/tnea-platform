import { readFile, writeFile } from "node:fs/promises";

import { PDFParse } from "pdf-parse";

import { assertTneaWebsiteAudit } from "./lib/tnea-2026-scope.mjs";

const CONCURRENCY = 8;
const TIMEOUT_MS = 15_000;
const MAX_LINKED_DOCUMENTS = 3;

function decodeHtml(value) {
  return value
    .replace(/<script\b[\s\S]*?<\/script>/gi, " ")
    .replace(/<style\b[\s\S]*?<\/style>/gi, " ")
    .replace(/&amp;/g, "&")
    .replace(/&nbsp;|&#160;/g, " ")
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&quot;/g, '"')
    .replace(/&#(\d+);/g, (_, code) => String.fromCodePoint(Number(code)))
    .replace(/<[^>]+>/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

async function fetchResource(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), TIMEOUT_MS);
  try {
    const response = await fetch(url, {
      redirect: "follow",
      signal: controller.signal,
      headers: {
        "User-Agent": "CampusAI-PlacementEvidence/1.0 (+public placement data collection)",
        Accept: "text/html,application/xhtml+xml,application/pdf;q=0.9,*/*;q=0.4",
      },
    });
    if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
    return {
      finalUrl: response.url,
      contentType: response.headers.get("content-type") ?? "",
      bytes: new Uint8Array(await response.arrayBuffer()),
    };
  } finally {
    clearTimeout(timeout);
  }
}

function placementDocumentLinks(html, baseUrl) {
  const links = [];
  for (const match of html.matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    const evidence = `${match[1]} ${decodeHtml(match[2])}`;
    if (!/placement|package|salary|recruit|annual.report|\.pdf(?:$|[?#])/i.test(evidence)) continue;
    try {
      const url = new URL(match[1], baseUrl).toString();
      if (/^https?:/i.test(url)) links.push(url);
    } catch {
      // Ignore malformed links on legacy college sites.
    }
  }
  return [...new Set(links)].slice(0, MAX_LINKED_DOCUMENTS);
}

async function textFromResource(resource) {
  const isPdf = resource.contentType.includes("application/pdf") || /\.pdf(?:$|[?#])/i.test(resource.finalUrl);
  if (!isPdf) return decodeHtml(new TextDecoder().decode(resource.bytes));
  const parser = new PDFParse({ data: resource.bytes });
  try {
    const parsed = await parser.getText();
    return parsed.text.replace(/\s+/g, " ").trim();
  } finally {
    await parser.destroy();
  }
}

function academicYear(text) {
  const matches = [...text.matchAll(/\b(20(?:2[1-6]))\s*[-–/]\s*(?:20)?(2[2-7])\b/g)];
  if (!matches.length) return "latest-published";
  const latest = matches.map((match) => ({
    start: Number(match[1]),
    end: Number(`20${match[2]}`),
  })).filter((value) => value.end === value.start + 1)
    .sort((a, b) => b.start - a.start)[0];
  return latest ? `${latest.start}-${String(latest.end).slice(-2)}` : "latest-published";
}

function salaryToRupees(amount, unit) {
  const value = Number(amount.replaceAll(",", ""));
  if (!Number.isFinite(value)) return null;
  if (/crore|\bcr\b/i.test(unit)) return Math.round(value * 10_000_000);
  if (/lakh|lac|lpa/i.test(unit)) return Math.round(value * 100_000);
  if (/million/i.test(unit)) return Math.round(value * 1_000_000);
  return null;
}

function packageMetric(text, label, minimum, maximum) {
  const patterns = [
    new RegExp(`${label}[^.]{0,90}?(?:₹|rs\\.?|inr)?\\s*(\\d+(?:,\\d{2,3})*(?:\\.\\d+)?)\\s*(crores?|cr\\.?|lakhs?|lacs?|lpa|million)`, "i"),
    new RegExp(`(?:₹|rs\\.?|inr)?\\s*(\\d+(?:,\\d{2,3})*(?:\\.\\d+)?)\\s*(crores?|cr\\.?|lakhs?|lacs?|lpa|million)[^.]{0,70}?${label}`, "i"),
  ];
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (!match) continue;
    const value = salaryToRupees(match[1], match[2]);
    if (value !== null && value >= minimum && value <= maximum) return value;
  }
  return null;
}

function placementPercentage(text) {
  const patterns = [
    /(?:placement\s+(?:percentage|percent|rate)|students?\s+(?:were\s+)?placed|placements?\s+achieved)[^.%]{0,45}?(\d{1,3}(?:\.\d+)?)\s*%/i,
    /(\d{1,3}(?:\.\d+)?)\s*%[^.]{0,45}?(?:placement\s+(?:percentage|percent|rate)|students?\s+(?:were\s+)?placed|placements?\s+achieved)/i,
  ];
  for (const pattern of patterns) {
    const match = text.match(pattern);
    const value = match ? Number(match[1]) : Number.NaN;
    if (match) {
      const context = text.slice(Math.max(0, match.index - 50), (match.index ?? 0) + match[0].length + 50);
      if (/placement\s+(?:assistance|support|training|guidance)/i.test(context)) continue;
    }
    if (Number.isFinite(value) && value >= 1 && value <= 100) return value;
  }
  return null;
}

function extractClaims(text, sourceUrl) {
  const averageSalary = packageMetric(text, "average(?:\\s+(?:salary|package|ctc))?", 100_000, 5_000_000);
  const highestSalary = packageMetric(text, "highest(?:\\s+(?:salary|package|ctc))?", 100_000, 20_000_000);
  const percentage = placementPercentage(text);
  if (averageSalary === null && highestSalary === null && percentage === null) return null;
  return {
    academicYear: academicYear(text),
    placementPercentage: percentage,
    averageSalary,
    highestSalary,
    sourceUrl,
  };
}

async function collectCollege(college) {
  const startingUrls = [...new Set([college.placementsUrl, college.officialWebsite].filter((value) => /^https?:/i.test(value ?? "")))];
  const attempts = [];
  const claims = [];
  for (const startingUrl of startingUrls) {
    try {
      const resource = await fetchResource(startingUrl);
      const text = await textFromResource(resource);
      const direct = extractClaims(text, resource.finalUrl);
      if (direct) claims.push(direct);
      const isHtml = !resource.contentType.includes("application/pdf") && !/\.pdf(?:$|[?#])/i.test(resource.finalUrl);
      if (!isHtml) continue;
      const html = new TextDecoder().decode(resource.bytes);
      for (const linkedUrl of placementDocumentLinks(html, resource.finalUrl)) {
        try {
          const linked = await fetchResource(linkedUrl);
          const linkedClaim = extractClaims(await textFromResource(linked), linked.finalUrl);
          if (linkedClaim) claims.push(linkedClaim);
        } catch (error) {
          attempts.push({ url: linkedUrl, error: error instanceof Error ? error.message : String(error) });
        }
      }
    } catch (error) {
      attempts.push({ url: startingUrl, error: error instanceof Error ? error.message : String(error) });
    }
  }
  return { college, claims, attempts };
}

async function mapConcurrent(items, operation) {
  const output = new Array(items.length);
  let cursor = 0;
  async function worker() {
    while (cursor < items.length) {
      const index = cursor++;
      output[index] = await operation(items[index]);
      if ((index + 1) % 20 === 0) console.log(`Processed ${index + 1}/${items.length}`);
    }
  }
  await Promise.all(Array.from({ length: CONCURRENCY }, worker));
  return output;
}

function sqlString(value) {
  return value == null ? "null" : `'${String(value).replaceAll("'", "''")}'`;
}

function sqlNumber(value) {
  return value == null ? "null" : String(value);
}

async function main() {
  const audit = JSON.parse(await readFile("data/imports/college-website-audit.json", "utf8"));
  assertTneaWebsiteAudit(audit);
  const candidates = audit.results.filter((college) => college.status === "working" && (college.placementsUrl || college.officialWebsite));
  const collected = await mapConcurrent(candidates, collectCollege);
  const unique = new Map();
  for (const result of collected) {
    for (const claim of result.claims) {
      const key = `${result.college.college_id}-${claim.academicYear}`;
      const previous = unique.get(key);
      unique.set(key, {
        college: result.college,
        academicYear: claim.academicYear,
        placementPercentage: claim.placementPercentage ?? previous?.placementPercentage ?? null,
        averageSalary: claim.averageSalary ?? previous?.averageSalary ?? null,
        highestSalary: claim.highestSalary ?? previous?.highestSalary ?? null,
        placementPercentageSourceUrl: claim.placementPercentage !== null ? claim.sourceUrl : previous?.placementPercentageSourceUrl ?? null,
        averageSalarySourceUrl: claim.averageSalary !== null ? claim.sourceUrl : previous?.averageSalarySourceUrl ?? null,
        highestSalarySourceUrl: claim.highestSalary !== null ? claim.sourceUrl : previous?.highestSalarySourceUrl ?? null,
      });
    }
  }
  const records = [...unique.values()];
  const values = records.map((record) => `(
    ${record.college.college_id}, ${sqlString(record.academicYear)}, 'ug',
    ${sqlNumber(record.placementPercentage)}, ${sqlNumber(record.averageSalary)}, ${sqlNumber(record.highestSalary)},
    ${sqlString(record.placementPercentageSourceUrl)}, ${sqlString(record.averageSalarySourceUrl)}, ${sqlString(record.highestSalarySourceUrl)},
    'official_website_claim', true, ${sqlString(record.averageSalarySourceUrl ?? record.highestSalarySourceUrl ?? record.placementPercentageSourceUrl)},
    'medium', now()
  )`);
  const sql = values.length ? `begin;

insert into public.college_placement_statistics (
  college_id, academic_year, program_level,
  placement_percentage, average_salary, highest_salary,
  placement_percentage_source_url, average_salary_source_url, highest_salary_source_url,
  source_type, is_self_reported, source_url, source_confidence, last_verified_at
)
values
${values.join(",\n")}
on conflict (college_id, academic_year, program_level) do update set
  placement_percentage = coalesce(excluded.placement_percentage, public.college_placement_statistics.placement_percentage),
  average_salary = coalesce(excluded.average_salary, public.college_placement_statistics.average_salary),
  highest_salary = coalesce(excluded.highest_salary, public.college_placement_statistics.highest_salary),
  placement_percentage_source_url = coalesce(excluded.placement_percentage_source_url, public.college_placement_statistics.placement_percentage_source_url),
  average_salary_source_url = coalesce(excluded.average_salary_source_url, public.college_placement_statistics.average_salary_source_url),
  highest_salary_source_url = coalesce(excluded.highest_salary_source_url, public.college_placement_statistics.highest_salary_source_url),
  source_type = excluded.source_type,
  is_self_reported = excluded.is_self_reported,
  source_url = excluded.source_url,
  source_confidence = excluded.source_confidence,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
` : "-- No official placement claims were extracted.\n";
  const summary = {
    generatedAt: new Date().toISOString(),
    collegesChecked: candidates.length,
    collegesWithClaims: new Set(records.map((record) => record.college.college_id)).size,
    recordsPrepared: records.length,
    placementPercentage: records.filter((record) => record.placementPercentage !== null).length,
    averageSalary: records.filter((record) => record.averageSalary !== null).length,
    highestSalary: records.filter((record) => record.highestSalary !== null).length,
  };
  await writeFile("data/imports/official-placement-claims.sql", sql);
  await writeFile("data/imports/official-placement-claims-report.json", JSON.stringify({ summary, records, collected }, null, 2));
  console.log(JSON.stringify(summary, null, 2));
}

await main();
