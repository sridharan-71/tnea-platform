import { mkdir, writeFile } from "node:fs/promises";

import { createClient } from "@supabase/supabase-js";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!url || !key) throw new Error("Missing Supabase public environment variables.");

const supabase = createClient(url, key);
const CATEGORIES = ["oc", "bc", "bcm", "mbc", "sc", "sca", "st"];

async function allRows() {
  const rows = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase.from("rank_data")
      .select("year, college_code, branch_code, oc, bc, bcm, mbc, sc, sca, st")
      .in("year", [2023, 2024, 2025])
      .range(from, from + 999);
    if (error) throw new Error(error.message);
    rows.push(...(data ?? []));
    if (!data || data.length < 1000) return rows;
  }
}

function keyOf(row) {
  return `${row.year}-${Number(row.college_code)}-${row.branch_code}`;
}

function valuesOf(row) {
  return Object.fromEntries(CATEGORIES.map((category) => [category, row[category] ?? null]));
}

function signature(row) {
  return JSON.stringify(valuesOf(row));
}

async function main() {
  const rows = await allRows();
  const groups = new Map();
  for (const row of rows) groups.set(keyOf(row), [...(groups.get(keyOf(row)) ?? []), row]);

  const duplicateGroups = [...groups.entries()].filter(([, group]) => group.length > 1);
  const identicalDuplicates = duplicateGroups.filter(([, group]) => new Set(group.map(signature)).size === 1);
  const conflictingDuplicates = duplicateGroups.filter(([, group]) => new Set(group.map(signature)).size > 1);
  const nullOnlyRows = rows.filter((row) => CATEGORIES.every((category) => row[category] == null));
  const byYear = Object.fromEntries([2023, 2024, 2025].map((year) => {
    const yearRows = rows.filter((row) => row.year === year);
    const yearKeys = new Set(yearRows.map(keyOf));
    return [year, {
      rows: yearRows.length,
      uniqueKeys: yearKeys.size,
      duplicateRows: yearRows.length - yearKeys.size,
      nullOnlyRows: yearRows.filter((row) => CATEGORIES.every((category) => row[category] == null)).length,
    }];
  }));

  const report = {
    summary: {
      generatedAt: new Date().toISOString(),
      years: [2023, 2024, 2025],
      totalRows: rows.length,
      uniqueKeys: groups.size,
      duplicateKeyCount: duplicateGroups.length,
      duplicateRowCount: rows.length - groups.size,
      identicalDuplicateKeyCount: identicalDuplicates.length,
      conflictingDuplicateKeyCount: conflictingDuplicates.length,
      nullOnlyRowCount: nullOnlyRows.length,
      rankColumnSemantics: "unverified",
      roundSemantics: "unverified",
      sourceProvenanceAvailableInQuery: false,
      byYear,
    },
    conflictingDuplicates: conflictingDuplicates.map(([key, group]) => ({
      key,
      occurrences: group.length,
      variants: [...new Map(group.map((row) => [signature(row), valuesOf(row)])).values()],
    })),
    identicalDuplicateSamples: identicalDuplicates.slice(0, 100).map(([key, group]) => ({
      key,
      occurrences: group.length,
      values: valuesOf(group[0]),
    })),
    nullOnlySamples: nullOnlyRows.slice(0, 100).map((row) => ({
      year: row.year,
      collegeCode: String(Number(row.college_code)),
      branchCode: row.branch_code,
    })),
  };

  await mkdir("data/reports", { recursive: true });
  await writeFile("data/reports/rank-data-audit-2023-2025.json", JSON.stringify(report, null, 2));
  console.log(JSON.stringify(report.summary, null, 2));
}

await main();
