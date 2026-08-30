import type { CollegeExclusion, StudentProfile } from "@/lib/types/student";
import type {
  BranchRecommendation, RecommendationCandidate, RecommendationConfidence, RecommendationLevel,
} from "./types";
import { tneaOverallPriority } from "./tneaCollegePriority";

function clamp(value: number, minimum = 0, maximum = 100) {
  return Math.max(minimum, Math.min(maximum, value));
}

function shouldExclude(item: RecommendationCandidate, exclusions: CollegeExclusion[]) {
  const name = item.collegeName.toLowerCase();
  if (exclusions.includes("women_only") && /women|women's|girls/.test(name)) return true;
  if (exclusions.includes("minority") && item.minorityStatus === true) return true;
  if (exclusions.includes("no_hostel") && item.hostelAvailable === false) return true;
  return false;
}

function confidenceFor(years: number): { confidence: RecommendationConfidence; reasons: string[] } {
  if (years >= 3) return { confidence: "medium", reasons: ["Three recent admission years are available"] };
  if (years === 2) return { confidence: "low", reasons: ["Only two recent admission years are available"] };
  return { confidence: "limited", reasons: ["Only one recent admission year is available"] };
}

function adaptiveRankBuffer(values: number[]) {
  if (values.length < 2) return 0.2;
  const ordered = [...values].sort((a, b) => a - b);
  const median = ordered[Math.floor(ordered.length / 2)];
  const observedVariation = (ordered[ordered.length - 1] - ordered[0]) / Math.max(1, median);
  return Math.min(0.35, Math.max(0.15, observedVariation));
}

function rankBand(studentRank: number, history: Array<{ year: number; value: number }>) {
  const values = history.map((point) => point.value);
  if (!values.length) return { level: "insufficient" as const, buffer: null, wins: 0 };
  const wins = values.filter((closingRank) => studentRank <= closingRank).length;
  const buffer = adaptiveRankBuffer(values);
  const toughestYear = Math.min(...values);
  const clearsBufferedToughestYear = studentRank <= toughestYear * (1 - buffer);
  if (values.length >= 3 && wins === values.length && clearsBufferedToughestYear) {
    return { level: "very_safe" as const, buffer, wins };
  }
  if (wins >= Math.min(2, values.length) && values.length >= 2) return { level: "safe" as const, buffer, wins };
  if (wins >= 1) return { level: "target" as const, buffer, wins };
  return { level: "reach" as const, buffer, wins };
}

function cutoffBand(studentCutoff: number, history: Array<{ year: number; value: number }>, volatility: number): RecommendationLevel {
  if (!history.length) return "insufficient";
  const values = history.map((point) => point.value);
  const wins = values.filter((closingCutoff) => studentCutoff >= closingCutoff).length;
  const toughestYear = Math.max(...values);
  const extraBuffer = Math.max(1.5, volatility * 1.5);
  if (values.length >= 3 && wins === values.length && studentCutoff >= toughestYear + extraBuffer) return "very_safe";
  if (wins >= Math.min(2, values.length) && values.length >= 2) return "safe";
  if (wins >= 1) return "target";
  return "reach";
}

function rankMatchScore(studentRank: number, averageClosingRank: number | null) {
  if (averageClosingRank === null) return 0;
  const margin = (averageClosingRank - studentRank) / Math.max(averageClosingRank, 1);
  return clamp(Math.round(62 + margin * 100), 5, 98);
}

export function scoreRecommendations(candidates: RecommendationCandidate[], profile: StudentProfile): BranchRecommendation[] {
  const recommendations = candidates.filter((candidate) =>
    !shouldExclude(candidate, profile.excludedCollegeTraits)
    && (profile.locationFlexibility !== "selected_only" || candidate.districtMatch === "selected"),
  ).map((candidate) => {
    const cutoffDifference = candidate.averageCutoff === null
      ? 0
      : Number((profile.cutoff - candidate.averageCutoff).toFixed(2));
    const rankDifference = candidate.averageClosingRank === null || profile.rank === null
      ? null
      : Math.round(candidate.averageClosingRank - profile.rank);
    const rankResult = profile.rank === null ? null : rankBand(profile.rank, candidate.closingRankHistory);
    const level = rankResult?.level ?? cutoffBand(profile.cutoff, candidate.cutoffHistory, candidate.cutoffVolatility);
    const evidenceYears = profile.rank === null ? candidate.cutoffYearsAvailable : candidate.rankYearsAvailable;
    const confidence = confidenceFor(evidenceYears);
    const matchScore = profile.rank === null
      ? clamp(Math.round(60 + cutoffDifference * 5), 5, 98)
      : rankMatchScore(profile.rank, candidate.averageClosingRank);
    const explanation = profile.rank !== null
      ? level === "insufficient"
        ? "Verified OC closing-rank history is unavailable, so CampusAI did not guess an admission band."
        : `Your general rank cleared this benchmark in ${rankResult?.wins ?? 0} of ${candidate.closingRankHistory.length} recent years${rankResult?.buffer ? `; Very Safe additionally requires a ${Math.round(rankResult.buffer * 100)}% buffer against the toughest year` : ""}.`
      : `Overall rank was unavailable. Your community cutoff cleared this benchmark in ${candidate.cutoffHistory.filter((point) => profile.cutoff >= point.value).length} of ${candidate.cutoffHistory.length} recent years.`;
    return {
      ...candidate,
      level,
      matchScore,
      cutoffDifference,
      rankDifference,
      confidence: confidence.confidence,
      confidenceReasons: confidence.reasons,
      dataWarnings: [
        "This is historical evidence, not guaranteed admission",
        ...(profile.rank === null ? ["Overall rank was unavailable; community cutoff is the fallback"] : []),
      ],
      algorithmVersion: "admission-fit-v3.0.0-rank-first" as const,
      explanation,
    };
  });

  const demandByCollege = new Map<number, number>();
  const cutoffsByCollege = new Map<number, number[]>();
  for (const item of recommendations) {
    if (item.averageCutoff === null) continue;
    cutoffsByCollege.set(item.collegeCode, [...(cutoffsByCollege.get(item.collegeCode) ?? []), item.averageCutoff]);
  }
  for (const [collegeCode, values] of cutoffsByCollege) {
    const strongest = [...values].sort((a, b) => b - a).slice(0, 2);
    demandByCollege.set(collegeCode, strongest.reduce((sum, value) => sum + value, 0) / strongest.length);
  }

  const collegeDemand = (item: BranchRecommendation) => demandByCollege.get(item.collegeCode) ?? -1;
  const compareColleges = (first: BranchRecommendation, second: BranchRecommendation) => {
    const firstPriority = tneaOverallPriority(first.collegeName);
    const secondPriority = tneaOverallPriority(second.collegeName);
    if (firstPriority !== null || secondPriority !== null) {
      if (firstPriority === null) return 1;
      if (secondPriority === null) return -1;
      if (firstPriority !== secondPriority) return firstPriority - secondPriority;
    }
    return collegeDemand(second) - collegeDemand(first)
      || first.collegeName.localeCompare(second.collegeName);
  };
  return recommendations.sort((first, second) =>
    compareColleges(first, second) || first.preferenceIndex - second.preferenceIndex,
  );
}
