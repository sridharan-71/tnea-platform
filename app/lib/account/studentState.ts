import type { CounsellingPathway, CounsellingRound, CounsellingStageId } from "@/lib/counselling/tnea2026";
import { PATHWAY_LABELS, PROCESS_STAGES } from "@/lib/counselling/tnea2026";
import { normalizeStoredStudentProfile } from "@/lib/student/normalizeProfile";
import type { StudentProfile } from "@/lib/types/student";

export const STUDENT_PROFILE_KEY = "campusai.studentProfile";
export const STUDENT_PROFILE_DRAFT_KEY = "campusai.studentProfileDraft";
export const COUNSELLING_PROGRESS_KEY = "campusai.counsellingProgress.v1";
export const STUDENT_STATE_CHANGE_EVENT = "campusai:student-state-change";

const LEGACY_UPDATED_AT_KEY = "campusai.studentStateUpdatedAt";
const PROFILE_UPDATED_AT_KEY = "campusai.studentProfileUpdatedAt";
const COUNSELLING_UPDATED_AT_KEY = "campusai.counsellingProgressUpdatedAt";
const STUDENT_STATE_OWNER_KEY = "campusai.studentStateOwner";

export type StudentStateSection = "profile" | "counselling";

export interface SavedCounsellingProgress {
  stage: CounsellingStageId;
  pathway: CounsellingPathway;
  round: CounsellingRound;
  completed: string[];
}

export interface SyncedValue<T> {
  value: T | null;
  updatedAt: number;
}

export interface SyncedStudentState {
  version: 2;
  profile: SyncedValue<StudentProfile>;
  counselling: SyncedValue<SavedCounsellingProgress>;
}

interface LegacySyncedStudentState {
  version: 1;
  updatedAt: number;
  profile: StudentProfile | null;
  counselling: SavedCounsellingProgress | null;
}

function parseStored(key: string): unknown {
  if (typeof window === "undefined") return null;
  try {
    const value = window.localStorage.getItem(key);
    return value ? JSON.parse(value) : null;
  } catch {
    window.localStorage.removeItem(key);
    return null;
  }
}

function timestamp(key: string, fallback = 0) {
  if (typeof window === "undefined") return fallback;
  return Number(window.localStorage.getItem(key)) || fallback;
}

function emptyState(): SyncedStudentState {
  return {
    version: 2,
    profile: { value: null, updatedAt: 0 },
    counselling: { value: null, updatedAt: 0 },
  };
}

export function readStudentProfile() {
  return normalizeStoredStudentProfile(parseStored(STUDENT_PROFILE_KEY));
}

export function readCounsellingProgress() {
  return normalizeCounsellingProgress(parseStored(COUNSELLING_PROGRESS_KEY));
}

function normalizeCounsellingProgress(value: unknown): SavedCounsellingProgress | null {
  if (!value || typeof value !== "object" || Array.isArray(value)) return null;
  const input = value as Record<string, unknown>;
  if (typeof input.stage !== "string"
    || !PROCESS_STAGES.some((stage) => stage.id === input.stage)
    || typeof input.pathway !== "string"
    || !(input.pathway in PATHWAY_LABELS)
    || typeof input.round !== "string"
    || !["1", "2", "3", "not_sure"].includes(input.round)) return null;
  return {
    stage: input.stage as CounsellingStageId,
    pathway: input.pathway as CounsellingPathway,
    round: input.round as CounsellingRound,
    completed: Array.isArray(input.completed)
      ? [...new Set(input.completed.filter((item): item is string =>
        typeof item === "string" && item.length <= 100))].slice(0, 100)
      : [],
  };
}

export function readLocalStudentState(): SyncedStudentState {
  const legacyTimestamp = timestamp(LEGACY_UPDATED_AT_KEY);
  return {
    version: 2,
    profile: {
      value: readStudentProfile(),
      updatedAt: timestamp(PROFILE_UPDATED_AT_KEY, legacyTimestamp),
    },
    counselling: {
      value: readCounsellingProgress(),
      updatedAt: timestamp(COUNSELLING_UPDATED_AT_KEY, legacyTimestamp),
    },
  };
}

export function prepareLocalStateForNewAccount(): SyncedStudentState {
  const local = readLocalStudentState();
  const now = Date.now();
  return {
    version: 2,
    profile: {
      value: local.profile.value,
      updatedAt: local.profile.value ? local.profile.updatedAt || now : 0,
    },
    counselling: {
      value: local.counselling.value,
      updatedAt: local.counselling.value ? local.counselling.updatedAt || now : 0,
    },
  };
}

export function localStudentStateOwner() {
  if (typeof window === "undefined") return null;
  return window.localStorage.getItem(STUDENT_STATE_OWNER_KEY);
}

export function claimLocalStudentState(userId: string) {
  if (typeof window === "undefined") return;
  window.localStorage.setItem(STUDENT_STATE_OWNER_KEY, userId);
}

export function clearLocalStudentState() {
  if (typeof window === "undefined") return;
  for (const key of [
    STUDENT_PROFILE_KEY,
    STUDENT_PROFILE_DRAFT_KEY,
    COUNSELLING_PROGRESS_KEY,
    LEGACY_UPDATED_AT_KEY,
    PROFILE_UPDATED_AT_KEY,
    COUNSELLING_UPDATED_AT_KEY,
    STUDENT_STATE_OWNER_KEY,
  ]) {
    window.localStorage.removeItem(key);
  }
  window.dispatchEvent(new CustomEvent(STUDENT_STATE_CHANGE_EVENT, {
    detail: { source: "cloud" },
  }));
}

export function notifyStudentStateChanged(section: StudentStateSection) {
  if (typeof window === "undefined") return;
  const updatedAt = Date.now();
  const key = section === "profile" ? PROFILE_UPDATED_AT_KEY : COUNSELLING_UPDATED_AT_KEY;
  window.localStorage.setItem(key, String(updatedAt));
  window.localStorage.removeItem(LEGACY_UPDATED_AT_KEY);
  window.dispatchEvent(new CustomEvent(STUDENT_STATE_CHANGE_EVENT, {
    detail: { source: "local", section },
  }));
}

export function writeLocalStudentState(state: SyncedStudentState) {
  if (typeof window === "undefined") return;

  const writeSection = <T,>(storageKey: string, updatedAtKey: string, field: SyncedValue<T>) => {
    if (field.value === null) window.localStorage.removeItem(storageKey);
    else window.localStorage.setItem(storageKey, JSON.stringify(field.value));
    if (field.updatedAt > 0) window.localStorage.setItem(updatedAtKey, String(field.updatedAt));
    else window.localStorage.removeItem(updatedAtKey);
  };

  writeSection(STUDENT_PROFILE_KEY, PROFILE_UPDATED_AT_KEY, state.profile);
  writeSection(COUNSELLING_PROGRESS_KEY, COUNSELLING_UPDATED_AT_KEY, state.counselling);
  window.localStorage.removeItem(LEGACY_UPDATED_AT_KEY);
  window.dispatchEvent(new CustomEvent(STUDENT_STATE_CHANGE_EVENT, {
    detail: { source: "cloud" },
  }));
}

export function normalizeSyncedStudentState(value: unknown): SyncedStudentState | null {
  if (!value || typeof value !== "object") return null;
  const candidate = value as {
    version?: unknown;
    updatedAt?: unknown;
    profile?: unknown;
    counselling?: unknown;
  };

  if (candidate.version === 2) {
    const profile = candidate.profile as SyncedValue<StudentProfile> | undefined;
    const counselling = candidate.counselling as SyncedValue<SavedCounsellingProgress> | undefined;
    if (!profile || !counselling
      || typeof profile.updatedAt !== "number"
      || typeof counselling.updatedAt !== "number") return null;
    return {
      version: 2,
      profile: {
        value: normalizeStoredStudentProfile(profile.value),
        updatedAt: Math.max(0, profile.updatedAt),
      },
      counselling: {
        value: normalizeCounsellingProgress(counselling.value),
        updatedAt: Math.max(0, counselling.updatedAt),
      },
    };
  }

  if (candidate.version === 1 && typeof candidate.updatedAt === "number") {
    const legacy = candidate as unknown as LegacySyncedStudentState;
    return {
      version: 2,
      profile: {
        value: normalizeStoredStudentProfile(legacy.profile),
        updatedAt: candidate.updatedAt,
      },
      counselling: {
        value: normalizeCounsellingProgress(legacy.counselling),
        updatedAt: candidate.updatedAt,
      },
    };
  }
  return null;
}

function mergeField<T>(local: SyncedValue<T>, remote: SyncedValue<T>): SyncedValue<T> {
  if (local.updatedAt === 0 && remote.updatedAt === 0) {
    return local.value !== null ? local : remote;
  }
  if (local.updatedAt === 0 && remote.value !== null) return remote;
  if (remote.updatedAt === 0 && local.value !== null) return local;
  return local.updatedAt > remote.updatedAt ? local : remote;
}

export function mergeStudentStates(
  local: SyncedStudentState,
  remote: SyncedStudentState | null,
): SyncedStudentState {
  const cloud = remote ?? emptyState();
  return {
    version: 2,
    profile: mergeField(local.profile, cloud.profile),
    counselling: mergeField(local.counselling, cloud.counselling),
  };
}

export function studentStatesEqual(
  first: SyncedStudentState | null,
  second: SyncedStudentState | null,
) {
  return JSON.stringify(first) === JSON.stringify(second);
}
