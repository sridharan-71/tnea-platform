import { supabase } from "@/lib/supabase";

export interface CollegeCutoff {
  year: number;
  branch_code: number;
  branch_name: string;

  oc: number | null;
  bc: number | null;
  mbc: number | null;
  sc: number | null;
  sca: number | null;
  st: number | null;
}


export async function getCollegeCutoffs(
  collegeCode: number
): Promise<CollegeCutoff[]> {

  const { data, error } = await supabase
    .from("cutoff_data")
    .select(`
      year,
      branch_code,
      branch_name,
      oc,
      bc,
      mbc,
      sc,
      sca,
      st
    `)
    .eq("college_code", collegeCode)
    .order("year", { ascending: false });


  if (error) {
    throw new Error(error.message);
  }


  return data ?? [];
}