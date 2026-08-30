import { readFile, writeFile } from "node:fs/promises";

import { assertTneaWebsiteAudit } from "./lib/tnea-2026-scope.mjs";

const CONCURRENCY = 10;
const TIMEOUT_MS = 12_000;

const FACILITIES = [
  ["Central library", /\b(?:central\s+)?library\b/i],
  ["Laboratories", /\b(?:laborator(?:y|ies)|advanced\s+labs?)\b/i],
  ["Sports facilities", /\b(?:sports\s+(?:facilit(?:y|ies)|complex)|playground|indoor\s+stadium)\b/i],
  ["Gymnasium", /\b(?:gymnasium|fitness\s+cent(?:re|er))\b/i],
  ["Auditorium", /\bauditorium\b/i],
  ["Cafeteria", /\b(?:cafeteria|canteen|food\s+court)\b/i],
  ["Medical facilities", /\b(?:medical\s+(?:facilit(?:y|ies)|cent(?:re|er))|health\s+cent(?:re|er)|dispensary)\b/i],
  ["Transport", /\b(?:transport(?:ation)?\s+(?:facilit(?:y|ies)|service)|college\s+buses)\b/i],
  ["Wi-Fi campus", /\b(?:wi-?fi|wireless)\s+(?:enabled\s+)?campus\b/i],
  ["Innovation centre", /\b(?:innovation|incubation|entrepreneurship)\s+cent(?:re|er)\b/i],
];

function decodeHtml(value) {
  return value.replace(/<script\b[\s\S]*?<\/script>/gi, " ")
    .replace(/<style\b[\s\S]*?<\/style>/gi, " ")
    .replace(/&amp;/g, "&").replace(/&nbsp;|&#160;/g, " ")
    .replace(/&#39;|&apos;/g, "'").replace(/&quot;/g, '"')
    .replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
}

async function fetchPage(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), TIMEOUT_MS);
  try {
    const response = await fetch(url, {
      redirect: "follow", signal: controller.signal,
      headers: { "User-Agent": "CampusAI-CampusEvidence/1.0", Accept: "text/html,application/xhtml+xml" },
    });
    if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
    const contentType = response.headers.get("content-type") ?? "";
    if (!contentType.includes("text/html")) throw new Error(`unsupported ${contentType}`);
    return { finalUrl: response.url, html: await response.text() };
  } finally {
    clearTimeout(timeout);
  }
}

function relevantLinks(html, baseUrl) {
  const links = [];
  for (const match of html.matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    const evidence = `${match[1]} ${decodeHtml(match[2])}`;
    if (!/hostel|facilit|infrastructure|campus|amenit|naac|accredit/i.test(evidence)) continue;
    try {
      const url = new URL(match[1], baseUrl).toString();
      if (/^https?:/i.test(url)) links.push(url);
    } catch {
      // Ignore malformed navigation links.
    }
  }
  return [...new Set(links)].slice(0, 4);
}

function naacGrade(text) {
  const patterns = [
    /\bNAAC\b[^.]{0,90}?\b(?:grade[d:]?\s*)?(A\+\+|A\+|A|B\+\+|B\+|B)\b/i,
    /\b(A\+\+|A\+|A|B\+\+|B\+|B)\s+(?:grade\s+)?(?:by|from)\s+NAAC\b/i,
  ];
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (match) return match[1].toUpperCase();
  }
  return null;
}

function factsFrom(text, sourceUrl) {
  const hostelAvailable = /\b(?:boys'?|girls'?|men'?s?|women'?s?)?\s*hostel(?:s|\s+facilit(?:y|ies)|\s+accommodation)?\b/i.test(text);
  return {
    sourceUrl,
    hostelAvailable,
    naacGrade: naacGrade(text),
    facilities: FACILITIES.filter(([, pattern]) => pattern.test(text)).map(([name]) => name),
  };
}

async function collectCollege(college) {
  const pages = [];
  const errors = [];
  try {
    const home = await fetchPage(college.officialWebsite);
    pages.push(factsFrom(decodeHtml(home.html), home.finalUrl));
    for (const url of relevantLinks(home.html, home.finalUrl)) {
      try {
        const page = await fetchPage(url);
        pages.push(factsFrom(decodeHtml(page.html), page.finalUrl));
      } catch (error) {
        errors.push({ url, error: error instanceof Error ? error.message : String(error) });
      }
    }
  } catch (error) {
    errors.push({ url: college.officialWebsite, error: error instanceof Error ? error.message : String(error) });
  }
  const naacPage = pages.find((page) => page.naacGrade);
  const hostelPage = pages.find((page) => page.hostelAvailable);
  const facilitySources = new Map();
  for (const page of pages) for (const facility of page.facilities) if (!facilitySources.has(facility)) facilitySources.set(facility, page.sourceUrl);
  return {
    college,
    naacGrade: naacPage?.naacGrade ?? null,
    naacSourceUrl: naacPage?.sourceUrl ?? null,
    hostelAvailable: Boolean(hostelPage),
    hostelSourceUrl: hostelPage?.sourceUrl ?? null,
    facilities: [...facilitySources].map(([name, sourceUrl]) => ({ name, sourceUrl })),
    errors,
  };
}

async function mapConcurrent(items, operation) {
  const output = new Array(items.length);
  let cursor = 0;
  async function worker() {
    while (cursor < items.length) {
      const index = cursor++;
      output[index] = await operation(items[index]);
      if ((index + 1) % 25 === 0) console.log(`Processed ${index + 1}/${items.length}`);
    }
  }
  await Promise.all(Array.from({ length: CONCURRENCY }, worker));
  return output;
}

function sqlString(value) {
  return value == null ? "null" : `'${String(value).replaceAll("'", "''")}'`;
}

async function main() {
  const audit = JSON.parse(await readFile("data/imports/college-website-audit.json", "utf8"));
  assertTneaWebsiteAudit(audit);
  const candidates = audit.results.filter((college) => college.status === "working" && /^https?:/i.test(college.officialWebsite ?? ""));
  const records = await mapConcurrent(candidates, collectCollege);
  const naac = records.filter((record) => record.naacGrade);
  const hostels = records.filter((record) => record.hostelAvailable);
  const facilities = records.flatMap((record) => record.facilities.map((facility) => ({ collegeId: record.college.college_id, ...facility })));
  const naacValues = naac.map((record) => `(${record.college.college_id}, 'NAAC', 'accredited', ${sqlString(record.naacGrade)}, ${sqlString(record.naacSourceUrl)}, now())`);
  const hostelValues = hostels.map((record) => `(${record.college.college_id}, 'general', true, ${sqlString(record.hostelSourceUrl)}, now())`);
  const facilityValues = facilities.map((facility) => `(${facility.collegeId}, ${sqlString(facility.name)}, 'campus', true, ${sqlString(facility.sourceUrl)}, now())`);
  const sql = `begin;

insert into public.college_accreditations (college_id, accreditation_body, accreditation_status, grade, source_url, last_verified_at)
select candidate.* from (values
${naacValues.join(",\n") || "(null::integer, null::text, null::text, null::text, null::text, null::timestamptz)"}
) candidate (college_id, accreditation_body, accreditation_status, grade, source_url, last_verified_at)
where candidate.college_id is not null and not exists (
  select 1 from public.college_accreditations existing
  where existing.college_id = candidate.college_id and upper(existing.accreditation_body) = 'NAAC'
);

insert into public.hostel_facilities (college_id, gender, accommodation_available, source_url, last_verified_at)
select candidate.* from (values
${hostelValues.join(",\n") || "(null::integer, null::text, null::boolean, null::text, null::timestamptz)"}
) candidate (college_id, gender, accommodation_available, source_url, last_verified_at)
where candidate.college_id is not null and not exists (
  select 1 from public.hostel_facilities existing where existing.college_id = candidate.college_id
);

insert into public.college_facilities (college_id, facility_name, facility_type, is_available, source_url, last_verified_at)
select candidate.* from (values
${facilityValues.join(",\n") || "(null::integer, null::text, null::text, null::boolean, null::text, null::timestamptz)"}
) candidate (college_id, facility_name, facility_type, is_available, source_url, last_verified_at)
where candidate.college_id is not null and not exists (
  select 1 from public.college_facilities existing
  where existing.college_id = candidate.college_id and lower(existing.facility_name) = lower(candidate.facility_name)
);

commit;
`;
  const summary = {
    generatedAt: new Date().toISOString(), collegesChecked: candidates.length,
    naacGrades: naac.length, hostelEvidence: hostels.length,
    collegesWithFacilities: new Set(facilities.map((facility) => facility.collegeId)).size,
    facilityRecords: facilities.length,
  };
  await writeFile("data/imports/official-campus-facts.sql", sql);
  await writeFile("data/imports/official-campus-facts-report.json", JSON.stringify({ summary, records }, null, 2));
  console.log(JSON.stringify(summary, null, 2));
}

await main();
