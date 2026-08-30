import { mkdir, readFile, writeFile } from "node:fs/promises";
import { existsSync } from "node:fs";

import { PDFParse } from "pdf-parse";
import { createClient } from "@supabase/supabase-js";

const YEAR = 2026;
const EXPECTED = {
  colleges: 418,
  branchOffers: 3_419,
  totalSeats: 179_430,
  firstRank: 1,
  lastRank: 233_812,
};
const SOURCE_DIR = "data/sources/tnea-2026";
const OUTPUT_DIR = "data/imports/tnea-2026";
const RANK_PDF = `${SOURCE_DIR}/general-academic-provisional-rank-list.pdf`;
const SEAT_PDF = `${SOURCE_DIR}/general-academic-seat-matrix-2026-07-20.pdf`;
const RANK_SOURCE = "https://static.tneaonline.org/docs/Academic_2026.pdf?t=1782950400024";
const SEAT_SOURCE = "https://static.tneaonline.org/docs/GENERAL-ACADEMIC-SEAT-MATRIX-AFTER-SPECIAL-RESERVATION-COUNSELLING-2026.pdf";
const TNEA_2026_BRANCH_OVERRIDES = {
  AI: "ARTIFICIAL INTELLIGENCE",
  CB: "COMPUTER SCIENCE AND BUSSINESS SYSTEMS",
  CQ: "COMMUNICATION AND INDUSTRIAL DESIGN",
  CU: "COMPUTER SCIENCE AND ENGINEERING AND BUSSINESS SYSTEMS",
  CV: "COMPUTER SCIENCE AND ENGINEERING (AR/VR AND MEDIA DESIGN)",
  DS: "DATA SCIENCES",
  DV: "DATA VISUALIZATION AND DATA SCIENCE",
  EG: "ELECTRONICS AND COMMUNICATION ENGINEERING (ADVANCED COMMUNICATION TECHNOLOGY)",
  EU: "ELECTRICAL AND COMPUTER ENGINEERING (SS)",
  GL: "GENERATIVE AI AND MACHINE LEARNING",
  VL: "ELECTRONICS AND COMMUNICATION ENGINEEIRNG(VLSI DESIGN AND TECHNOLOGY)",
};

async function download(url, destination) {
  if (existsSync(destination)) return;
  const response = await fetch(url, {
    headers: { "User-Agent": "CampusAI-TNEA-Importer/1.0" },
  });
  if (!response.ok) throw new Error(`${response.status} while downloading ${url}`);
  await writeFile(destination, new Uint8Array(await response.arrayBuffer()));
}

async function pdfText(path) {
  const parser = new PDFParse({ data: new Uint8Array(await readFile(path)) });
  try {
    return (await parser.getText()).text;
  } finally {
    await parser.destroy();
  }
}

function csvCell(value) {
  const text = String(value ?? "");
  return /[",\n\r]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text;
}

function toCsv(headers, rows) {
  return [headers.join(","), ...rows.map((row) => headers.map((header) => csvCell(row[header])).join(","))].join("\n") + "\n";
}

function parseRanks(text) {
  const records = [];
  const rejected = [];
  const rowPattern = /^(\d+)\s+(\d+)\s+(\d{1,3}\.\d{3})\s+(\d+)\s+(OC|BCM|BC|MBC|SCA|SC|ST)(?:\s+(\d+))?\s*$/gm;

  for (const match of text.matchAll(rowPattern)) {
    const serialNumber = Number(match[1]);
    const generalRank = Number(match[4]);
    const record = {
      admission_year: YEAR,
      stream: "general_academic",
      general_rank: generalRank,
      aggregate_mark: Number(match[3]).toFixed(3),
      community: match[5],
      community_rank: match[6] ? Number(match[6]) : "",
      source_url: RANK_SOURCE,
      is_provisional: true,
    };
    if (serialNumber !== generalRank) rejected.push({ serialNumber, generalRank });
    else records.push(record);
  }

  const unique = [...new Map(records.map((record) => [record.general_rank, record])).values()]
    .sort((left, right) => left.general_rank - right.general_rank);
  return { records: unique, rejected };
}

function stripSeatMatrixNoise(text) {
  return text
    .split(/\r?\n/)
    .filter((line) => {
      const value = line.trim();
      return value
        && !value.startsWith("TAMILNADU ENGINEERING ADMISSIONS")
        && !value.startsWith("DIRECTORATE OF TECHNICAL EDUCATION")
        && !value.startsWith("GENERAL ACADEMIC SEAT MATRIX")
        && !value.startsWith("COLLEGE")
        && !value.startsWith("CODE COLLEGE NAME")
        && !value.startsWith("CODE BRAMCH NAME")
        && !/^Page \d+ of \d+$/.test(value)
        && !/^-- \d+ of \d+ --$/.test(value);
    });
}

function normalizeBranchName(value) {
  return value
    .toUpperCase()
    .replaceAll("&", " AND ")
    .replace(/[^A-Z0-9]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function branchNameSimilarity(left, right) {
  const a = normalizeBranchName(left);
  const b = normalizeBranchName(right);
  if (a === b) return 1;
  const aTokens = new Set(a.split(" "));
  const bTokens = new Set(b.split(" "));
  const intersection = [...aTokens].filter((token) => bTokens.has(token)).length;
  const union = new Set([...aTokens, ...bTokens]).size;
  return union ? intersection / union : 0;
}

function identifyBranch(prefix, branchCatalog) {
  const candidates = [];
  for (const match of prefix.matchAll(/\b([A-Z]{2})\b/g)) {
    const code = match[1];
    const expectedNames = branchCatalog.get(code);
    if (!expectedNames) continue;
    const branchName = prefix.slice(match.index + code.length).trim();
    const score = Math.max(...[...expectedNames].map((expected) => branchNameSimilarity(branchName, expected)));
    candidates.push({ code, branchName, collegeName: prefix.slice(0, match.index).trim(), score });
  }
  return candidates.sort((left, right) => right.score - left.score || right.collegeName.length - left.collegeName.length)[0] ?? null;
}

function parseSeatMatrix(text, branchCatalog) {
  const lines = stripSeatMatrixNoise(text);
  const blocks = [];
  let current = [];
  for (const line of lines) {
    const compactCurrent = current.join(" ").replace(/\s+/g, " ").trim();
    const currentIsComplete = /(?:\s\d+){7}$/.test(compactCurrent);
    if (/^\d{1,4}(?:\s|$)/.test(line.trim()) && currentIsComplete) {
      blocks.push(compactCurrent);
      current = [line.trim()];
    } else if (current.length) {
      current.push(line.trim());
    } else {
      current = [line.trim()];
    }
  }
  if (current.length) blocks.push(current.join(" ").replace(/\s+/g, " ").trim());

  const records = [];
  const rejected = [];
  const rowPattern = /^(\d{1,4})\s+(.+?)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)$/;
  for (const block of blocks) {
    const match = block.match(rowPattern);
    if (!match) {
      rejected.push(block);
      continue;
    }
    const branch = identifyBranch(match[2], branchCatalog);
    if (!branch || branch.score < 0.7) {
      rejected.push(block);
      continue;
    }
    records.push({
      admission_year: YEAR,
      college_code: match[1],
      college_name: branch.collegeName,
      branch_code: branch.code,
      branch_name: branch.branchName,
      oc_seats: Number(match[3]),
      bc_seats: Number(match[4]),
      bcm_seats: Number(match[5]),
      mbc_seats: Number(match[6]),
      sc_seats: Number(match[7]),
      sca_seats: Number(match[8]),
      st_seats: Number(match[9]),
      source_url: SEAT_SOURCE,
      source_published_on: "2026-07-20",
    });
  }
  return { records, rejected };
}

function sqlString(value) {
  return `'${String(value).replaceAll("'", "''")}'`;
}

function intakeSql(records) {
  const values = records.map((record) => `(
  ${record.admission_year}, ${sqlString(record.college_code)}, ${sqlString(record.college_name)},
  ${sqlString(record.branch_code)}, ${sqlString(record.branch_name)},
  ${record.oc_seats}, ${record.bc_seats}, ${record.bcm_seats}, ${record.mbc_seats},
  ${record.sc_seats}, ${record.sca_seats}, ${record.st_seats},
  ${sqlString(record.source_url)}, ${sqlString(record.source_published_on)}, now()
)`);
  return `begin;

insert into public.tnea_college_intakes (
  admission_year, college_code, college_name, branch_code, branch_name,
  oc_seats, bc_seats, bcm_seats, mbc_seats, sc_seats, sca_seats, st_seats,
  source_url, source_published_on, last_verified_at
)
values
${values.join(",\n")}
on conflict (admission_year, college_code, branch_code) do update set
  college_name = excluded.college_name,
  branch_name = excluded.branch_name,
  oc_seats = excluded.oc_seats,
  bc_seats = excluded.bc_seats,
  bcm_seats = excluded.bcm_seats,
  mbc_seats = excluded.mbc_seats,
  sc_seats = excluded.sc_seats,
  sca_seats = excluded.sca_seats,
  st_seats = excluded.st_seats,
  source_url = excluded.source_url,
  source_published_on = excluded.source_published_on,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
`;
}

async function currentCollegeCodes() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) return null;
  const supabase = createClient(url, key);
  const rows = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase.from("colleges")
      .select("college_id, college_code, college_name")
      .range(from, from + 999);
    if (error) throw new Error(error.message);
    rows.push(...(data ?? []));
    if (!data || data.length < 1000) break;
  }
  return rows;
}

async function currentBranchCatalog() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) throw new Error("Supabase environment variables are required to validate TNEA branch codes.");
  const supabase = createClient(url, key);
  const rows = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase.from("cutoff_data")
      .select("branch_code, branch_name")
      .range(from, from + 999);
    if (error) throw new Error(error.message);
    rows.push(...(data ?? []));
    if (!data || data.length < 1000) break;
  }
  const catalog = new Map();
  for (const row of rows) {
    const names = catalog.get(row.branch_code) ?? new Set();
    names.add(row.branch_name);
    catalog.set(row.branch_code, names);
  }
  for (const [code, name] of Object.entries(TNEA_2026_BRANCH_OVERRIDES)) {
    const names = catalog.get(code) ?? new Set();
    names.add(name);
    catalog.set(code, names);
  }
  return catalog;
}

async function main() {
  await mkdir(SOURCE_DIR, { recursive: true });
  await mkdir(OUTPUT_DIR, { recursive: true });
  await Promise.all([download(RANK_SOURCE, RANK_PDF), download(SEAT_SOURCE, SEAT_PDF)]);

  console.log("Loading the verified TNEA branch-code catalog...");
  const branchCatalog = await currentBranchCatalog();
  console.log("Extracting the 2026 seat matrix...");
  const seats = parseSeatMatrix(await pdfText(SEAT_PDF), branchCatalog);
  console.log("Extracting the 2026 provisional merit list (this is the large file)...");
  const ranks = parseRanks(await pdfText(RANK_PDF));

  const rankHeaders = [
    "admission_year", "stream", "general_rank", "aggregate_mark", "community",
    "community_rank", "source_url", "is_provisional",
  ];
  const intakeHeaders = [
    "admission_year", "college_code", "college_name", "branch_code", "branch_name",
    "oc_seats", "bc_seats", "bcm_seats", "mbc_seats", "sc_seats", "sca_seats", "st_seats",
    "source_url", "source_published_on",
  ];

  await writeFile(`${OUTPUT_DIR}/tnea-2026-general-academic-merit-ranks.csv`, toCsv(rankHeaders, ranks.records));
  for (let start = 0; start < ranks.records.length; start += 50_000) {
    const part = String(start / 50_000 + 1).padStart(2, "0");
    await writeFile(
      `${OUTPUT_DIR}/tnea-2026-general-academic-merit-ranks-part-${part}.csv`,
      toCsv(rankHeaders, ranks.records.slice(start, start + 50_000)),
    );
  }
  await writeFile(`${OUTPUT_DIR}/tnea-2026-general-academic-seat-matrix.csv`, toCsv(intakeHeaders, seats.records));
  await writeFile(`${OUTPUT_DIR}/tnea-2026-general-academic-seat-matrix.sql`, intakeSql(seats.records));

  const colleges = [...new Map(seats.records.map((record) => [record.college_code, {
    college_code: record.college_code,
    college_name: record.college_name,
  }])).values()].sort((left, right) => Number(left.college_code) - Number(right.college_code));
  const current = await currentCollegeCodes();
  const currentCodes = new Set((current ?? []).map((college) => String(Number(college.college_code))));
  const officialCodes = new Set(colleges.map((college) => String(Number(college.college_code))));
  const duplicateOffers = [];
  const offerKeys = new Set();
  for (const record of seats.records) {
    const key = `${record.admission_year}-${record.college_code}-${record.branch_code}`;
    if (offerKeys.has(key)) duplicateOffers.push(key);
    offerKeys.add(key);
  }
  if (duplicateOffers.length) {
    throw new Error(`Parsed ${duplicateOffers.length} duplicate college/branch offers: ${duplicateOffers.slice(0, 10).join(", ")}`);
  }
  const totalSeats = seats.records.reduce((total, record) => total
    + record.oc_seats + record.bc_seats + record.bcm_seats + record.mbc_seats
    + record.sc_seats + record.sca_seats + record.st_seats, 0);
  const actual = {
    colleges: colleges.length,
    branchOffers: seats.records.length,
    totalSeats,
    firstRank: ranks.records[0]?.general_rank ?? null,
    lastRank: ranks.records.at(-1)?.general_rank ?? null,
  };
  for (const [field, expected] of Object.entries(EXPECTED)) {
    if (actual[field] !== expected) {
      throw new Error(`TNEA 2026 integrity check failed: ${field} expected ${expected}, received ${actual[field]}.`);
    }
  }
  if (seats.rejected.length || ranks.rejected.length) {
    throw new Error(`TNEA 2026 parser rejected ${seats.rejected.length} seat blocks and ${ranks.rejected.length} rank rows.`);
  }
  const newForCampusAi = current ? colleges.filter((college) => !currentCodes.has(String(Number(college.college_code)))) : [];
  const absentFrom2026Matrix = current ? current.filter((college) => !officialCodes.has(String(Number(college.college_code)))) : [];

  const report = {
    generatedAt: new Date().toISOString(),
    sources: { rankList: RANK_SOURCE, seatMatrix: SEAT_SOURCE },
    rankList: {
      records: ranks.records.length,
      firstRank: ranks.records[0] ?? null,
      lastRank: ranks.records.at(-1) ?? null,
      rejected: ranks.rejected.length,
      privacy: "Application numbers were intentionally excluded.",
    },
    seatMatrix: {
      colleges: colleges.length,
      branchOffers: seats.records.length,
      totalCommunitySeats: totalSeats,
      rejectedBlocks: seats.rejected.length,
    },
    campusAiAudit: current ? {
      currentColleges: current.length,
      official2026CollegesMissingFromCampusAi: newForCampusAi,
      campusAiCollegesAbsentFrom2026GeneralAcademicMatrix: absentFrom2026Matrix,
    } : null,
    rejectedSeatMatrixBlocks: seats.rejected.slice(0, 100),
  };
  await writeFile(`${OUTPUT_DIR}/tnea-2026-import-report.json`, JSON.stringify(report, null, 2));
  console.log(JSON.stringify({ rankList: report.rankList, seatMatrix: report.seatMatrix, campusAiAudit: report.campusAiAudit && {
    currentColleges: report.campusAiAudit.currentColleges,
    missing: report.campusAiAudit.official2026CollegesMissingFromCampusAi.length,
    absent: report.campusAiAudit.campusAiCollegesAbsentFrom2026GeneralAcademicMatrix.length,
  } }, null, 2));
}

await main();
