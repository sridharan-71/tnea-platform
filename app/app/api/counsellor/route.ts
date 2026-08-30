import { createHash } from "node:crypto";

import { buildGroundedResponse, buildModelContext } from "@/lib/counsellor/groundedCounsellor";
import type { CounsellingTrackerSnapshot, CounsellorRequest, CounsellorResponse } from "@/lib/counsellor/types";
import { PATHWAY_LABELS, PROCESS_STAGES } from "@/lib/counselling/tnea2026";
import type { CutoffCategory } from "@/lib/recommendations/types";
import { normalizeRecommendationRequest } from "@/lib/recommendations/normalizeRequest";
import { scoreRecommendations } from "@/lib/recommendations/scoreRecommendations";
import { getRecommendationCandidates } from "@/lib/repositories/recommendationRepository";
import type { StudentProfile } from "@/lib/types/student";
import { createServerSupabase } from "@/lib/supabase/server";

export const runtime = "nodejs";

const MAX_MESSAGE_LENGTH = 800;
const MAX_HISTORY_ITEMS = 8;
const requestWindows = new Map<string, { count: number; resetAt: number }>();
const MAX_RATE_LIMIT_KEYS = 5_000;

function normalizeProfile(value: CounsellorRequest["profile"]): StudentProfile | null {
  return normalizeRecommendationRequest(value).profile;
}

function normalizeTracker(value: CounsellorRequest["tracker"]): CounsellingTrackerSnapshot | null {
  if (!value
    || !PROCESS_STAGES.some((stage) => stage.id === value.stageId)
    || !(value.pathway in PATHWAY_LABELS)
    || !["1", "2", "3", "not_sure"].includes(value.round)) return null;
  return { stageId: value.stageId, pathway: value.pathway, round: value.round };
}

async function clientKey(request: Request) {
  let userId: string | undefined;
  try {
    const supabase = await createServerSupabase();
    const { data: { user } } = await supabase.auth.getUser();
    userId = user?.id;
  } catch {
    // The endpoint still has a privacy-preserving anonymous fallback.
  }
  const forwarded = request.headers.get("x-forwarded-for")?.split(",")[0]?.trim();
  const source = userId || forwarded || request.headers.get("user-agent") || "local";
  return createHash("sha256").update(source).digest("hex");
}

function rateLimited(key: string) {
  const now = Date.now();
  if (requestWindows.size >= MAX_RATE_LIMIT_KEYS) {
    for (const [candidate, window] of requestWindows) {
      if (window.resetAt <= now) requestWindows.delete(candidate);
    }
    if (requestWindows.size >= MAX_RATE_LIMIT_KEYS) {
      const oldest = requestWindows.keys().next().value as string | undefined;
      if (oldest) requestWindows.delete(oldest);
    }
  }
  const current = requestWindows.get(key);
  if (!current || current.resetAt <= now) {
    requestWindows.set(key, { count: 1, resetAt: now + 60_000 });
    return false;
  }
  current.count += 1;
  return current.count > 12;
}

async function recommendationsFor(profile: StudentProfile | null) {
  if (!profile) return [];
  const candidates = await getRecommendationCandidates({
    districts: profile.preferredDistricts.length ? profile.preferredDistricts : ["Anywhere in Tamil Nadu"],
    branches: profile.preferredBranches,
    category: profile.community as CutoffCategory,
    rankCategory: "oc",
  });
  return scoreRecommendations(candidates, profile);
}

function outputText(payload: unknown) {
  if (!payload || typeof payload !== "object") return "";
  const output = "output" in payload && Array.isArray(payload.output) ? payload.output : [];
  for (const item of output) {
    if (!item || typeof item !== "object" || !("content" in item) || !Array.isArray(item.content)) continue;
    for (const part of item.content) {
      if (part && typeof part === "object" && "type" in part && part.type === "output_text"
        && "text" in part && typeof part.text === "string") return part.text.trim();
    }
  }
  return "";
}

async function isModerationFlagged(apiKey: string, message: string) {
  const response = await fetch("https://api.openai.com/v1/moderations", {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify({ model: "omni-moderation-latest", input: message }),
    signal: AbortSignal.timeout(8_000),
  });
  if (!response.ok) return false;
  const payload = await response.json() as { results?: Array<{ flagged?: boolean }> };
  return Boolean(payload.results?.[0]?.flagged);
}

async function modelAnswer(
  apiKey: string,
  request: CounsellorRequest,
  fallback: CounsellorResponse,
  context: ReturnType<typeof buildModelContext>,
  safetyIdentifier: string,
) {
  if (await isModerationFlagged(apiKey, request.message)) {
    return "I can only help with TNEA admissions, college evidence and counselling decisions. Please ask a question within that scope.";
  }

  const history = (request.history ?? []).slice(-MAX_HISTORY_ITEMS)
    .map((item) => `${item.role === "user" ? "Student" : "Counsellor"}: ${item.content.slice(0, 500)}`)
    .join("\n");
  const response = await fetch("https://api.openai.com/v1/responses", {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      model: process.env.OPENAI_COUNSELLOR_MODEL || "gpt-5.6-sol",
      instructions: [
        "You are CampusAI's TNEA 2026 decision counsellor for students in Tamil Nadu.",
        "Answer only from the supplied verified context. Never invent a college, rank, cutoff, seat, deadline, fee, hostel, placement or package fact.",
        "Never promise or imply guaranteed admission. Very Safe means the strictest historical evidence band, not certainty.",
        "Use general rank as the primary CampusAI feasibility input when present; cutoff is fallback only.",
        "Do not generate a final college-branch choice order. Explain decisions and direct the student to verify every row.",
        "Never ask for or accept a password, OTP, application number, Aadhaar, certificate, payment or other sensitive identifier.",
        "For official procedure or dates, prefer the supplied official facts. Tell the student their TNEA login and allotment order are final.",
        "State the answer directly, then give the most important reason and next action. Keep it under 180 words.",
        "Respond in the language used by the student when possible. Keep official option names in English.",
      ].join("\n"),
      input: [{
        role: "user",
        content: [{
          type: "input_text",
          text: [
            `Student question: ${request.message}`,
            history ? `Recent conversation:\n${history}` : "",
            `Verified context:\n${JSON.stringify(context)}`,
            `Deterministic safe answer to improve without contradicting:\n${fallback.answer}`,
          ].filter(Boolean).join("\n\n"),
        }],
      }],
      reasoning: { effort: "medium", context: "current_turn" },
      text: { verbosity: "medium" },
      max_output_tokens: 700,
      safety_identifier: safetyIdentifier,
      store: false,
    }),
    signal: AbortSignal.timeout(25_000),
  });
  if (!response.ok) throw new Error(`OpenAI response failed with ${response.status}`);
  return outputText(await response.json());
}

export async function POST(request: Request) {
  const key = await clientKey(request);
  if (rateLimited(key)) {
    return Response.json({ error: "Please wait a moment before asking another question." }, { status: 429 });
  }

  let body: Partial<CounsellorRequest>;
  try {
    body = await request.json() as Partial<CounsellorRequest>;
  } catch {
    return Response.json({ error: "The question could not be read." }, { status: 400 });
  }

  const message = typeof body.message === "string" ? body.message.trim() : "";
  if (!message || message.length > MAX_MESSAGE_LENGTH) {
    return Response.json({ error: `Ask a question between 1 and ${MAX_MESSAGE_LENGTH} characters.` }, { status: 400 });
  }

  const profile = normalizeProfile(body.profile ?? null);
  const safeRequest: CounsellorRequest = {
    message,
    profile,
    tracker: normalizeTracker(body.tracker ?? null),
    tone: body.tone === "supportive" ? "supportive" : "direct",
    history: Array.isArray(body.history)
      ? body.history.slice(-MAX_HISTORY_ITEMS).filter((item) =>
        item && (item.role === "user" || item.role === "assistant") && typeof item.content === "string")
        .map((item) => ({ ...item, content: item.content.slice(0, 500) }))
      : [],
  };

  try {
    const recommendations = await recommendationsFor(profile);
    const fallback = buildGroundedResponse(safeRequest, recommendations);
    const apiKey = process.env.OPENAI_API_KEY;
    if (!apiKey) return Response.json(fallback);

    try {
      const enhanced = await modelAnswer(
        apiKey,
        safeRequest,
        fallback,
        buildModelContext(safeRequest, recommendations),
        key,
      );
      return Response.json(enhanced ? { ...fallback, mode: "model", answer: enhanced } : fallback);
    } catch (reason) {
      console.error("AI counsellor model fallback:", reason);
      return Response.json(fallback);
    }
  } catch (reason) {
    console.error("AI counsellor evidence error:", reason);
    return Response.json({
      ...buildGroundedResponse({ ...safeRequest, profile: null }, []),
      caution: "Recommendation evidence could not be loaded. I am limiting this answer to official process guidance.",
    });
  }
}
