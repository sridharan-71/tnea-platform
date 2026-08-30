import type { CutoffCategory } from "@/lib/recommendations/types";
import { normalizeRecommendationRequest } from "@/lib/recommendations/normalizeRequest";
import { scoreRecommendations } from "@/lib/recommendations/scoreRecommendations";
import { getRecommendationCandidates } from "@/lib/repositories/recommendationRepository";
import { rateChoiceList } from "@/lib/choice-filling/rateChoiceList";
import type {
  ChoiceAuditPreferences,
  ChoicePriority,
  ParsedChoice,
  SafetyPreference,
} from "@/lib/choice-filling/types";

const PRIORITIES = new Set<ChoicePriority>(["college_first", "balanced", "branch_first"]);
const SAFETY = new Set<SafetyPreference>(["ambitious", "balanced", "safety_first"]);

function cleanChoices(value: unknown): ParsedChoice[] {
  if (!Array.isArray(value)) return [];
  return value.slice(0, 500).flatMap((raw, index) => {
    if (!raw || typeof raw !== "object") return [];
    const item = raw as Partial<ParsedChoice>;
    if (!Number.isInteger(item.collegeCode) || !item.branchCode || typeof item.branchCode !== "string") return [];
    return [{
      position: index + 1,
      collegeCode: item.collegeCode as number,
      collegeName: typeof item.collegeName === "string" ? item.collegeName.slice(0, 180) : `College code ${item.collegeCode}`,
      branchCode: item.branchCode.toUpperCase().slice(0, 8),
      branchName: typeof item.branchName === "string" ? item.branchName.slice(0, 180) : item.branchCode.toUpperCase(),
      valid2026: item.valid2026 === true,
      duplicate: item.duplicate === true,
      rawLine: "",
    }];
  });
}

export async function POST(request: Request) {
  try {
    const body = await request.json() as {
      profile?: unknown;
      choices?: unknown;
      preferences?: Partial<ChoiceAuditPreferences>;
    };
    const normalized = normalizeRecommendationRequest(body.profile);
    if (!normalized.profile) return Response.json({ error: normalized.error }, { status: 400 });
    const choices = cleanChoices(body.choices);
    if (!choices.length) return Response.json({ error: "Upload a choice list before requesting an audit." }, { status: 400 });

    const input = body.preferences ?? {};
    const likedBranches = Array.isArray(input.likedBranches)
      ? [...new Set(input.likedBranches.filter((item): item is string => typeof item === "string")
        .map((item) => item.toUpperCase()).filter((item) => /^[A-Z0-9]{2,8}$/.test(item)))].slice(0, 20)
      : [];
    if (!likedBranches.length) {
      return Response.json({ error: "Choose at least one branch you would genuinely study." }, { status: 400 });
    }
    const priority = input.priority && PRIORITIES.has(input.priority) ? input.priority : "balanced";
    const safetyPreference = input.safetyPreference && SAFETY.has(input.safetyPreference)
      ? input.safetyPreference : "balanced";
    const expectedCollegeCode = Number.isInteger(input.expectedCollegeCode)
      ? input.expectedCollegeCode as number : null;
    const preferences: ChoiceAuditPreferences = {
      likedBranches, priority, safetyPreference, expectedCollegeCode,
    };

    const allBranches = [...new Set([...likedBranches, ...choices.map((choice) => choice.branchCode)])];
    const profile = {
      ...normalized.profile,
      preferredBranches: allBranches,
      preferredDistricts: ["Anywhere in Tamil Nadu"],
      locationFlexibility: "anywhere" as const,
      choiceOrderingStrategy: priority,
    };
    const candidates = await getRecommendationCandidates({
      districts: profile.preferredDistricts,
      branches: allBranches,
      category: profile.community as CutoffCategory,
      rankCategory: "oc",
    });
    const recommendations = scoreRecommendations(candidates, profile);
    return Response.json(rateChoiceList(choices, recommendations, profile, preferences));
  } catch (reason) {
    console.error("Choice-list audit failed:", reason);
    return Response.json({
      error: "The 2026 choice-list evidence is temporarily unavailable. Please try again.",
    }, { status: 503 });
  }
}
