import type { CommunityKey, StudentProfile } from "@/lib/types/student";

export type RecommendationLevel = "reach" | "target" | "safe" | "very_safe" | "insufficient";
export type RecommendationConfidence = "medium" | "low" | "limited";
export type CutoffCategory = CommunityKey;
export type DistrictMatch = "selected" | "nearby" | "statewide";

export type RecommendationRequest = Pick<StudentProfile,
  "cutoff" | "rank" | "community" | "preferredDistricts" | "preferredBranches" |
  "rankStatus" | "locationFlexibility" | "livingArrangement" |
  "choiceOrderingStrategy" |
  "recommendationMode" | "excludedCollegeTraits">;

export interface RecommendationCandidate {
  collegeCode: number;
  collegeName: string;
  collegeType: string;
  district: string;
  districtMatch: DistrictMatch;
  branchCode: string;
  branchName: string;
  preferenceCode: string;
  dataYear: number;
  latestCutoff: number | null;
  closingRank: number | null;
  categoryClosingRank: number | null;
  averageCutoff: number | null;
  averageClosingRank: number | null;
  cutoffVolatility: number;
  cutoffYearsAvailable: number;
  rankYearsAvailable: number;
  cutoffHistory: Array<{ year: number; value: number }>;
  closingRankHistory: Array<{ year: number; value: number }>;
  preferenceIndex: number;
  website: string | null;
  hostelAvailable: boolean | null;
  minorityStatus: boolean | null;
  currentAdmissionYear: number | null;
  currentYearTotalSeats: number | null;
  currentYearCommunitySeats: number | null;
}

export interface BranchRecommendation extends RecommendationCandidate {
  level: RecommendationLevel;
  matchScore: number;
  cutoffDifference: number;
  rankDifference: number | null;
  confidence: RecommendationConfidence;
  confidenceReasons: string[];
  dataWarnings: string[];
  algorithmVersion: "admission-fit-v3.0.0-rank-first";
  explanation: string;
}
