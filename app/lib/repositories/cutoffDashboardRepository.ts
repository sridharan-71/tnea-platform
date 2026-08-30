import { supabase } from "@/lib/supabase";
import { getActiveTneaOffers } from "@/lib/repositories/tnea2026Repository";

export interface CutoffHistory {
  year: number;
  oc: number | null;
  bc: number | null;
  bcm: number | null;
  mbc: number | null;
  sc: number | null;
  sca: number | null;
  st: number | null;
}

export interface DashboardBranch {
  branch_code: string;
  branch_name: string;
  history: CutoffHistory[];
}

export async function getCollegeCutoffDashboard(
  collegeCode: number,
): Promise<DashboardBranch[]> {
  const [cutoffResult, activeOffers] = await Promise.all([
    supabase
      .from("cutoff_data")
      .select("year, branch_code, branch_name, oc, bc, bcm, mbc, sc, sca, st")
      .eq("college_code", collegeCode)
      .in("year", [2023, 2024, 2025])
      .order("year", { ascending: true }),
    getActiveTneaOffers(),
  ]);

  if (cutoffResult.error) throw new Error(cutoffResult.error.message);
  if (!activeOffers) {
    throw new Error("Official 2026 TNEA intake data is unavailable.");
  }

  const activeBranches = new Set(
    [...activeOffers.values()]
      .filter((offer) => offer.collegeCode === String(collegeCode))
      .map((offer) => offer.branchCode),
  );
  const branches = new Map<string, DashboardBranch>();

  for (const row of cutoffResult.data ?? []) {
    if (!activeBranches.has(row.branch_code)) continue;
    if (!branches.has(row.branch_code)) {
      branches.set(row.branch_code, {
        branch_code: row.branch_code,
        branch_name: row.branch_name,
        history: [],
      });
    }
    branches.get(row.branch_code)!.history.push({
      year: row.year,
      oc: row.oc,
      bc: row.bc,
      bcm: row.bcm,
      mbc: row.mbc,
      sc: row.sc,
      sca: row.sca,
      st: row.st,
    });
  }

  return [...branches.values()];
}
