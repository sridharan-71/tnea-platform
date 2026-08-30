import { mkdir, writeFile } from "node:fs/promises";

import { PDFParse } from "pdf-parse";
import { createClient } from "@supabase/supabase-js";

import {
  assertTneaCollegeCount,
  TNEA_ADMISSION_YEAR,
} from "./lib/tnea-2026-scope.mjs";

const RANKING_PAGES = [
  "https://www.nirfindia.org/Rankings/2025/EngineeringRanking.html",
  "https://www.nirfindia.org/Rankings/2025/EngineeringRanking150.html",
  "https://www.nirfindia.org/Rankings/2025/EngineeringRanking200.html",
  "https://www.nirfindia.org/Rankings/2025/EngineeringRanking300.html",
];

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
if (!url || !key) throw new Error("Missing Supabase public environment variables.");

const supabase = createClient(url, key);

function decodeHtml(value) {
  return value
    .replace(/&amp;/g, "&")
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&quot;/g, '"')
    .replace(/&nbsp;/g, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function normalizeName(value) {
  return value
    .toLowerCase()
    .replace(/\(autonomous\)/g, " ")
    .replace(/\b(?:district|taluk|post|road|campus|pin|pincode)\b.*$/g, " ")
    .replace(/\b(?:tamil nadu|chennai|coimbatore|madurai|salem|erode)\b/g, " ")
    .replace(/[^a-z0-9]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function matchScore(left, right) {
  const a = normalizeName(left);
  const b = normalizeName(right);
  if (!a || !b) return 0;
  if (a === b) return 1;
  if (a.startsWith(b) || b.startsWith(a)) return 0.98;
  const previous = Array.from({ length: b.length + 1 }, (_, index) => index);
  for (let row = 1; row <= a.length; row += 1) {
    const current = [row];
    for (let column = 1; column <= b.length; column += 1) {
      current[column] = Math.min(
        current[column - 1] + 1,
        previous[column] + 1,
        previous[column - 1] + (a[row - 1] === b[column - 1] ? 0 : 1),
      );
    }
    previous.splice(0, previous.length, ...current);
  }
  return 1 - previous[b.length] / Math.max(a.length, b.length);
}

async function fetchText(sourceUrl) {
  const response = await fetch(sourceUrl);
  if (!response.ok) throw new Error(`${response.status} while loading ${sourceUrl}`);
  return response.text();
}

function rankingEntries(html) {
  const entries = [];
  for (const match of html.matchAll(/<tr>([\s\S]*?)<\/tr>/gi)) {
    const row = match[1];
    const institutionId = row.match(/<td[^>]*>\s*(IR-E-[A-Z]-\d+)\s*<\/td>/i)?.[1];
    const name = row.match(/<td[^>]*>\s*IR-E-[A-Z]-\d+\s*<\/td>\s*<td[^>]*>(.*?)<div/i)?.[1];
    const pdfUrl = row.match(/https:\/\/www\.nirfindia\.org\/nirfpdfcdn\/2025\/pdf\/Engineering\/[^"']+\.pdf/i)?.[0];
    if (institutionId && name && pdfUrl) {
      entries.push({ institutionId, name: decodeHtml(name), pdfUrl });
    }
  }
  return entries;
}

function parseLatestUgPlacement(text) {
  const start = text.indexOf("UG [4 Years Program(s)]: Placement & higher studies");
  if (start < 0) return null;
  const remainder = text.slice(start + 1);
  const endCandidates = [
    remainder.indexOf("UG [5 Years Program(s)]:"),
    remainder.indexOf("PG [2 Years Program(s)]:"),
    remainder.indexOf("PG-Integrated"),
    remainder.indexOf("Ph.D Student Details"),
  ].filter((index) => index >= 0);
  const section = text.slice(start, start + (endCandidates.length ? Math.min(...endCandidates) + 1 : 5000))
    .replace(/\s+/g, " ");
  const records = [];
  const rowPattern = /(20\d{2}-\d{2})\s+\d+\s+\d+\s+(20\d{2}-\d{2})\s+(?:\d+\s+)?(20\d{2}-\d{2})\s+(\d+)\s+(\d+)\s+(\d+)\s*\([^)]*\)\s+(\d+)/g;
  for (const match of section.matchAll(rowPattern)) {
    records.push({
      academicYear: match[3],
      eligibleStudents: Number(match[4]),
      studentsPlaced: Number(match[5]),
      medianSalary: Number(match[6]),
      studentsHigherStudies: Number(match[7]),
    });
  }
  return records.sort((a, b) => b.academicYear.localeCompare(a.academicYear))[0] ?? null;
}

function sqlString(value) {
  return `'${String(value).replaceAll("'", "''")}'`;
}

async function main() {
  const [
    { data: rankingRows, error: rankingError },
    { data: intakeRows, error: intakeError },
    entriesByPage,
  ] = await Promise.all([
    supabase.from("college_nirf_rankings").select("college_id").eq("ranking_year", 2025),
    supabase
      .from("tnea_college_intakes")
      .select("college_code")
      .eq("admission_year", TNEA_ADMISSION_YEAR)
      .limit(10_000),
    Promise.all(RANKING_PAGES.map(async (page) => rankingEntries(await fetchText(page)))),
  ]);
  if (rankingError) throw new Error(rankingError.message);
  if (intakeError) throw new Error(intakeError.message);

  const collegeIds = [...new Set((rankingRows ?? []).map((row) => row.college_id))];
  const activeCodes = new Set(
    (intakeRows ?? []).map((row) => String(Number(row.college_code))),
  );
  if (!activeCodes.size) {
    throw new Error("Official 2026 TNEA intake scope is empty; refusing a historical fallback.");
  }
  assertTneaCollegeCount(activeCodes.size, "NIRF placement intake");
  const { data: colleges, error: collegeError } = await supabase
    .from("colleges")
    .select("college_id, college_code, college_name")
    .in("college_id", collegeIds);
  if (collegeError) throw new Error(collegeError.message);
  const tneaColleges = (colleges ?? []).filter((college) =>
    activeCodes.has(String(Number(college.college_code))),
  );

  const officialEntries = [...new Map(entriesByPage.flat().map((entry) => [entry.institutionId, entry])).values()];
  const imported = [];
  const review = [];

  for (const college of tneaColleges) {
    const ranked = officialEntries
      .map((entry) => ({ entry, score: matchScore(college.college_name, entry.name) }))
      .sort((a, b) => b.score - a.score);
    const best = ranked[0];
    const runnerUp = ranked[1];
    if (!best || best.score < 0.72 || best.score - (runnerUp?.score ?? 0) < 0.08) {
      review.push({ college, reason: "ambiguous_name_match", candidates: ranked.slice(0, 3) });
      continue;
    }

    try {
      const parser = new PDFParse({ url: best.entry.pdfUrl });
      const result = await parser.getText();
      await parser.destroy();
      const placement = parseLatestUgPlacement(result.text);
      if (!placement) {
        review.push({ college, reason: "ug_placement_row_not_parsed", match: best });
        continue;
      }
      imported.push({ college, match: best, placement });
      console.log(`Prepared ${college.college_code}: ${college.college_name}`);
    } catch (error) {
      review.push({ college, reason: error instanceof Error ? error.message : String(error), match: best });
    }
  }

  const values = imported.map(({ college, match, placement }) => `(
    ${college.college_id}, ${sqlString(placement.academicYear)}, 'ug',
    ${placement.eligibleStudents}, ${placement.studentsPlaced}, ${placement.studentsHigherStudies},
    ${placement.medianSalary}, null, null,
    'nirf_disclosure', true, ${sqlString(match.entry.pdfUrl)}, now()
  )`);
  const sql = values.length === 0 ? "-- No unambiguous NIRF placement records were prepared.\n" : `begin;

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
`;

  await mkdir("data/imports", { recursive: true });
  await writeFile("data/imports/nirf-placement-2025.sql", sql);
  await writeFile("data/imports/nirf-placement-2025-report.json", JSON.stringify({
    generatedAt: new Date().toISOString(),
    sourcePages: RANKING_PAGES,
    prepared: imported,
    needsReview: review,
  }, null, 2));
  console.log(`\nPrepared ${imported.length} records; ${review.length} need review.`);
  console.log("SQL: data/imports/nirf-placement-2025.sql");
  console.log("Report: data/imports/nirf-placement-2025-report.json");
}

await main();
