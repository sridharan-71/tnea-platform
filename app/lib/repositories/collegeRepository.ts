import { supabase } from "@/lib/supabase";
import { unstable_cache } from "next/cache";

export interface CollegeSearchResult {
  college_code: number;
  college_name: string;
  district: string;
  college_type: string;
}


export async function getFeaturedColleges(
  limit: number = 12
): Promise<CollegeSearchResult[]> {

  const { data, error } = await supabase
    .from("cutoff_data")
    .select(`
      college_code,
      college_name,
      district,
      college_type
    `)
    .eq("year", 2025)
    .order("college_code")
    .limit(500);


  if (error) {
    throw new Error(error.message);
  }


  const unique = new Map<number, CollegeSearchResult>();


  for (const college of data) {
    if (!unique.has(college.college_code)) {
      unique.set(college.college_code, college);
    }
  }


  return [...unique.values()].slice(0, limit);
}



export async function searchColleges(
  query: string,
  limit: number = 10
): Promise<CollegeSearchResult[]> {

  const { data, error } = await supabase
    .from("cutoff_data")
    .select(`
      college_code,
      college_name,
      district,
      college_type
    `)
    .eq("year", 2025)
    .ilike("college_name", `%${query}%`)
    .order("college_code")
    .limit(500);


  if (error) {
    throw new Error(error.message);
  }


  const unique = new Map<number, CollegeSearchResult>();


  for (const college of data) {
    if (!unique.has(college.college_code)) {
      unique.set(college.college_code, college);
    }
  }


  return [...unique.values()].slice(0, limit);
}




export const getCollegeByCode = unstable_cache(
  async (
    collegeCode: number
  ): Promise<CollegeSearchResult | null> => {

    const { data, error } = await supabase
      .from("cutoff_data")
      .select(`
        college_code,
        college_name,
        district,
        college_type
      `)
      .eq("year", 2025)
      .eq("college_code", collegeCode)
      .limit(1)
      .single();


    if (error) {

      if (error.code === "PGRST116") {
        return null;
      }

      throw new Error(error.message);
    }


    return data;

  },
  ["college-by-code"],
  {
    revalidate: 3600,
  }
);