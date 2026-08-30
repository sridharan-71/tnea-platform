import { unstable_cache } from "next/cache";

import { supabase } from "@/lib/supabase";
import { getActiveTneaCollegeCodes } from "@/lib/repositories/tnea2026Repository";

export interface CollegeSearchResult {
  college_code: number;
  college_name: string;
  district: string;
  college_type: string;
}

const PAGE_SIZE = 1_000;

async function loadUniqueColleges(
  limit: number,
  nameQuery?: string,
): Promise<CollegeSearchResult[]> {
  const activeCodes = await getActiveTneaCollegeCodes();
  if (!activeCodes) {
    throw new Error("Official 2026 TNEA college scope is unavailable.");
  }

  const colleges = new Map<number, CollegeSearchResult>();
  const safeNameQuery = nameQuery?.replace(/[%_]/g, "").trim();
  for (let from = 0; colleges.size < limit; from += PAGE_SIZE) {
    let query = supabase
      .from("cutoff_data")
      .select("college_code, college_name, district, college_type")
      .eq("year", 2025)
      .order("college_code");
    if (safeNameQuery) query = query.ilike("college_name", `%${safeNameQuery}%`);

    const { data, error } = await query.range(from, from + PAGE_SIZE - 1);
    if (error) throw new Error(error.message);

    for (const row of data ?? []) {
      const code = Number(row.college_code);
      if (activeCodes.has(String(code)) && !colleges.has(code)) {
        colleges.set(code, { ...row, college_code: code });
      }
      if (colleges.size >= limit) break;
    }
    if (!data || data.length < PAGE_SIZE) break;
  }

  return [...colleges.values()];
}

export function getFeaturedColleges(limit = 12) {
  return loadUniqueColleges(limit);
}

export function searchColleges(query: string, limit = 10) {
  return loadUniqueColleges(limit, query);
}

export async function getCollegeNamesByCodes(codes: number[]) {
  const uniqueCodes = [...new Set(codes.filter((code) => Number.isInteger(code) && code > 0))].slice(0, 500);
  const names = new Map<number, string>();
  for (let index = 0; index < uniqueCodes.length; index += 100) {
    const batch = uniqueCodes.slice(index, index + 100);
    const { data, error } = await supabase
      .from("cutoff_data")
      .select("college_code, college_name")
      .eq("year", 2025)
      .in("college_code", batch);
    if (error) throw new Error(error.message);
    for (const row of data ?? []) {
      const code = Number(row.college_code);
      if (!names.has(code)) names.set(code, row.college_name);
    }
  }
  return names;
}

export const getCollegeByCode = unstable_cache(
  async (collegeCode: number): Promise<CollegeSearchResult | null> => {
    const activeCodes = await getActiveTneaCollegeCodes();
    if (!activeCodes) {
      throw new Error("Official 2026 TNEA college scope is unavailable.");
    }
    if (!activeCodes.has(String(collegeCode))) return null;

    const { data, error } = await supabase
      .from("cutoff_data")
      .select("college_code, college_name, district, college_type")
      .eq("year", 2025)
      .eq("college_code", collegeCode)
      .limit(1)
      .maybeSingle();
    if (error) throw new Error(error.message);
    return data ? { ...data, college_code: Number(data.college_code) } : null;
  },
  ["college-by-code-v2"],
  { revalidate: 3_600 },
);
