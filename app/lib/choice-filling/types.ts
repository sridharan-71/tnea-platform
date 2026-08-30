import type { RecommendationLevel } from "@/lib/recommendations/types";

export type ChoicePriority = "college_first" | "balanced" | "branch_first";
export type SafetyPreference = "ambitious" | "balanced" | "safety_first";

export interface ParsedChoice {
  position: number;
  collegeCode: number;
  collegeName: string;
  branchCode: string;
  branchName: string;
  valid2026: boolean;
  duplicate: boolean;
  rawLine: string;
}

export interface ChoiceAuditPreferences {
  likedBranches: string[];
  priority: ChoicePriority;
  safetyPreference: SafetyPreference;
  expectedCollegeCode: number | null;
}

export interface AuditedChoice extends ParsedChoice {
  level: RecommendationLevel | "unrated";
  preferenceMatch: boolean;
  evidenceNote: string;
}

export interface ChoiceAuditDimension {
  key: "validity" | "preference" | "ordering" | "coverage" | "depth";
  label: string;
  score: number;
  maximum: number;
  summary: string;
}

export interface ChoiceAuditSuggestion {
  type: "add" | "move" | "remove" | "review";
  title: string;
  detail: string;
  collegeCode?: number;
  branchCode?: string;
  level?: RecommendationLevel;
}

export interface ChoiceAuditResult {
  score: number;
  verdict: "Excellent" | "Strong" | "Needs improvement" | "Risky";
  summary: string;
  dimensions: ChoiceAuditDimension[];
  choices: AuditedChoice[];
  counts: Record<RecommendationLevel | "unrated", number>;
  findings: string[];
  suggestions: ChoiceAuditSuggestion[];
  targetChoiceCount: number;
  algorithmVersion: "choice-audit-v1.0.0";
  disclaimer: string;
}
