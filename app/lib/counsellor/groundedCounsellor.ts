import {
  CONFIRMATION_OPTIONS,
  GENERAL_ACADEMIC_ROUND_SCHEDULE,
  OFFICIAL_PROCEDURE_URL,
  OFFICIAL_SCHEDULE_URL,
  PATHWAY_LABELS,
  PROCESS_STAGES,
} from "@/lib/counselling/tnea2026";
import { groupCollegeRecommendations, orderByAdmissionBand } from "@/lib/recommendations/collegeRecommendations";
import type { BranchRecommendation, RecommendationLevel } from "@/lib/recommendations/types";
import type { StudentProfile } from "@/lib/types/student";
import type {
  CounsellorAction,
  CounsellorEvidence,
  CounsellorRequest,
  CounsellorResponse,
} from "./types";

const BAND_LABELS: Record<RecommendationLevel, string> = {
  reach: "Reach",
  target: "Target",
  safe: "Safe",
  very_safe: "Very Safe",
  insufficient: "Insufficient evidence",
};

function evidence(detail: string, label = "Official TNEA 2026 procedure"): CounsellorEvidence {
  return { label, detail, url: label.includes("schedule") ? OFFICIAL_SCHEDULE_URL : OFFICIAL_PROCEDURE_URL };
}

function baseActions(profile: StudentProfile | null): CounsellorAction[] {
  return profile
    ? [{ label: "Open my recommendations", href: "/recommendations" }, { label: "Update my profile", href: "/analyze" }]
    : [{ label: "Create my admission profile", href: "/analyze" }];
}

function collegeSummary(items: BranchRecommendation[], profile: StudentProfile | null) {
  if (!profile || !items.length) return null;
  const colleges = orderByAdmissionBand(groupCollegeRecommendations(items, profile));
  const byBand = (level: RecommendationLevel) => colleges.filter((item) => item.level === level);
  return {
    colleges,
    counts: Object.fromEntries(
      (["reach", "target", "safe", "very_safe", "insufficient"] as RecommendationLevel[])
        .map((level) => [level, byBand(level).length]),
    ) as Record<RecommendationLevel, number>,
    top: Object.fromEntries(
      (["reach", "target", "safe", "very_safe"] as RecommendationLevel[])
        .map((level) => [level, byBand(level).slice(0, level === "very_safe" ? 3 : 4)]),
    ) as Record<Exclude<RecommendationLevel, "insufficient">, typeof colleges>,
  };
}

function names(items: Array<{ collegeName: string }>) {
  return items.map((item) => {
    const name = item.collegeName;
    if (/CEG Campus/i.test(name)) return "CEG Campus, Anna University";
    if (/MIT Campus/i.test(name)) return "MIT Campus, Anna University";
    const autonomous = name.match(/^(.+?\(Autonomous\))/i);
    if (autonomous) return autonomous[1];
    return name.split(",")[0]
      .replace(/\s+(?:Sardar Patel Road|Peelamedu|Civil Aerodrome Post|Chrompet|P B No\.?|Post Box).*$/i, "")
      .replace(/\s+(?:Coimbatore|Chennai|Chengalpattu|Madurai|Erode|Salem)\s+District.*$/i, "")
      .replace(/\s+(?:Village|Post|District|Taluk|Kathankudikadu|Thelur)\b.*$/i, "")
      .trim();
  }).join(", ");
}

function contains(message: string, words: string[]) {
  return words.some((word) => message.includes(word));
}

function detectIntent(message: string) {
  const normalized = message.toLowerCase();
  if (contains(normalized, ["today", "next", "now", "current stage", "what should i do"])) return "next_action";
  if (contains(normalized, ["deadline", "date", "round", "schedule", "when"])) return "schedule";
  if (contains(normalized, ["accept", "upward", "decline", "confirm", "allotment option"])) return "confirmation";
  if (contains(normalized, ["guarantee", "guaranteed", "100%", "sure admission", "definitely get", "will i get"])) return "guarantee";
  if (contains(normalized, ["how many", "enough college", "enough choice", "safe list", "safety-complete", "safety complete", "very safe", "choice filling", "choice list"])) return "choice_strategy";
  if (contains(normalized, ["outside", "district", "location", "hostel", "day scholar"])) return "real_life_fit";
  if (contains(normalized, ["recommend", "college", "reach", "target", "very safe", "rank", "cutoff"])) return "recommendations";
  return "general";
}

function indiaDate() {
  const parts = new Intl.DateTimeFormat("en-US", {
    timeZone: "Asia/Kolkata",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).formatToParts(new Date());
  const value = Object.fromEntries(parts.map((part) => [part.type, part.value]));
  return `${value.year}-${value.month}-${value.day}`;
}

function noProfileResponse(request: CounsellorRequest): CounsellorResponse {
  const stage = request.tracker
    ? PROCESS_STAGES.find((item) => item.id === request.tracker?.stageId)
    : null;
  return {
    mode: "grounded",
    answer: stage
      ? `${stage.title}: ${stage.nextAction}`
      : "I can explain the official TNEA process now, but I need your cutoff, general rank, community and acceptable branches before I can give personal college guidance.",
    reasoning: stage
      ? [stage.summary, stage.deadlineRule]
      : ["No saved CampusAI admission profile was found on this device."],
    nextSteps: stage
      ? stage.checklist.slice(0, 3).map((item) => item.label)
      : ["Create your profile", "Add your general rank if it is available", "Select only branches you would genuinely accept"],
    evidence: [evidence("Counselling has choice filling, allotment, confirmation and reporting stages.")],
    caution: "CampusAI cannot read your official TNEA dashboard. Never share your TNEA password or OTP here.",
    followUps: ["Explain the six confirmation options", "How does TNEA allotment work?", "What information do you need from me?"],
    actions: baseActions(null),
    profileUsed: false,
    trackerUsed: Boolean(request.tracker),
  };
}

export function buildGroundedResponse(
  request: CounsellorRequest,
  recommendations: BranchRecommendation[],
): CounsellorResponse {
  const profile = request.profile;
  if (!profile) return noProfileResponse(request);

  const summary = collegeSummary(recommendations, profile);
  const intent = detectIntent(request.message);
  const stage = request.tracker
    ? PROCESS_STAGES.find((item) => item.id === request.tracker?.stageId)
    : null;
  const common = {
    mode: "grounded" as const,
    profileUsed: true,
    trackerUsed: Boolean(request.tracker),
    actions: baseActions(profile),
  };

  if (intent === "next_action" && stage) {
    const selectedRound = request.tracker?.round;
    const roundDetails = request.tracker?.pathway === "academic"
      && selectedRound && selectedRound !== "not_sure"
      ? GENERAL_ACADEMIC_ROUND_SCHEDULE[selectedRound] : null;
    const today = indiaDate();
    const stageConflict = stage.id === "choice_filling" && roundDetails
      && (today < roundDetails.choiceStart || today > roundDetails.choiceEnd);
    return {
      ...common,
      answer: stageConflict
        ? `Your saved stage says Choice filling, but the official General Academic Round ${selectedRound} window is ${roundDetails.choice}. Recheck your TNEA dashboard before acting.`
        : `${stage.title}: ${stage.nextAction}`,
      reasoning: [
        stage.summary,
        stage.deadlineRule,
        `Pathway: ${PATHWAY_LABELS[request.tracker!.pathway]}.`,
        ...(roundDetails ? [`Official Round ${selectedRound} rank range: ${roundDetails.rank}.`] : []),
      ],
      nextSteps: stageConflict
        ? [
          "Open your official TNEA dashboard and verify the active stage",
          `If you are in General Academic Round ${selectedRound}, prepare choices before ${roundDetails.choice}`,
          "Correct the saved stage in My Counselling after checking",
          "Do not submit or assume a deadline from CampusAI alone",
        ]
        : stage.checklist.slice(0, 4).map((item) => item.label),
      evidence: [
        evidence("The official process defines four stages in every round and specific consequences for non-confirmation or non-reporting."),
        ...(roundDetails ? [evidence(`General Academic Round ${selectedRound} choice filling is ${roundDetails.choice}.`, "Official TNEA 2026 schedule")] : []),
      ],
      caution: stageConflict
        ? "CampusAI’s tracker is self-reported and may be wrong. Follow the status inside your official login."
        : stage.missedConsequence,
      followUps: ["What is my exact round schedule?", "Explain my next confirmation decision", "Is my college list safety-complete?"],
    };
  }

  if (intent === "schedule") {
    const round = request.tracker?.round;
    const details = round && round !== "not_sure" ? GENERAL_ACADEMIC_ROUND_SCHEDULE[round] : null;
    return {
      ...common,
      answer: details
        ? `For General Academic Round ${round}, choice filling is ${details.choice}; tentative allotment is ${details.tentative}; confirmation is ${details.confirm}.`
        : "The general academic schedule has three rounds. Select your round in My Counselling so I can give the exact choice-filling, confirmation, reporting and upward dates.",
      reasoning: details
        ? [`Official Round ${round} general-rank range: ${details.rank}.`, `Official aggregate-mark range: ${details.cutoff}.`, `Reporting window: ${details.reporting}; upward result: ${details.upward}.`]
        : ["Round 1 choice filling: 20–22 July.", "Round 2: 3–5 August.", "Round 3: 17–19 August."],
      nextSteps: ["Verify the same dates inside your TNEA login", "Set your current stage and round in My Counselling", "Save the deadline shown on your official dashboard"],
      evidence: [evidence("The detailed schedule publishes round-wise rank ranges and exact stage dates.", "Official TNEA 2026 schedule")],
      caution: "The official PDF is marked subject to AICTE approval; your TNEA dashboard and allotment order are the final authority.",
      followUps: ["Which round am I likely in?", "What happens after tentative allotment?", "What if I miss confirmation?"],
    };
  }

  if (intent === "confirmation") {
    const optionLines = CONFIRMATION_OPTIONS.map((option) =>
      `${option.title}: ${option.description}${option.keepsSeat ? " It preserves the current seat when its reporting requirements are completed." : " It does not preserve the current seat."}`);
    return {
      ...common,
      answer: "Do not choose a confirmation option from its name alone. First decide whether you are willing to join the current allotment and whether you want only choices placed above it.",
      reasoning: optionLines,
      nextSteps: ["Find the allotted option’s position in your submitted list", "Decide whether losing the current seat is acceptable", "Read the reporting and payment requirement before submitting", "Save proof after submission"],
      evidence: [evidence("TNEA defines six confirmation options and requires confirmation within two days of allotment.")],
      caution: "Accept & Upward still requires reporting to a TFC and fee completion when applicable. Missing that step can cancel the seat.",
      followUps: ["Compare Accept & Join with Accept & Upward", "What does Decline & Upward risk?", "What happens if I do nothing?"],
    };
  }

  if (intent === "guarantee") {
    return {
      ...common,
      answer: "No college can be promised from historical ranks or cutoffs. Even a Very Safe result is evidence of a larger historical margin—not a 100% guarantee.",
      reasoning: [
        "Final allotment depends on your preference order, rank, community and seats available in 2026.",
        summary ? `Your current evidence set contains ${summary.counts.very_safe} strict Very Safe colleges.` : "Your recommendation evidence is unavailable.",
        "Seat movement and this year’s demand can differ from prior years.",
      ],
      nextSteps: ["Keep 2–3 strict Very Safe colleges you would actually join", "Add multiple acceptable branches where appropriate", "Do not place an unwanted college merely because it is safer", "Keep the full list in genuine preference order"],
      evidence: [evidence("Official allotment uses preference order, rank, community and seat availability.")],
      caution: "Any product or person claiming guaranteed TNEA admission before allotment is overstating what the available evidence can prove.",
      followUps: ["Do I have enough Very Safe colleges?", "How should I order Reach and Safe colleges?", "Why did a college receive its band?"],
    };
  }

  if (intent === "choice_strategy") {
    const verySafe = summary?.top.very_safe ?? [];
    const total = summary?.colleges.length ?? 0;
    return {
      ...common,
      answer: `Your list should be preference-correct first and safety-complete second. TNEA allows any number of choices, so do not stop at an arbitrary small count.${verySafe.length ? ` Your strict Very Safe evidence currently includes ${names(verySafe)}.` : ""}`,
      reasoning: [
        `CampusAI evaluated ${total} distinct colleges for your saved profile.`,
        summary ? `Band coverage: ${summary.counts.reach} Reach, ${summary.counts.target} Target, ${summary.counts.safe} Safe and ${summary.counts.very_safe} Very Safe.` : "Band coverage is unavailable.",
        "The allotment algorithm checks choices in your submitted order; a safer option placed too high can block a preferred higher choice.",
      ],
      nextSteps: ["Start with the best ambitious colleges you would genuinely prefer", "Continue through Target and Safe colleges", "End with 2–3 strict Very Safe colleges you would join", "Verify every college and branch code before submission"],
      evidence: [evidence("TNEA gives three days for choice filling, permits any number of choices and states that order is important.")],
      caution: "CampusAI recommends colleges, not a final college–branch choice-filling sequence. Do not paste a generated order into TNEA without checking every row.",
      followUps: ["Do I have 2–3 strict Very Safe colleges?", "Show my best Reach colleges", "Should I include colleges outside my district?"],
    };
  }

  if (intent === "real_life_fit") {
    const statewide = summary?.colleges.filter((item) => item.districtMatch === "statewide").slice(0, 5) ?? [];
    return {
      ...common,
      answer: statewide.length
        ? `Your district preference should influence convenience, not hide stronger realistic options. Current statewide alternatives include ${names(statewide)}.`
        : "Keep location as a genuine constraint only if travel or hostel is not workable. Admission feasibility must not be changed to make a nearby college look safer.",
      reasoning: [
        `Saved living preference: ${profile.livingArrangement.replaceAll("_", " ")}.`,
        `Saved location flexibility: ${profile.locationFlexibility.replaceAll("_", " ")}.`,
        "Hostel availability is shown only when verified; missing data is not treated as a positive fact.",
      ],
      nextSteps: ["Estimate travel time and annual living cost", "Verify hostel directly with the college when marked unknown", "Keep stronger statewide choices if the student can realistically move", "Remove only options the student would refuse"],
      evidence: [{ label: "CampusAI saved preferences", detail: "Location and living preferences come from the profile stored on this device." }],
      caution: "CampusAI does not currently have complete verified fees, hostel quality or placement data for all 418 colleges.",
      followUps: ["Which stronger colleges are outside my districts?", "How does hostel-required affect my list?", "Show my safest nearby colleges"],
    };
  }

  if (intent === "recommendations" && summary) {
    const firstNonEmpty = (["reach", "target", "safe", "very_safe"] as const)
      .find((level) => summary.top[level].length);
    const selected = firstNonEmpty ? summary.top[firstNonEmpty] : [];
    return {
      ...common,
      answer: selected.length
        ? `Your list is rank-first and college-only. The leading ${firstNonEmpty ? BAND_LABELS[firstNonEmpty] : ""} colleges in the current evidence are ${names(selected)}.`
        : "I could not find enough compatible historical evidence to name colleges confidently.",
      reasoning: [
        profile.rank ? `General rank ${profile.rank.toLocaleString("en-IN")} is the primary feasibility input.` : `${profile.cutoff.toFixed(2)} cutoff is being used because general rank is unavailable.`,
        `The engine groups branches into one card per college, then orders Reach → Target → Safe → Very Safe.`,
        `Current counts: ${summary.counts.reach} Reach, ${summary.counts.target} Target, ${summary.counts.safe} Safe, ${summary.counts.very_safe} Very Safe.`,
      ],
      nextSteps: ["Open recommendations to inspect the exact three-year range", "Check the evidence confidence for each college", "Keep only colleges you would genuinely accept", "Verify college-specific facts on official college sites"],
      evidence: [
        { label: "CampusAI recommendation evidence", detail: "Uses compatible 2023–2025 closing-rank history when general rank is available; cutoff is fallback only." },
        evidence("Official allotment depends on rank, community, preference order and available seats."),
      ],
      caution: "College strength ordering is an editorial CampusAI layer. Admission bands are historical evidence, not guarantees.",
      followUps: ["Why is my first college Reach?", "Do I have enough Very Safe colleges?", "Explain rank gap in simple words"],
    };
  }

  return {
    ...common,
    answer: "I can help with your college evidence, choice-list safety, exact 2026 round dates, allotment options, upward movement, reporting and real-life constraints.",
    reasoning: [
      profile.rank ? `I found your saved general rank: ${profile.rank.toLocaleString("en-IN")}.` : "Your general rank is not saved, so cutoff evidence is the fallback.",
      summary ? `${summary.colleges.length} distinct colleges are available in your recommendation evidence.` : "Recommendation evidence is unavailable.",
      stage ? `Your saved counselling stage is ${stage.title}.` : "Your current counselling stage is not set.",
    ],
    nextSteps: ["Ask one specific decision question", "Mention the college or admission band you are worried about", "Use My Counselling to set your exact stage and round"],
    evidence: [
      { label: "CampusAI profile", detail: "The answer uses only the saved profile and recommendation evidence shown in this browser." },
      evidence("Official TNEA rules are used for procedure answers."),
    ],
    caution: "Do not share your password, OTP, application number, Aadhaar number, certificates or payment details in chat.",
    followUps: ["What should I do today?", "Is my college list safety-complete?", "Explain Accept & Upward", "Show my best realistic colleges"],
  };
}

export function buildModelContext(
  request: CounsellorRequest,
  recommendations: BranchRecommendation[],
) {
  const fallback = buildGroundedResponse(request, recommendations);
  return {
    profile: request.profile ? {
      cutoff: request.profile.cutoff,
      generalRank: request.profile.rank,
      rankStatus: request.profile.rankStatus,
      community: request.profile.community,
      preferredDistricts: request.profile.preferredDistricts,
      preferredBranches: request.profile.preferredBranches,
      locationFlexibility: request.profile.locationFlexibility,
      livingArrangement: request.profile.livingArrangement,
      exclusions: request.profile.excludedCollegeTraits,
    } : null,
    tracker: request.tracker,
    verifiedRecommendationEvidence: fallback.reasoning,
    deterministicAnswer: fallback,
    officialFacts: {
      counsellingRounds: 3,
      stages: ["Choice filling", "Allotment", "Confirmation", "Reporting/payment"],
      choiceFilling: "Three days; any number of choices; order is important.",
      allotmentBasis: "Preference order, rank, community and seat availability.",
      confirmation: "Within two days of allotment.",
      generalAcademicRounds: GENERAL_ACADEMIC_ROUND_SCHEDULE,
      sources: [OFFICIAL_PROCEDURE_URL, OFFICIAL_SCHEDULE_URL],
    },
  };
}
