import { supabase } from "@/lib/supabase";
import type { CutoffCategory, DistrictMatch, RecommendationCandidate } from "@/lib/recommendations/types";
import { getActiveTneaOffers } from "@/lib/repositories/tnea2026Repository";

interface RecommendationQuery {
  districts: string[];
  branches: string[];
  category: CutoffCategory;
  rankCategory: keyof Pick<CutoffRow, "oc" | "bc" | "bcm" | "mbc" | "sc" | "sca" | "st">;
}

interface CutoffRow {
  year: number; college_code: number; college_name: string; college_type: string;
  district: string; branch_code: string; branch_name: string;
  oc?: number | null; bc?: number | null; bcm?: number | null; mbc?: number | null;
  sc?: number | null; sca?: number | null; st?: number | null;
}

interface RankRow {
  year: number; college_code: number; branch_code: string;
  oc?: number | null; bc?: number | null; bcm?: number | null; mbc?: number | null;
  sc?: number | null; sca?: number | null; st?: number | null;
}

interface CollegeMetadataRow {
  college_id: number; college_code: string; website: string | null; minority_status: boolean | null;
}

interface HostelRow { college_id: number; accommodation_available: boolean }

interface RecommendationMetadata {
  website: string | null; minorityStatus: boolean | null; hostelAvailable: boolean | null;
}

const DISTRICT_NAMES: Record<string, string[]> = {
  CHENGALPATTU: ["CHENGALPET"], KANNIYAKUMARI: ["KANYAKUMARI"],
  NILGIRIS: ["THE NILGIRIS"], THOOTHUKUDI: ["TUTICORIN"],
  TIRUCHIRAPPALLI: ["TIRUCHIRAPALLI", "TRICHIRAPPALLI"], TIRUPATHUR: ["THIRUPATHUR"],
  TIRUVALLUR: ["THIRUVALLUR"], TIRUVANNAMALAI: ["THIRUVANNAMALAI"], VILUPPURAM: ["VILUPPURAM"],
};

function databaseDistricts(value: string) {
  const normalized = value.trim().toUpperCase();
  return DISTRICT_NAMES[normalized] ?? [normalized];
}

function districtScope(districts: string[]) {
  const anywhere = districts.some((district) => district.toLowerCase() === "anywhere in tamil nadu");
  const selected = new Set(districts
    .filter((district) => district.toLowerCase() !== "anywhere in tamil nadu")
    .flatMap(databaseDistricts));
  const nearby = new Set<string>();
  if (selected.has("CHENNAI")) {
    nearby.add("CHENGALPET"); nearby.add("KANCHEEPURAM"); nearby.add("THIRUVALLUR");
  }
  return { anywhere, selected, nearby };
}

function districtMatch(district: string, scope: ReturnType<typeof districtScope>): DistrictMatch {
  if (scope.anywhere || scope.selected.has(district)) return "selected";
  if (scope.nearby.has(district)) return "nearby";
  return "statewide";
}

function branchScope(branches: string[]) {
  // Related specializations are discovery suggestions, not automatic
  // substitutes. Only branches explicitly selected by the student may rank.
  const preferenceByBranch = new Map(branches.map((branch) => [branch, branch]));
  return { preferenceByBranch, query: [...preferenceByBranch.keys()] };
}

async function getCutoffRows(branches: string[], category: CutoffCategory) {
  const rows: CutoffRow[] = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase.from("cutoff_data")
      .select(`year, college_code, college_name, college_type, district, branch_code, branch_name, ${category}`)
      .in("year", [2025, 2024, 2023]).in("branch_code", branches)
      .order("year", { ascending: false }).range(from, from + 999);
    if (error) throw new Error(error.message);
    rows.push(...(data as CutoffRow[]));
    if (!data || data.length < 1000) break;
  }
  return rows;
}

async function getRankRows(branches: string[], category: RecommendationQuery["rankCategory"]) {
  const rows: RankRow[] = [];
  const columns = category === "oc" ? "year, college_code, branch_code, oc" : `year, college_code, branch_code, oc, ${category}`;
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase.from("rank_data")
      .select(columns)
      .in("year", [2025, 2024, 2023]).in("branch_code", branches)
      .order("year", { ascending: false }).range(from, from + 999);
    if (error) throw new Error(error.message);
    rows.push(...((data ?? []) as unknown as RankRow[]));
    if (!data || data.length < 1000) break;
  }
  return rows;
}

async function getRecommendationMetadata(collegeCodes: string[]) {
  const metadata = new Map<string, RecommendationMetadata>();
  if (!collegeCodes.length) return metadata;
  const collegeResult = await supabase.from("colleges")
    .select("college_id, college_code, website, minority_status").in("college_code", collegeCodes);
  if (collegeResult.error) throw new Error(collegeResult.error.message);
  const colleges = (collegeResult.data ?? []) as CollegeMetadataRow[];
  const ids = colleges.map((college) => college.college_id);
  const hostelResult = ids.length
    ? await supabase.from("hostel_facilities").select("college_id, accommodation_available").in("college_id", ids)
    : { data: [], error: null };
  if (hostelResult.error) throw new Error(hostelResult.error.message);
  const hostels = new Map<number, boolean>();
  for (const row of (hostelResult.data ?? []) as HostelRow[]) {
    hostels.set(row.college_id, (hostels.get(row.college_id) ?? false) || row.accommodation_available);
  }
  for (const college of colleges) {
    metadata.set(String(Number(college.college_code)), {
      website: college.website,
      minorityStatus: college.minority_status,
      hostelAvailable: hostels.has(college.college_id) ? hostels.get(college.college_id)! : null,
    });
  }
  return metadata;
}

export async function getRecommendationCandidates({ districts, branches, category, rankCategory }: RecommendationQuery): Promise<RecommendationCandidate[]> {
  const districtsResolved = districtScope(districts);
  const branchesResolved = branchScope(branches);
  const [cutoffs, rankRows, active2026Offers] = await Promise.all([
    getCutoffRows(branchesResolved.query, category), getRankRows(branchesResolved.query, rankCategory),
    getActiveTneaOffers(),
  ]);
  if (!active2026Offers) {
    throw new Error("Official 2026 TNEA intake data is unavailable; refusing to recommend historical colleges.");
  }
  // A college is eligible only through a branch the student explicitly said
  // they would accept and that is active in the official 2026 seat matrix.
  const activeCutoffs = cutoffs.filter((row) =>
    active2026Offers.has(`${Number(row.college_code)}-${row.branch_code}`),
  );
  const metadata = await getRecommendationMetadata([...new Set(activeCutoffs.map((row) => String(row.college_code)))]);
  const ranks = new Map<string, number>();
  const categoryRanks = new Map<string, number>();
  for (const row of rankRows) {
    const key = `${row.college_code}-${row.branch_code}-${row.year}`;
    if (typeof row.oc === "number") ranks.set(key, row.oc);
    const categoryValue = row[rankCategory];
    if (typeof categoryValue === "number") categoryRanks.set(key, categoryValue);
  }
  const histories = new Map<string, CutoffRow[]>();
  for (const row of activeCutoffs) {
    const key = `${row.college_code}-${row.branch_code}`;
    histories.set(key, [...(histories.get(key) ?? []), row]);
  }

  return [...histories.entries()].flatMap(([key, rawHistory]) => {
    const history = [...rawHistory].sort((a, b) => b.year - a.year);
    const row = history[0];
    const cutoffValues = history.map((item) => item[category]).filter((value): value is number => typeof value === "number");
    if (!cutoffValues.length) return [];
    const rankValues = history.map((item) => ranks.get(`${item.college_code}-${item.branch_code}-${item.year}`))
      .filter((value): value is number => typeof value === "number");
    if (!cutoffValues.length && !rankValues.length) return [];
    const cutoffHistory = history.flatMap((item) => {
      const value = item[category];
      return typeof value === "number" ? [{ year: item.year, value }] : [];
    });
    const closingRankHistory = history.flatMap((item) => {
      const value = ranks.get(`${item.college_code}-${item.branch_code}-${item.year}`);
      return typeof value === "number" ? [{ year: item.year, value }] : [];
    });
    const averageCutoff = cutoffValues.length
      ? cutoffValues.reduce((sum, value) => sum + value, 0) / cutoffValues.length
      : null;
    const averageClosingRank = rankValues.length ? rankValues.reduce((sum, value) => sum + value, 0) / rankValues.length : null;
    const cutoffVolatility = cutoffValues.length < 2 || averageCutoff === null ? 1 : Math.max(0.5,
      Math.sqrt(cutoffValues.reduce((sum, value) => sum + (value - averageCutoff) ** 2, 0) / cutoffValues.length));
    const details = metadata.get(String(row.college_code));
    const preferenceCode = branchesResolved.preferenceByBranch.get(row.branch_code) ?? row.branch_code;
    const activeOffer = active2026Offers?.get(`${Number(row.college_code)}-${row.branch_code}`) ?? null;
    return [{
      collegeCode: row.college_code, collegeName: row.college_name, collegeType: row.college_type,
      district: row.district, districtMatch: districtMatch(row.district, districtsResolved),
      branchCode: row.branch_code, branchName: row.branch_name, preferenceCode,
      preferenceIndex: branches.includes(preferenceCode) ? branches.indexOf(preferenceCode) : branches.length,
      dataYear: row.year,
      latestCutoff: typeof row[category] === "number" ? row[category] : null,
      closingRank: ranks.get(`${key}-${row.year}`) ?? averageClosingRank,
      categoryClosingRank: categoryRanks.get(`${key}-${row.year}`) ?? null,
      averageCutoff, averageClosingRank, cutoffVolatility, cutoffYearsAvailable: cutoffValues.length,
      rankYearsAvailable: rankValues.length, cutoffHistory, closingRankHistory,
      website: details?.website ?? null,
      hostelAvailable: details?.hostelAvailable ?? null,
      minorityStatus: details?.minorityStatus ?? null,
      currentAdmissionYear: activeOffer?.admissionYear ?? null,
      currentYearTotalSeats: activeOffer?.totalSeats ?? null,
      currentYearCommunitySeats: activeOffer?.communitySeats[rankCategory] ?? null,
    } satisfies RecommendationCandidate];
  });
}
