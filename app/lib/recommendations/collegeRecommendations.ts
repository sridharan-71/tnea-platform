import type { StudentProfile } from "@/lib/types/student";
import { tneaOverallPriority } from "./tneaCollegePriority";
import type { BranchRecommendation, RecommendationLevel } from "./types";

export const ORDERED_LEVELS: RecommendationLevel[] = ["reach", "target", "safe", "very_safe", "insufficient"];

export interface CollegeRecommendation {
  collegeCode: number;
  collegeName: string;
  collegeType: string;
  district: string;
  districtMatch: BranchRecommendation["districtMatch"];
  website: string | null;
  hostelAvailable: boolean | null;
  level: RecommendationLevel;
  confidence: BranchRecommendation["confidence"];
  overallPriority: number | null;
  cutoffMinimum: number | null;
  cutoffMaximum: number | null;
  closingRankMinimum: number | null;
  closingRankMaximum: number | null;
  rankYearsAvailable: number;
  cutoffYearsAvailable: number;
  rankDifference: number | null;
  explanation: string;
  optionCount: number;
  sourceItems: BranchRecommendation[];
}

export interface CollegeShortlist {
  items: CollegeRecommendation[];
  targetSize: number;
  fullSize: number;
  verySafeCount: number;
  expandedForSafety: boolean;
}

function range(values: Array<number | null>) {
  const available = values.filter((value): value is number => value !== null);
  return available.length
    ? { minimum: Math.min(...available), maximum: Math.max(...available) }
    : { minimum: null, maximum: null };
}

function historyRange(history: Array<{ value: number }>) {
  return range(history.map((point) => point.value));
}

const FEASIBILITY_ORDER: Record<RecommendationLevel, number> = {
  insufficient: -1,
  reach: 0,
  target: 1,
  safe: 2,
  very_safe: 3,
};

function representativeBranch(items: BranchRecommendation[], profile: StudentProfile) {
  return [...items].sort((first, second) => {
    if (profile.choiceOrderingStrategy === "branch_first") {
      return first.preferenceIndex - second.preferenceIndex
        || FEASIBILITY_ORDER[second.level] - FEASIBILITY_ORDER[first.level];
    }
    if (profile.choiceOrderingStrategy === "balanced") {
      const firstScore = FEASIBILITY_ORDER[first.level] * 10 - first.preferenceIndex;
      const secondScore = FEASIBILITY_ORDER[second.level] * 10 - second.preferenceIndex;
      return secondScore - firstScore;
    }
    return FEASIBILITY_ORDER[second.level] - FEASIBILITY_ORDER[first.level]
      || first.preferenceIndex - second.preferenceIndex;
  })[0];
}

export function groupCollegeRecommendations(items: BranchRecommendation[], profile: StudentProfile): CollegeRecommendation[] {
  const groups = new Map<number, BranchRecommendation[]>();
  for (const item of items) groups.set(item.collegeCode, [...(groups.get(item.collegeCode) ?? []), item]);

  return [...groups.values()].map((sourceItems) => {
    const first = sourceItems[0];
    const benchmark = representativeBranch(sourceItems, profile);
    const cutoffs = historyRange(benchmark.cutoffHistory);
    const ranks = historyRange(benchmark.closingRankHistory);
    return {
      collegeCode: first.collegeCode,
      collegeName: first.collegeName,
      collegeType: first.collegeType,
      district: first.district,
      districtMatch: first.districtMatch,
      website: first.website,
      hostelAvailable: first.hostelAvailable,
      level: benchmark.level,
      confidence: benchmark.confidence,
      overallPriority: tneaOverallPriority(first.collegeName),
      cutoffMinimum: cutoffs.minimum,
      cutoffMaximum: cutoffs.maximum,
      closingRankMinimum: ranks.minimum,
      closingRankMaximum: ranks.maximum,
      rankYearsAvailable: benchmark.rankYearsAvailable,
      cutoffYearsAvailable: benchmark.cutoffYearsAvailable,
      rankDifference: benchmark.rankDifference,
      explanation: benchmark.explanation,
      optionCount: sourceItems.length,
      sourceItems,
    };
  });
}

function adaptiveTarget(profile: StudentProfile) {
  if (profile.rank !== null) {
    if (profile.rank <= 10_000) return 25;
    if (profile.rank <= 30_000) return 45;
    if (profile.rank <= 60_000) return 65;
    return 90;
  }
  if (profile.cutoff >= 190) return 25;
  if (profile.cutoff >= 170) return 40;
  if (profile.cutoff >= 150) return 60;
  return 90;
}

function realisticReach(item: CollegeRecommendation, profile: StudentProfile) {
  if (profile.rank !== null && item.closingRankMaximum !== null) {
    return profile.rank <= item.closingRankMaximum * 1.15;
  }
  return item.cutoffMinimum !== null && profile.cutoff >= item.cutoffMinimum - 3;
}

export function buildCollegeShortlist(colleges: CollegeRecommendation[], profile: StudentProfile): CollegeShortlist {
  const grouped = Object.fromEntries(ORDERED_LEVELS.map((level) => [level, colleges.filter((item) => item.level === level)])) as Record<RecommendationLevel, CollegeRecommendation[]>;
  const targetSize = Math.min(adaptiveTarget(profile), colleges.length);
  const reachBudget = Math.max(5, Math.floor(targetSize * 0.32));
  const targetBudget = Math.max(7, Math.floor(targetSize * 0.36));
  const safeBudget = Math.max(7, targetSize - reachBudget - targetBudget - 3);

  const boldReachLimit = profile.rank !== null && profile.rank <= 30_000 ? 2 : 1;
  const bold = grouped.reach
    .filter((item) => item.overallPriority !== null && !realisticReach(item, profile))
    .slice(0, boldReachLimit);
  const realistic = grouped.reach.filter((item) =>
    realisticReach(item, profile) && !bold.includes(item),
  );
  const reaches = [...bold, ...realistic].slice(0, reachBudget);

  const targets = grouped.target.slice(0, targetBudget);
  const safe = grouped.safe.slice(0, safeBudget);
  const verySafe = grouped.very_safe.slice(0, 3);
  const selected = [...reaches, ...targets, ...safe, ...verySafe];
  const selectedCodes = new Set(selected.map((item) => item.collegeCode));

  // If strict Very Safe evidence is scarce, preserve every available strict
  // result. Never relabel a weaker college merely to reach a quota.
  const expandedForSafety = verySafe.length < 3;
  if (expandedForSafety) {
    for (const item of grouped.very_safe) {
      if (!selectedCodes.has(item.collegeCode)) selected.push(item);
    }
  }

  return {
    items: selected,
    targetSize: selected.length,
    fullSize: colleges.length,
    verySafeCount: selected.filter((item) => item.level === "very_safe").length,
    expandedForSafety,
  };
}

export function orderByAdmissionBand(colleges: CollegeRecommendation[]) {
  return ORDERED_LEVELS.flatMap((level) => colleges.filter((item) => item.level === level));
}
