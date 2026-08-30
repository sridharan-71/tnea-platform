import type { CounsellingPathway, CounsellingRound, CounsellingStageId } from "@/lib/counselling/tnea2026";
import type { StudentProfile } from "@/lib/types/student";

export type CounsellorMode = "grounded" | "model";
export type CounsellorTone = "direct" | "supportive";

export interface CounsellorHistoryItem {
  role: "user" | "assistant";
  content: string;
}

export interface CounsellingTrackerSnapshot {
  stageId: CounsellingStageId;
  pathway: CounsellingPathway;
  round: CounsellingRound;
}

export interface CounsellorRequest {
  message: string;
  profile: StudentProfile | null;
  tracker: CounsellingTrackerSnapshot | null;
  history?: CounsellorHistoryItem[];
  tone?: CounsellorTone;
}

export interface CounsellorEvidence {
  label: string;
  detail: string;
  url?: string;
}

export interface CounsellorAction {
  label: string;
  href: string;
}

export interface CounsellorResponse {
  mode: CounsellorMode;
  answer: string;
  reasoning: string[];
  nextSteps: string[];
  evidence: CounsellorEvidence[];
  caution: string;
  followUps: string[];
  actions: CounsellorAction[];
  profileUsed: boolean;
  trackerUsed: boolean;
}
