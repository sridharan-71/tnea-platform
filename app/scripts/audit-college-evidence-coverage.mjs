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

async function allRows(table, select, configure = (query) => query) {
  const rows = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await configure(supabase.from(table).select(select)).range(from, from + 999);
    if (error) throw new Error(`${table}: ${error.message}`);
    rows.push(...(data ?? []));
    if (!data || data.length < 1000) return rows;
  }
}

function csvCell(value) {
  if (value == null) return "";
  const text = Array.isArray(value) ? value.join(" | ") : String(value);
  return /[",\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text;
}

async function main() {
  const intakes = await allRows(
    "tnea_college_intakes",
    "college_code, college_name",
    (query) => query.eq("admission_year", TNEA_ADMISSION_YEAR),
  );
  const activeCodes = [...new Set(intakes.map((row) => String(Number(row.college_code))))];
  if (!activeCodes.length) {
    throw new Error("Official 2026 TNEA intake scope is empty; refusing a historical fallback.");
  }
  assertTneaCollegeCount(activeCodes.length, "Evidence audit intake");
  const intakeNamesByCode = new Map(
    intakes.map((row) => [String(Number(row.college_code)), row.college_name]),
  );
  const intakeSource = "official_2026_intake";
  const colleges = await allRows(
    "colleges",
    "college_id, college_code, college_name, autonomous_status, website",
    (query) => query.in("college_code", activeCodes),
  );
  const matchedCodes = new Set(colleges.map((college) => String(Number(college.college_code))));
  const unmatchedColleges = activeCodes
    .filter((code) => !matchedCodes.has(code))
    .map((code) => ({ collegeCode: code, collegeName: intakeNamesByCode.get(code) ?? null }));
  assertTneaCollegeCount(colleges.length, "Evidence audit college match");
  const ids = colleges.map((college) => college.college_id);
  const [cutoffs, ranks, placements, nirf, accreditations, hostels, facilities] = await Promise.all([
    allRows("cutoff_data", "year, college_code, branch_code, branch_name, oc", (query) => query.in("college_code", activeCodes).in("year", [2023, 2024, 2025])),
    allRows("rank_data", "year, college_code, branch_code, oc", (query) => query.in("college_code", activeCodes).in("year", [2023, 2024, 2025])),
    allRows("college_placement_statistics", "college_id, academic_year, eligible_students, students_placed, placement_percentage, median_salary, average_salary, highest_salary, source_url, source_confidence, last_verified_at", (query) => query.in("college_id", ids)),
    allRows("college_nirf_rankings", "college_id, ranking_year, exact_rank, rank_band, source_url, last_verified_at", (query) => query.in("college_id", ids).eq("category", "engineering")),
    allRows("college_accreditations", "college_id, accreditation_body, grade, source_url, last_verified_at", (query) => query.in("college_id", ids)),
    allRows("hostel_facilities", "college_id, accommodation_available, source_url, last_verified_at", (query) => query.in("college_id", ids)),
    allRows("college_facilities", "college_id, facility_name, is_available, source_url, last_verified_at", (query) => query.in("college_id", ids)),
  ]);

  const byCode = (rows) => {
    const result = new Map();
    for (const row of rows) {
      const key = String(Number(row.college_code));
      result.set(key, [...(result.get(key) ?? []), row]);
    }
    return result;
  };
  const byId = (rows) => {
    const result = new Map();
    for (const row of rows) result.set(row.college_id, [...(result.get(row.college_id) ?? []), row]);
    return result;
  };
  const cutoffByCode = byCode(cutoffs);
  const rankByCode = byCode(ranks);
  const placementById = byId(placements);
  const nirfById = byId(nirf);
  const accreditationById = byId(accreditations);
  const hostelById = byId(hostels);
  const facilityById = byId(facilities);

  const records = colleges.map((college) => {
    const code = String(Number(college.college_code));
    const cutoffRows = cutoffByCode.get(code) ?? [];
    const latestYear = Math.max(0, ...cutoffRows.map((row) => row.year));
    const latestCutoffs = cutoffRows.filter((row) => row.year === latestYear && typeof row.oc === "number");
    const strongest = latestCutoffs.sort((a, b) => b.oc - a.oc)[0] ?? null;
    const matchingRank = strongest
      ? (rankByCode.get(code) ?? []).find((row) => row.year === strongest.year && row.branch_code === strongest.branch_code)
      : null;
    const placementRows = (placementById.get(college.college_id) ?? []).sort((a, b) => b.academic_year.localeCompare(a.academic_year));
    const latestWith = (key) => placementRows.find((row) => row[key] !== null)?.[key] ?? null;
    const placed = latestWith("students_placed");
    const eligible = latestWith("eligible_students");
    const nirfRow = (nirfById.get(college.college_id) ?? []).sort((a, b) => b.ranking_year - a.ranking_year)[0] ?? null;
    const naac = (accreditationById.get(college.college_id) ?? []).find((row) => /naac/i.test(row.accreditation_body)) ?? null;
    const hostelRows = hostelById.get(college.college_id) ?? [];
    const facilityRows = (facilityById.get(college.college_id) ?? []).filter((row) => row.is_available !== false);
    const fieldPresence = {
      highestCutoff: strongest?.oc != null,
      closingRank: matchingRank?.oc != null,
      programs: latestCutoffs.length > 0,
      placementRate: latestWith("placement_percentage") != null || (eligible > 0 && placed !== null),
      medianSalary: latestWith("median_salary") != null,
      averageSalary: latestWith("average_salary") != null,
      highestSalary: latestWith("highest_salary") != null,
      nirfEngineering: nirfRow != null,
      naacGrade: naac?.grade != null,
      autonomous: college.autonomous_status != null,
      hostelAvailable: hostelRows.length > 0,
      facilities: facilityRows.length > 0,
      website: Boolean(college.website),
    };
    const missingFields = Object.entries(fieldPresence).filter(([, present]) => !present).map(([field]) => field);
    const evidenceRows = [...placementRows, ...(nirfRow ? [nirfRow] : []), ...(naac ? [naac] : []), ...hostelRows, ...facilityRows]
      .filter((row) => row.source_url);
    const evidenceSources = [...new Set(evidenceRows.map((row) => row.source_url))];
    const hasHighConfidenceEvidence = Boolean(nirfRow?.source_url)
      || Boolean(naac?.source_url?.includes("naac.gov.in"))
      || placementRows.some((row) => row.source_confidence === "high");
    const evidenceConfidence = hasHighConfidenceEvidence ? "high" : evidenceSources.length ? "medium" : "unknown";
    return {
      collegeCode: code,
      collegeName: college.college_name,
      highestCutoff: strongest?.oc ?? null,
      competitiveBranch: strongest?.branch_code ?? null,
      cutoffYear: strongest?.year ?? null,
      closingRank: matchingRank?.oc ?? null,
      programs: new Set(latestCutoffs.map((row) => row.branch_code)).size,
      placementRate: latestWith("placement_percentage")
        ?? (eligible > 0 && placed !== null ? Number(((placed / eligible) * 100).toFixed(2)) : null),
      medianSalary: latestWith("median_salary"),
      averageSalary: latestWith("average_salary"),
      highestSalary: latestWith("highest_salary"),
      placementYears: new Set(placementRows.map((row) => row.academic_year)).size,
      nirfEngineering: nirfRow?.exact_rank ?? nirfRow?.rank_band ?? null,
      nirfYear: nirfRow?.ranking_year ?? null,
      naacGrade: naac?.grade ?? null,
      autonomous: college.autonomous_status,
      hostelAvailable: hostelRows.length ? hostelRows.some((row) => row.accommodation_available) : null,
      facilities: [...new Set(facilityRows.map((row) => row.facility_name))],
      website: college.website,
      evidenceConfidence,
      evidenceSourceCount: evidenceSources.length,
      evidenceSources,
      missingFields,
      dataCoveragePercent: Math.round(((Object.keys(fieldPresence).length - missingFields.length) / Object.keys(fieldPresence).length) * 100),
    };
  }).sort((a, b) => Number(a.collegeCode) - Number(b.collegeCode));

  const fields = [
    "highestCutoff", "closingRank", "programs", "placementRate", "medianSalary", "averageSalary",
    "highestSalary", "nirfEngineering", "naacGrade", "autonomous", "hostelAvailable", "facilities", "website",
  ];
  const coverage = Object.fromEntries(fields.map((field) => [field, records.filter((record) => {
    const value = record[field];
    return Array.isArray(value) ? value.length > 0 : value !== null && value !== "";
  }).length]));
  const confidence = Object.fromEntries(["high", "medium", "low", "unknown"].map((level) => [
    level, records.filter((record) => record.evidenceConfidence === level).length,
  ]));
  const completeness = {
    complete: records.filter((record) => record.dataCoveragePercent === 100).length,
    strong: records.filter((record) => record.dataCoveragePercent >= 70 && record.dataCoveragePercent < 100).length,
    partial: records.filter((record) => record.dataCoveragePercent >= 40 && record.dataCoveragePercent < 70).length,
    sparse: records.filter((record) => record.dataCoveragePercent < 40).length,
  };
  const summary = {
    generatedAt: new Date().toISOString(),
    admissionYear: TNEA_ADMISSION_YEAR,
    scope: TNEA_SCOPE,
    intakeSource,
    activeCollegeCodes: activeCodes.length,
    matchedColleges: records.length, unmatchedCollegeCount: unmatchedColleges.length,
    unmatchedColleges, coverage, confidence, completeness,
  };
  const headers = Object.keys(records[0] ?? {});
  const csv = [headers.join(","), ...records.map((record) => headers.map((header) => csvCell(record[header])).join(","))].join("\n");
  await mkdir("data/reports", { recursive: true });
  await writeFile("data/reports/college-evidence-coverage-2026.json", JSON.stringify({ summary, records }, null, 2));
  await writeFile("data/reports/college-evidence-coverage-2026.csv", `${csv}\n`);
  console.log(JSON.stringify(summary, null, 2));
}

await main();
