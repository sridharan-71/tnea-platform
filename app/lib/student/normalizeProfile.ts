import {
  COMMUNITY_OPTIONS,
  DEFAULT_STUDENT_PROFILE,
  EXCLUSION_OPTIONS,
  type ChoiceOrderingStrategy,
  type CollegeExclusion,
  type CommunityKey,
  type LivingArrangement,
  type LocationFlexibility,
  type RankStatus,
  type StudentProfile,
} from "@/lib/types/student";

const communities = new Set<string>(COMMUNITY_OPTIONS.map((item) => item.value));
const exclusions = new Set<string>(EXCLUSION_OPTIONS.map((item) => item.value));
const rankStatuses = new Set<RankStatus>(["known", "not_published", "unknown"]);
const locationOptions = new Set<LocationFlexibility>([
  "selected_only", "statewide_alternatives", "anywhere",
]);
const livingOptions = new Set<LivingArrangement>([
  "day_scholar", "hostel_required", "hostel_preferred", "either",
]);
const orderingOptions = new Set<ChoiceOrderingStrategy>([
  "college_first", "balanced", "branch_first",
]);

function strings(value: unknown, limit: number, itemLimit: number) {
  if (!Array.isArray(value)) return [];
  return [...new Set(value
    .filter((item): item is string => typeof item === "string")
    .map((item) => item.trim())
    .filter((item) => item.length > 0 && item.length <= itemLimit))]
    .slice(0, limit);
}

/**
 * Converts saved or legacy browser data into the current editable profile.
 * This deliberately allows an incomplete profile because drafts use it too.
 */
export function normalizeStoredStudentProfile(value: unknown): StudentProfile | null {
  if (!value || typeof value !== "object" || Array.isArray(value)) return null;
  const input = value as Record<string, unknown>;
  const legacyDistrict = typeof input.district === "string" ? input.district : "";
  const preferredDistricts = strings(input.preferredDistricts, 12, 64);
  if (!preferredDistricts.length && legacyDistrict) preferredDistricts.push(legacyDistrict);
  const rank = typeof input.rank === "number"
    && Number.isInteger(input.rank)
    && input.rank > 0 ? input.rank : null;
  const cutoff = typeof input.cutoff === "number"
    && Number.isFinite(input.cutoff)
    && input.cutoff >= 0
    && input.cutoff <= 200 ? input.cutoff : 0;
  const community = typeof input.community === "string"
    && communities.has(input.community) ? input.community as CommunityKey : "";
  const rankStatus = typeof input.rankStatus === "string"
    && rankStatuses.has(input.rankStatus as RankStatus)
    ? input.rankStatus as RankStatus
    : rank ? "known" : "unknown";
  const locationFlexibility = typeof input.locationFlexibility === "string"
    && locationOptions.has(input.locationFlexibility as LocationFlexibility)
    ? input.locationFlexibility as LocationFlexibility
    : preferredDistricts.includes("Anywhere in Tamil Nadu")
      ? "anywhere"
      : "statewide_alternatives";
  const livingArrangement = typeof input.livingArrangement === "string"
    && livingOptions.has(input.livingArrangement as LivingArrangement)
    ? input.livingArrangement as LivingArrangement
    : "either";
  const choiceOrderingStrategy = typeof input.choiceOrderingStrategy === "string"
    && orderingOptions.has(input.choiceOrderingStrategy as ChoiceOrderingStrategy)
    ? input.choiceOrderingStrategy as ChoiceOrderingStrategy
    : "college_first";

  return {
    ...DEFAULT_STUDENT_PROFILE,
    name: typeof input.name === "string" ? input.name.trim().slice(0, 80) : "",
    cutoff,
    rank: rankStatus === "known" ? rank : null,
    rankStatus,
    community,
    preferredDistricts,
    preferredBranches: strings(input.preferredBranches, 20, 16)
      .filter((branch) => /^[A-Z0-9]+$/i.test(branch)),
    locationFlexibility,
    livingArrangement,
    choiceOrderingStrategy,
    recommendationMode: "balanced",
    excludedCollegeTraits: strings(input.excludedCollegeTraits, exclusions.size, 32)
      .filter((item): item is CollegeExclusion => exclusions.has(item)),
  };
}
