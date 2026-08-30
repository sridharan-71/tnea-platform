import type { CutoffCategory } from "@/lib/recommendations/types";
import { normalizeRecommendationRequest } from "@/lib/recommendations/normalizeRequest";
import { scoreRecommendations } from "@/lib/recommendations/scoreRecommendations";
import { getRecommendationCandidates } from "@/lib/repositories/recommendationRepository";

export async function POST(request: Request) {
  let body: unknown;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "The student profile could not be read." }, { status: 400 });
  }

  const { profile, error } = normalizeRecommendationRequest(body);
  if (!profile) return Response.json({ error }, { status: 400 });

  try {
    const category = profile.community as CutoffCategory;
    const candidates = await getRecommendationCandidates({
      districts: profile.preferredDistricts,
      branches: profile.preferredBranches,
      category,
      // TNEA publishes one overall/general rank. Community-specific values are
      // cutoff fallbacks only and must never drive rank-based feasibility.
      rankCategory: "oc",
    });
    return Response.json({
      recommendations: scoreRecommendations(candidates, profile),
      categoryUsed: profile.rank ? "GENERAL RANK" : category.toUpperCase(),
      recommendationMode: profile.recommendationMode,
    });
  } catch (reason) {
    console.error("Recommendation generation failed:", reason);
    return Response.json({
      error: "Recommendation evidence is temporarily unavailable. Please try again shortly.",
    }, { status: 503 });
  }
}
