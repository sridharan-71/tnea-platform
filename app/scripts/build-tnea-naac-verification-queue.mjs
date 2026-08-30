import { mkdir, writeFile } from "node:fs/promises";

import { createClient } from "@supabase/supabase-js";

import {
  assertTneaCollegeCount,
  TNEA_ADMISSION_YEAR,
  TNEA_SCOPE,
} from "./lib/tnea-2026-scope.mjs";

const NAAC_DASHBOARD_URL =
  "https://assessmentonline.naac.gov.in/public/index.php/hei_dashboard";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!url || !key) {
  throw new Error("Missing Supabase public environment variables.");
}

const supabase = createClient(url, key);

async function allRows(table, select, configure = (query) => query) {
  const rows = [];

  for (let from = 0; ; from += 1000) {
    const { data, error } = await configure(
      supabase.from(table).select(select),
    ).range(from, from + 999);

    if (error) throw new Error(`${table}: ${error.message}`);
    rows.push(...(data ?? []));

    if (!data || data.length < 1000) return rows;
  }
}

function normalizeCollegeCode(value) {
  const numericCode = Number(value);
  return Number.isFinite(numericCode) ? String(numericCode) : String(value).trim();
}

function csvCell(value) {
  if (value == null) return "";
  const text = String(value);
  return /[",\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text;
}

function accreditationPriority(row) {
  let score = 0;
  if (row.grade) score += 4;
  if (row.cycle) score += 2;
  if (row.valid_upto) score += 2;
  if (row.source_url?.includes("naac.gov.in")) score += 8;
  if (row.last_verified_at) score += 1;
  return score;
}

async function main() {
  const intakes = await allRows(
    "tnea_college_intakes",
    "college_code, college_name",
    (query) => query.eq("admission_year", TNEA_ADMISSION_YEAR),
  );

  const intakeByCode = new Map();
  for (const intake of intakes) {
    const code = normalizeCollegeCode(intake.college_code);
    if (!intakeByCode.has(code)) intakeByCode.set(code, intake.college_name);
  }

  const activeCodes = [...intakeByCode.keys()];
  assertTneaCollegeCount(activeCodes.length, "NAAC verification intake");
  const colleges = await allRows(
    "colleges",
    "college_id, college_code, college_name, district_id, website, is_active",
    (query) => query.in("college_code", activeCodes),
  );
  assertTneaCollegeCount(colleges.length, "NAAC verification college match");

  const collegeIds = colleges.map((college) => college.college_id);
  const accreditations = collegeIds.length
    ? await allRows(
        "college_accreditations",
        "college_id, accreditation_body, accreditation_status, grade, cycle, valid_from, valid_upto, source_url, last_verified_at",
        (query) => query
          .in("college_id", collegeIds)
          .ilike("accreditation_body", "%NAAC%"),
      )
    : [];

  const accreditationByCollegeId = new Map();
  for (const accreditation of accreditations) {
    const current = accreditationByCollegeId.get(accreditation.college_id);
    if (
      !current ||
      accreditationPriority(accreditation) > accreditationPriority(current)
    ) {
      accreditationByCollegeId.set(accreditation.college_id, accreditation);
    }
  }

  const collegeByCode = new Map(
    colleges.map((college) => [normalizeCollegeCode(college.college_code), college]),
  );

  const records = activeCodes
    .map((collegeCode) => {
      const college = collegeByCode.get(collegeCode);
      const accreditation = college
        ? accreditationByCollegeId.get(college.college_id) ?? null
        : null;
      const hasOfficialSource = Boolean(
        accreditation?.source_url?.includes("naac.gov.in"),
      );
      const status = !college
        ? "college_master_missing"
        : !accreditation
          ? "needs_verification"
          : hasOfficialSource
            ? "officially_verified"
            : "needs_official_source_check";

      return {
        collegeCode,
        collegeName: college?.college_name ?? intakeByCode.get(collegeCode) ?? "",
        status,
        grade: accreditation?.grade ?? "",
        cycle: accreditation?.cycle ?? "",
        validFrom: accreditation?.valid_from ?? "",
        validUntil: accreditation?.valid_upto ?? "",
        currentSourceUrl: accreditation?.source_url ?? "",
        collegeWebsite: college?.website ?? "",
        officialNaacDashboard: NAAC_DASHBOARD_URL,
        searchName: college?.college_name ?? intakeByCode.get(collegeCode) ?? "",
      };
    })
    .sort((first, second) => {
      const statusOrder = {
        college_master_missing: 0,
        needs_verification: 1,
        needs_official_source_check: 2,
        officially_verified: 3,
      };
      return (
        statusOrder[first.status] - statusOrder[second.status] ||
        Number(first.collegeCode) - Number(second.collegeCode)
      );
    });

  const counts = Object.fromEntries(
    [...new Set(records.map((record) => record.status))].map((status) => [
      status,
      records.filter((record) => record.status === status).length,
    ]),
  );

  const summary = {
    generatedAt: new Date().toISOString(),
    admissionYear: TNEA_ADMISSION_YEAR,
    scope: TNEA_SCOPE,
    totalTneaColleges: activeCodes.length,
    matchedCollegeMasterRecords: colleges.length,
    counts,
    officialNaacDashboard: NAAC_DASHBOARD_URL,
  };

  const headers = Object.keys(records[0] ?? {});
  const csv = [
    headers.join(","),
    ...records.map((record) =>
      headers.map((header) => csvCell(record[header])).join(","),
    ),
  ].join("\n");

  await mkdir("data/reports", { recursive: true });
  await writeFile(
    "data/reports/tnea-naac-verification-queue-2026.json",
    JSON.stringify({ summary, records }, null, 2),
  );
  await writeFile(
    "data/reports/tnea-naac-verification-queue-2026.csv",
    `${csv}\n`,
  );

  console.log(JSON.stringify(summary, null, 2));
  console.log("CSV: data/reports/tnea-naac-verification-queue-2026.csv");
  console.log("JSON: data/reports/tnea-naac-verification-queue-2026.json");
}

await main();
