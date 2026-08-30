import { readFile, writeFile } from "node:fs/promises";

import { PDFParse } from "pdf-parse";

import { assertTneaWebsiteAudit } from "./lib/tnea-2026-scope.mjs";

const CONCURRENCY = 6;
const TIMEOUT_MS = 15_000;

function decode(value) {
  return value
    .replace(/&amp;/g, "&")
    .replace(/&nbsp;/g, " ")
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&quot;/g, '"')
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
        "User-Agent": "CampusAI-DataAudit/1.0 (+official college data verification)",
        Accept: "application/pdf,text/html,application/xhtml+xml;q=0.9,*/*;q=0.5",
      },
    });
    if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
    const contentType = response.headers.get("content-type") ?? "";
    return {
      finalUrl: response.url,
      contentType,
      bytes: new Uint8Array(await response.arrayBuffer()),
    };
  } finally {
    clearTimeout(timeout);
  }
}

function pdfLinks(html, baseUrl) {
  const links = [];
  for (const match of html.matchAll(/<a\b[^>]*href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi)) {
    const evidence = `${match[1]} ${decode(match[2])}`;
    if (!/\.pdf(?:$|[?#])|nirf/i.test(evidence)) continue;
    try {
      links.push(new URL(match[1], baseUrl).toString());
    } catch {
      // Ignore malformed links from legacy college websites.
    }
  }
  return [...new Set(links)].sort((left, right) => {
    const leftYear = Number(left.match(/20(?:2[3-6])/g)?.at(-1) ?? 0);
    const rightYear = Number(right.match(/20(?:2[3-6])/g)?.at(-1) ?? 0);
    return rightYear - leftYear;
  });
}

function parseUgPlacements(text) {
  const start = text.indexOf("UG [4 Years Program(s)]: Placement & higher studies");
  if (start < 0) return [];
  const remainder = text.slice(start + 1);
  const endCandidates = [
    remainder.indexOf("UG [5 Years Program(s)]:"),
    remainder.indexOf("PG [2 Years Program(s)]:"),
    remainder.indexOf("PG-Integrated"),
    remainder.indexOf("Ph.D Student Details"),
  ].filter((index) => index >= 0);
  const section = text.slice(start, start + (endCandidates.length ? Math.min(...endCandidates) + 1 : 6000))
    .replace(/\s+/g, " ");
  const records = [];
  const pattern = /(20\d{2}-\d{2})\s+\d+\s+\d+\s+(20\d{2}-\d{2})\s+(?:\d+\s+)?(20\d{2}-\d{2})\s+(\d+)\s+(\d+)\s+(\d+)\s*\([^)]*\)\s+(\d+)/g;
  for (const match of section.matchAll(pattern)) {
    records.push({
      academicYear: match[3],
      eligibleStudents: Number(match[4]),
      studentsPlaced: Number(match[5]),
      medianSalary: Number(match[6]),
      studentsHigherStudies: Number(match[7]),
    });
  }
  return records;
}

async function extractPdf(url) {
  const resource = await fetchResource(url);
  const parser = new PDFParse({ data: resource.bytes });
  try {
    const result = await parser.getText();
    return { sourceUrl: resource.finalUrl, records: parseUgPlacements(result.text) };
  } finally {
    await parser.destroy();
  }
}

async function collectCollege(result) {
  if (!result.nirfDisclosureUrl) return { result, status: "no_nirf_link", records: [] };
  try {
    const resource = await fetchResource(result.nirfDisclosureUrl);
    const isPdf = resource.contentType.includes("application/pdf") || /\.pdf(?:$|[?#])/i.test(resource.finalUrl);
    const candidates = isPdf
      ? [resource.finalUrl]
      : pdfLinks(new TextDecoder().decode(resource.bytes), resource.finalUrl).slice(0, 5);
    if (!candidates.length) return { result, status: "no_pdf_discovered", records: [] };

    const errors = [];
    for (const candidate of candidates) {
      try {
        const extracted = isPdf && candidate === resource.finalUrl
          ? await (async () => {
            const parser = new PDFParse({ data: resource.bytes });
            try {
              const parsed = await parser.getText();
              return { sourceUrl: resource.finalUrl, records: parseUgPlacements(parsed.text) };
            } finally {
              await parser.destroy();
            }
          })()
          : await extractPdf(candidate);
        if (extracted.records.length) {
          return { result, status: "parsed", ...extracted };
        }
      } catch (error) {
        errors.push(error instanceof Error ? error.message : String(error));
      }
    }
    return { result, status: "no_placement_table_parsed", records: [], errors };
  } catch (error) {
    return {
      result,
      status: "unreachable",
      records: [],
      errors: [error instanceof Error ? error.message : String(error)],
    };
  }
}

async function mapConcurrent(items, operation) {
  const output = new Array(items.length);
  let cursor = 0;
  async function worker() {
    while (cursor < items.length) {
      const index = cursor;
      cursor += 1;
      output[index] = await operation(items[index]);
      if ((index + 1) % 20 === 0) console.log(`Processed ${index + 1}/${items.length}`);
    }
  }
  await Promise.all(Array.from({ length: CONCURRENCY }, worker));
  return output;
}

function sqlString(value) {
  return `'${String(value).replaceAll("'", "''")}'`;
}

async function main() {
  const audit = JSON.parse(await readFile("data/imports/college-website-audit.json", "utf8"));
  assertTneaWebsiteAudit(audit);
  const candidates = audit.results.filter((result) => result.nirfDisclosureUrl);
  const collected = await mapConcurrent(candidates, collectCollege);
  const unique = new Map();
  for (const item of collected.filter((entry) => entry.status === "parsed")) {
    for (const record of item.records) {
      if (!["2022-23", "2023-24", "2024-25"].includes(record.academicYear)) continue;
      unique.set(`${item.result.college_id}-${record.academicYear}`, {
        college: item.result,
        sourceUrl: item.sourceUrl,
        ...record,
      });
    }
  }

  const records = [...unique.values()];
  const values = records.map((record) => `(
    ${record.college.college_id}, ${sqlString(record.academicYear)}, 'ug',
    ${record.eligibleStudents}, ${record.studentsPlaced}, ${record.studentsHigherStudies},
    ${record.medianSalary}, null, null,
    'nirf_disclosure', true, ${sqlString(record.sourceUrl)}, now()
  )`);
  const sql = values.length ? `begin;

insert into public.college_placement_statistics (
  college_id, academic_year, program_level,
  eligible_students, students_placed, students_higher_studies,
  median_salary, average_salary, highest_salary,
  source_type, is_self_reported, source_url, last_verified_at
)
values
${values.join(",\n")}
on conflict (college_id, academic_year, program_level) do update set
  eligible_students = excluded.eligible_students,
  students_placed = excluded.students_placed,
  students_higher_studies = excluded.students_higher_studies,
  median_salary = excluded.median_salary,
  source_type = excluded.source_type,
  is_self_reported = excluded.is_self_reported,
  source_url = excluded.source_url,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
` : "-- No official-site NIRF placement records were parsed.\n";

  const summary = {
    generatedAt: new Date().toISOString(),
    collegesWithNirfLinks: candidates.length,
    collegesParsed: new Set(records.map((record) => record.college.college_id)).size,
    recordsPrepared: records.length,
    byAcademicYear: Object.fromEntries(["2022-23", "2023-24", "2024-25"].map((year) => [
      year,
      records.filter((record) => record.academicYear === year).length,
    ])),
    statusCounts: Object.fromEntries([...new Set(collected.map((item) => item.status))].map((status) => [
      status,
      collected.filter((item) => item.status === status).length,
    ])),
  };

  await writeFile("data/imports/official-site-nirf-placements.sql", sql);
  await writeFile("data/imports/official-site-nirf-placements-report.json", JSON.stringify({ summary, records, collected }, null, 2));
  console.log(JSON.stringify(summary, null, 2));
}

await main();
