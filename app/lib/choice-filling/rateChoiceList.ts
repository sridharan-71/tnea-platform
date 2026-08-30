import type { StudentProfile } from "@/lib/types/student";
import type { BranchRecommendation, RecommendationLevel } from "@/lib/recommendations/types";
import { tneaOverallPriority } from "@/lib/recommendations/tneaCollegePriority";
import type {
  AuditedChoice,
  ChoiceAuditDimension,
  ChoiceAuditPreferences,
  ChoiceAuditResult,
  ChoiceAuditSuggestion,
  ParsedChoice,
} from "./types";

const LEVELS: Array<RecommendationLevel | "unrated"> = [
  "reach", "target", "safe", "very_safe", "insufficient", "unrated",
];

function clamp(value: number, minimum = 0, maximum = 100) {
  return Math.max(minimum, Math.min(maximum, value));
}

function targetChoiceCount(profile: StudentProfile) {
  if (profile.rank !== null) {
    if (profile.rank <= 10_000) return 40;
    if (profile.rank <= 30_000) return 80;
    if (profile.rank <= 60_000) return 140;
    if (profile.rank <= 100_000) return 200;
    return 250;
  }
  if (profile.cutoff >= 190) return 40;
  if (profile.cutoff >= 175) return 90;
  if (profile.cutoff >= 160) return 150;
  return 220;
}

function verdict(score: number): ChoiceAuditResult["verdict"] {
  if (score >= 90) return "Excellent";
  if (score >= 75) return "Strong";
  if (score >= 60) return "Needs improvement";
  return "Risky";
}

function collegePreferenceValue(item: BranchRecommendation) {
  const curated = tneaOverallPriority(item.collegeName);
  if (curated !== null) return curated;
  if (item.averageClosingRank !== null) return 100 + item.averageClosingRank / 10_000;
  if (item.averageCutoff !== null) return 200 - item.averageCutoff;
  return 500;
}

function preferenceValue(item: BranchRecommendation, preferences: ChoiceAuditPreferences) {
  const branchIndex = preferences.likedBranches.indexOf(item.branchCode);
  const branchValue = branchIndex === -1 ? 50 : branchIndex;
  const collegeValue = collegePreferenceValue(item);
  if (preferences.priority === "college_first") return collegeValue * 0.8 + branchValue * 0.2;
  if (preferences.priority === "branch_first") return collegeValue * 0.25 + branchValue * 0.75;
  return collegeValue * 0.55 + branchValue * 0.45;
}

function dimensions(
  choices: AuditedChoice[],
  recommendations: Map<string, BranchRecommendation>,
  profile: StudentProfile,
  preferences: ChoiceAuditPreferences,
): { items: ChoiceAuditDimension[]; inversions: number } {
  const total = Math.max(choices.length, 1);
  const valid = choices.filter((choice) => choice.valid2026 && !choice.duplicate).length;
  const validity = Math.round(clamp(valid / total, 0, 1) * 20);

  const topChoices = choices.slice(0, Math.min(40, choices.length));
  const likedInTop = topChoices.filter((choice) => choice.preferenceMatch).length;
  const preferenceRatio = topChoices.length ? likedInTop / topChoices.length : 0;
  const preference = Math.round(preferenceRatio * 20);

  const comparable = choices.flatMap((choice) => {
    const item = recommendations.get(`${choice.collegeCode}-${choice.branchCode}`);
    return item ? [{ choice, value: preferenceValue(item, preferences) }] : [];
  });
  let inversions = 0;
  for (let index = 1; index < comparable.length; index += 1) {
    if (comparable[index].value + 8 < comparable[index - 1].value) inversions += 1;
  }
  const ordering = Math.round(clamp(25 - inversions * 2.5, 3, 25));

  const counts = Object.fromEntries(LEVELS.map((level) => [
    level, choices.filter((choice) => choice.level === level).length,
  ])) as Record<RecommendationLevel | "unrated", number>;
  const hasAmbition = counts.reach + counts.target >= (preferences.safetyPreference === "safety_first" ? 2 : 5);
  const hasSafe = counts.safe >= 3;
  const hasVerySafe = counts.very_safe >= 3;
  const coverage = (hasAmbition ? 7 : 2) + (hasSafe ? 8 : Math.min(counts.safe * 2, 6))
    + (hasVerySafe ? 10 : Math.min(counts.very_safe * 3, 8));

  const target = targetChoiceCount(profile);
  const depthRatio = clamp(choices.length / target, 0, 1);
  const depth = Math.round(depthRatio * 10);

  return {
    inversions,
    items: [
      { key: "validity", label: "2026 validity", score: validity, maximum: 20, summary: `${valid} of ${choices.length} choices are active and unique.` },
      { key: "preference", label: "Preference fit", score: preference, maximum: 20, summary: `${likedInTop} of the first ${topChoices.length} choices match your preferred branches.` },
      { key: "ordering", label: "True preference order", score: ordering, maximum: 25, summary: inversions ? `${inversions} possible ordering conflict${inversions === 1 ? "" : "s"} need review.` : "No major preference-order conflicts detected." },
      { key: "coverage", label: "Admission coverage", score: coverage, maximum: 25, summary: `${counts.reach} Reach · ${counts.target} Target · ${counts.safe} Safe · ${counts.very_safe} Very Safe.` },
      { key: "depth", label: "List depth", score: depth, maximum: 10, summary: `${choices.length} choices against an adaptive target of about ${target}.` },
    ],
  };
}

export function rateChoiceList(
  parsedChoices: ParsedChoice[],
  recommendationItems: BranchRecommendation[],
  profile: StudentProfile,
  preferences: ChoiceAuditPreferences,
): ChoiceAuditResult {
  const recommendationMap = new Map(recommendationItems.map((item) => [
    `${item.collegeCode}-${item.branchCode}`, item,
  ]));
  const choices: AuditedChoice[] = parsedChoices.map((choice) => {
    const recommendation = recommendationMap.get(`${choice.collegeCode}-${choice.branchCode}`);
    return {
      ...choice,
      level: recommendation?.level ?? "unrated",
      preferenceMatch: preferences.likedBranches.includes(choice.branchCode),
      evidenceNote: recommendation?.explanation
        ?? (choice.valid2026 ? "Active in 2026, but recent admission evidence was insufficient." : "Not found in the active 2026 college-branch matrix."),
    };
  });

  const measured = dimensions(choices, recommendationMap, profile, preferences);
  const rawScore = measured.items.reduce((sum, item) => sum + item.score, 0);
  const target = targetChoiceCount(profile);
  const score = choices.length < 10
    ? Math.min(rawScore, 55)
    : choices.length < target * 0.25
      ? Math.min(rawScore, 65)
      : rawScore;
  const counts = Object.fromEntries(LEVELS.map((level) => [
    level, choices.filter((choice) => choice.level === level).length,
  ])) as Record<RecommendationLevel | "unrated", number>;
  const findings: string[] = [];
  const suggestions: ChoiceAuditSuggestion[] = [];

  const invalid = choices.filter((choice) => !choice.valid2026);
  const duplicates = choices.filter((choice) => choice.duplicate);
  if (invalid.length) {
    findings.push(`${invalid.length} choice${invalid.length === 1 ? "" : "s"} could not be verified in the active 2026 TNEA matrix.`);
    for (const choice of invalid.slice(0, 4)) suggestions.push({
      type: "remove",
      title: `Verify ${choice.collegeCode} · ${choice.branchCode}`,
      detail: "This college-branch combination was not found in the official 2026 active matrix.",
      collegeCode: choice.collegeCode,
      branchCode: choice.branchCode,
    });
  }
  if (duplicates.length) {
    findings.push(`${duplicates.length} duplicate choice${duplicates.length === 1 ? "" : "s"} should be removed.`);
    suggestions.push({ type: "remove", title: "Remove duplicate entries", detail: "Duplicates add length without improving admission coverage." });
  }
  if (measured.inversions) {
    findings.push("Some stronger preference matches appear below weaker matches. Review them based on what you would actually choose.");
    suggestions.push({
      type: "move",
      title: "Review preference-order conflicts",
      detail: "Keep the option you genuinely want more above the option you want less. Admission probability should not decide the order.",
    });
  }
  if (counts.very_safe < 3) {
    findings.push(counts.very_safe === 0
      ? "No choices met the strict Very Safe standard; aim for at least 3."
      : `Only ${counts.very_safe} choice met the strict Very Safe standard; aim for at least 3.`);
  }
  if (counts.safe < 3) findings.push("The list has limited Safe coverage and may end without a realistic fallback.");
  if (counts.reach + counts.target < 5 && preferences.safetyPreference !== "safety_first") {
    findings.push("The top of the list has limited Reach and Target coverage and may miss worthwhile ambitious options.");
  }

  const existing = new Set(choices.map((choice) => `${choice.collegeCode}-${choice.branchCode}`));
  const additions = recommendationItems
    .filter((item) => !existing.has(`${item.collegeCode}-${item.branchCode}`))
    .filter((item) => preferences.likedBranches.includes(item.branchCode))
    .filter((item) => counts.very_safe < 3
      ? item.level === "very_safe" || item.level === "safe"
      : item.level !== "insufficient")
    .slice(0, 6);
  for (const item of additions) suggestions.push({
    type: "add",
    title: `Add ${item.collegeName}`,
    detail: `${item.branchCode} · ${item.branchName}. ${item.level.replace("_", " ")} based on recent rank/cutoff evidence.`,
    collegeCode: item.collegeCode,
    branchCode: item.branchCode,
    level: item.level,
  });

  const expected = preferences.expectedCollegeCode === null ? null
    : choices.find((choice) => choice.collegeCode === preferences.expectedCollegeCode);
  if (expected) {
    findings.push(`Your expected college appears in the ${expected.level.replace("_", " ")} band for ${expected.branchCode}.`);
  }

  const resultVerdict = verdict(score);
  return {
    score,
    verdict: resultVerdict,
    summary: resultVerdict === "Excellent"
      ? "Your list is well structured, preference-led and safety-complete."
      : resultVerdict === "Strong"
        ? "Your list has a solid foundation, with a few targeted improvements recommended."
        : resultVerdict === "Needs improvement"
          ? "Your list has useful choices but important gaps should be fixed before locking."
          : "Your current list carries a meaningful risk of a poor or missed allotment outcome.",
    dimensions: measured.items,
    choices,
    counts,
    findings,
    suggestions: suggestions.slice(0, 10),
    targetChoiceCount: target,
    algorithmVersion: "choice-audit-v1.0.0",
    disclaimer: "This audit uses active 2026 offerings and 2023-2025 historical evidence. It cannot guarantee an allotment.",
  };
}
