import { unstable_cache } from "next/cache";

import { supabase } from "@/lib/supabase";

const CURRENT_ADMISSION_YEAR = 2026;

export type TneaSeatCategory = "oc" | "bc" | "bcm" | "mbc" | "sc" | "sca" | "st";

interface IntakeRow {
  college_code: string;
  branch_code: string;
  branch_name: string;
  oc_seats: number;
  bc_seats: number;
  bcm_seats: number;
  mbc_seats: number;
  sc_seats: number;
  sca_seats: number;
  st_seats: number;
}

export interface TneaActiveOffer {
  admissionYear: number;
  collegeCode: string;
  branchCode: string;
  branchName: string;
  totalSeats: number;
  communitySeats: Record<TneaSeatCategory, number>;
}

function isMissingRelation(error: { code?: string; message?: string }) {
  return error.code === "42P01"
    || error.code === "PGRST205"
    || error.message?.includes("tnea_college_intakes") === true;
}

const loadActiveOffers = unstable_cache(
  async (): Promise<TneaActiveOffer[] | null> => {
    const offers: TneaActiveOffer[] = [];
    for (let from = 0; ; from += 1000) {
      const { data, error } = await supabase
        .from("tnea_college_intakes")
        .select("college_code, branch_code, branch_name, oc_seats, bc_seats, bcm_seats, mbc_seats, sc_seats, sca_seats, st_seats")
        .eq("admission_year", CURRENT_ADMISSION_YEAR)
        .range(from, from + 999);

      if (error) {
        if (isMissingRelation(error)) return null;
        throw new Error(error.message);
      }
      for (const rawRow of data ?? []) {
        const row = rawRow as IntakeRow;
        const communitySeats = {
          oc: row.oc_seats,
          bc: row.bc_seats,
          bcm: row.bcm_seats,
          mbc: row.mbc_seats,
          sc: row.sc_seats,
          sca: row.sca_seats,
          st: row.st_seats,
        };
        offers.push({
          admissionYear: CURRENT_ADMISSION_YEAR,
          collegeCode: String(Number(row.college_code)),
          branchCode: row.branch_code,
          branchName: row.branch_name,
          totalSeats: Object.values(communitySeats).reduce((sum, seats) => sum + seats, 0),
          communitySeats,
        });
      }
      if (!data || data.length < 1000) break;
    }
    return offers;
  },
  ["tnea-active-offers-2026-v2"],
  { revalidate: 3600 },
);

export async function getActiveTneaOffers(year = CURRENT_ADMISSION_YEAR) {
  if (year !== CURRENT_ADMISSION_YEAR) return null;
  const offers = await loadActiveOffers();
  if (!offers) return null;
  return new Map(offers.map((offer) => [`${offer.collegeCode}-${offer.branchCode}`, offer]));
}

export async function getActiveTneaCollegeCodes(year = CURRENT_ADMISSION_YEAR) {
  if (year !== CURRENT_ADMISSION_YEAR) return null;
  const offers = await loadActiveOffers();
  return offers ? new Set(offers.map((offer) => offer.collegeCode)) : null;
}

export async function getActiveTneaBranchOptions(year = CURRENT_ADMISSION_YEAR) {
  if (year !== CURRENT_ADMISSION_YEAR) return [];
  const offers = await loadActiveOffers();
  if (!offers) return [];
  const branches = new Map<string, string>();
  for (const offer of offers) {
    if (!branches.has(offer.branchCode)) branches.set(offer.branchCode, offer.branchName);
  }
  return [...branches.entries()]
    .map(([code, name]) => ({ code, name }))
    .sort((first, second) => first.name.localeCompare(second.name));
}
