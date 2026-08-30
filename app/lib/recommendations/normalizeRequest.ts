import {
  EXCLUSION_OPTIONS,
  RECOMMENDATION_MODES,
  type ChoiceOrderingStrategy,
  type CollegeExclusion,
  type CommunityKey,
  type LivingArrangement,
  type LocationFlexibility,
  type RankStatus,
  type RecommendationMode,
  type StudentProfile,
} from "@/lib/types/student";
import type { RecommendationRequest } from "@/lib/recommendations/types";

const COMMUNITIES = new Set<CommunityKey>(["oc", "bc", "bcm", "mbc", "sc", "sca", "st"]);
const RANK_STATUSES = new Set<RankStatus>(["known", "not_published", "unknown"]);
const LOCATION_OPTIONS = new Set<LocationFlexibility>(["selected_only", "statewide_alternatives", "anywhere"]);
const LIVING_OPTIONS = new Set<LivingArrangement>(["day_scholar", "hostel_required", "hostel_preferred", "either"]);
const ORDERING_OPTIONS = new Set<ChoiceOrderingStrategy>(["college_first", "balanced", "branch_first"]);
const EXCLUSIONS = new Set<CollegeExclusion>(EXCLUSION_OPTIONS.map((option) => option.value));

function cleanStrings(value: unknown, maximum: number, maximumLength: number) {
  if (!Array.isArray(value)) return [];
  return [...new Set(value
    .filter((item): item is string => typeof item === "string")
    .map((item) => item.trim())
    .filter((item) => item.length > 0 && item.length <= maximumLength))]
    .slice(0, maximum);
}

export function normalizeRecommendationRequest(
  value: unknown,
): { profile: StudentProfile | null; error: string | null } {
  if (!value || typeof value !== "object") {
    return { profile: null, error: "The student profile could not be read." };
  }
  const input = value as Partial<RecommendationRequest>;
  const cutoff = typeof input.cutoff === "number" && Number.isFinite(input.cutoff)
    ? input.cutoff : NaN;
  const rank = input.rank === null || input.rank === undefined
    ? null
    : typeof input.rank === "number" && Number.isInteger(input.rank) && input.rank > 0
      ? input.rank : NaN;
  const districts = cleanStrings(input.preferredDistricts, 12, 64);
  const branches = cleanStrings(input.preferredBranches, 20, 16)
    .filter((branch) => /^[A-Z0-9]+$/i.test(branch));

  if (!(cutoff > 0 && cutoff <= 200)
    || Number.isNaN(rank)
    || !input.community
    || !COMMUNITIES.has(input.community)
    || districts.length === 0
    || branches.length === 0) {
    return { profile: null, error: "Complete your student profile before requesting recommendations." };
  }

  const rankStatus: RankStatus = rank
    ? "known"
    : input.rankStatus && RANK_STATUSES.has(input.rankStatus) ? input.rankStatus : "unknown";
  const locationFlexibility: LocationFlexibility = input.locationFlexibility
    && LOCATION_OPTIONS.has(input.locationFlexibility) ? input.locationFlexibility : "statewide_alternatives";
  const livingArrangement: LivingArrangement = input.livingArrangement
    && LIVING_OPTIONS.has(input.livingArrangement) ? input.livingArrangement : "either";
  const choiceOrderingStrategy: ChoiceOrderingStrategy = input.choiceOrderingStrategy
    && ORDERING_OPTIONS.has(input.choiceOrderingStrategy) ? input.choiceOrderingStrategy : "college_first";
  const recommendationMode: RecommendationMode = RECOMMENDATION_MODES.some(
    (mode) => mode.value === input.recommendationMode,
  ) ? input.recommendationMode as RecommendationMode : "balanced";
  const excludedCollegeTraits = Array.isArray(input.excludedCollegeTraits)
    ? input.excludedCollegeTraits.filter((item): item is CollegeExclusion =>
      typeof item === "string" && EXCLUSIONS.has(item as CollegeExclusion)).slice(0, EXCLUSIONS.size)
    : [];

  return {
    profile: {
      name: "",
      cutoff,
      rank: rank || null,
      rankStatus,
      community: input.community,
      preferredDistricts: districts,
      preferredBranches: branches,
      locationFlexibility,
      livingArrangement,
      choiceOrderingStrategy,
      recommendationMode,
      excludedCollegeTraits,
    },
    error: null,
  };
}
