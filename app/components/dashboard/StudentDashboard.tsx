"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  ArrowRight, Bot, CalendarCheck2, CheckCircle2, CircleUserRound, Cloud,
  CloudOff, Compass, LoaderCircle, RefreshCw, ShieldCheck, Sparkles, Target,
} from "lucide-react";

import { useAuth } from "@/components/auth/AuthProvider";
import {
  readCounsellingProgress,
  readStudentProfile,
  STUDENT_STATE_CHANGE_EVENT,
  type SavedCounsellingProgress,
} from "@/lib/account/studentState";
import { GENERAL_ACADEMIC_ROUND_SCHEDULE, PROCESS_STAGES } from "@/lib/counselling/tnea2026";
import { groupCollegeRecommendations } from "@/lib/recommendations/collegeRecommendations";
import type { BranchRecommendation, RecommendationLevel } from "@/lib/recommendations/types";
import type { StudentProfile } from "@/lib/types/student";

type Counts = Record<Exclude<RecommendationLevel, "insufficient">, number>;

const EMPTY_COUNTS: Counts = { reach: 0, target: 0, safe: 0, very_safe: 0 };
const levelMeta = [
  { key: "reach", label: "Reach", color: "text-violet-200", bg: "border-violet-400/20 bg-violet-500/[0.08]" },
  { key: "target", label: "Target", color: "text-amber-200", bg: "border-amber-400/20 bg-amber-500/[0.08]" },
  { key: "safe", label: "Safe", color: "text-emerald-200", bg: "border-emerald-400/20 bg-emerald-500/[0.08]" },
  { key: "very_safe", label: "Very safe", color: "text-sky-200", bg: "border-sky-400/20 bg-sky-500/[0.08]" },
] as const;

function firstName(value: string) {
  return value.trim().split(/\s+/)[0] || "Student";
}

function profileCompletion(profile: StudentProfile | null) {
  if (!profile) return 0;
  const checks = [
    Boolean(profile.name.trim()), profile.cutoff > 0, Boolean(profile.community),
    profile.rankStatus !== "known" || Boolean(profile.rank),
    profile.preferredBranches.length > 0, profile.preferredDistricts.length > 0,
  ];
  return Math.round((checks.filter(Boolean).length / checks.length) * 100);
}

function progressCompletion(progress: SavedCounsellingProgress | null) {
  if (!progress) return 0;
  const stageIndex = PROCESS_STAGES.findIndex((stage) => stage.id === progress.stage);
  const stage = PROCESS_STAGES[Math.max(0, stageIndex)];
  const checked = stage.checklist.filter((item) => progress.completed.includes(`${stage.id}:${item.id}`)).length;
  return Math.round(((Math.max(0, stageIndex) + checked / stage.checklist.length) / PROCESS_STAGES.length) * 100);
}

export default function StudentDashboard() {
  const router = useRouter();
  const { user, loading: authLoading, displayName, syncStatus, syncNow } = useAuth();
  const [profile, setProfile] = useState<StudentProfile | null>(null);
  const [progress, setProgress] = useState<SavedCounsellingProgress | null>(null);
  const [counts, setCounts] = useState<Counts>(EMPTY_COUNTS);
  const [recommendationsLoading, setRecommendationsLoading] = useState(true);

  useEffect(() => {
    if (!authLoading && !user) router.replace("/login");
  }, [authLoading, router, user]);

  useEffect(() => {
    const load = () => {
      setProfile(readStudentProfile());
      setProgress(readCounsellingProgress());
    };
    load();
    window.addEventListener(STUDENT_STATE_CHANGE_EVENT, load);
    window.addEventListener("storage", load);
    return () => {
      window.removeEventListener(STUDENT_STATE_CHANGE_EVENT, load);
      window.removeEventListener("storage", load);
    };
  }, []);

  const complete = profileCompletion(profile);
  const hasProfile = complete === 100;

  useEffect(() => {
    if (!hasProfile || !profile) return;
    const controller = new AbortController();
    async function loadRecommendationSummary() {
      setRecommendationsLoading(true);
      try {
        const response = await fetch("/api/recommendations", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(profile),
          signal: controller.signal,
        });
        if (!response.ok) return;
        const payload = await response.json() as { recommendations: BranchRecommendation[] };
        const colleges = groupCollegeRecommendations(payload.recommendations, profile!);
        setCounts({
          reach: colleges.filter((item) => item.level === "reach").length,
          target: colleges.filter((item) => item.level === "target").length,
          safe: colleges.filter((item) => item.level === "safe").length,
          very_safe: colleges.filter((item) => item.level === "very_safe").length,
        });
      } catch (reason) {
        if (!(reason instanceof DOMException && reason.name === "AbortError")) {
          setCounts(EMPTY_COUNTS);
        }
      } finally {
        if (!controller.signal.aborted) setRecommendationsLoading(false);
      }
    }
    void loadRecommendationSummary();
    return () => controller.abort();
  }, [hasProfile, profile]);

  const stage = PROCESS_STAGES.find((item) => item.id === progress?.stage) ?? PROCESS_STAGES[1];
  const journeyProgress = progressCompletion(progress);
  const exactRound = progress?.pathway === "academic" && progress.round !== "not_sure"
    ? GENERAL_ACADEMIC_ROUND_SCHEDULE[progress.round] : null;
  const primary = !hasProfile
    ? { href: "/analyze", label: profile ? "Finish my student profile" : "Build my student profile", detail: "Unlock rank-first college recommendations", icon: CircleUserRound }
    : !progress
      ? { href: "/counselling", label: "Set my counselling stage", detail: "See the exact action that applies to you", icon: CalendarCheck2 }
      : { href: "/counselling", label: stage.title, detail: stage.nextAction, icon: CalendarCheck2 };
  const PrimaryIcon = primary.icon;

  const accountLabel = syncStatus === "synced" ? "Synced across devices"
    : syncStatus === "syncing" ? "Saving your progress…"
      : syncStatus === "offline" ? "Saved on this device" : "Account ready";

  const nextDeadline = exactRound
    ? progress?.stage === "choice_filling" ? exactRound.choice
      : progress?.stage === "confirmation" ? exactRound.confirm
        : exactRound.choice
    : "Set your round to see exact dates";

  if (authLoading || !user) {
    return <main className="flex min-h-[70vh] items-center justify-center bg-zinc-950 text-white"><LoaderCircle className="h-6 w-6 animate-spin text-indigo-300" /></main>;
  }

  return (
    <main className="min-h-screen overflow-hidden bg-[#08080a] px-4 py-8 text-white sm:px-6 sm:py-12 lg:px-8">
      <div className="pointer-events-none fixed inset-x-0 top-0 h-[520px] bg-[radial-gradient(circle_at_20%_0%,rgba(99,102,241,0.14),transparent_34%),radial-gradient(circle_at_85%_15%,rgba(34,211,238,0.07),transparent_25%)]" />
      <div className="relative mx-auto max-w-7xl">
        <header className="flex flex-col gap-5 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <div className="flex items-center gap-2 text-xs font-medium text-indigo-300"><Sparkles className="h-3.5 w-3.5" /> My CampusAI</div>
            <h1 className="mt-3 text-3xl font-semibold tracking-tight sm:text-5xl">Good to see you, {firstName(profile?.name || displayName)}.</h1>
            <p className="mt-3 max-w-2xl text-sm leading-6 text-zinc-500 sm:text-base">Your college decisions and counselling actions, organized around what matters next.</p>
          </div>
          <button type="button" onClick={() => void syncNow()} className="inline-flex w-fit items-center gap-2 rounded-xl border border-white/10 bg-white/[0.035] px-3.5 py-2.5 text-xs text-zinc-400 transition hover:border-white/20 hover:text-white">
            {syncStatus === "offline" ? <CloudOff className="h-4 w-4 text-amber-300" /> : <Cloud className="h-4 w-4 text-emerald-300" />}
            {accountLabel}
            <RefreshCw className={`h-3.5 w-3.5 ${syncStatus === "syncing" ? "animate-spin" : ""}`} />
          </button>
        </header>

        <section className="mt-8 grid gap-5 lg:grid-cols-[1.35fr_0.65fr]">
          <Link href={primary.href} className="group relative overflow-hidden rounded-[28px] border border-indigo-400/20 bg-[radial-gradient(circle_at_top_right,rgba(99,102,241,0.28),transparent_35%),linear-gradient(135deg,rgba(79,70,229,0.16),rgba(9,9,11,0.9))] p-6 shadow-[0_30px_100px_rgba(0,0,0,0.35)] transition hover:border-indigo-300/35 sm:p-8">
            <div className="flex h-12 w-12 items-center justify-center rounded-2xl border border-indigo-300/20 bg-indigo-400/10 text-indigo-100"><PrimaryIcon className="h-5 w-5" /></div>
            <p className="mt-7 text-xs font-semibold uppercase tracking-[0.2em] text-indigo-300">Your next best action</p>
            <h2 className="mt-2 text-2xl font-semibold sm:text-3xl">{primary.label}</h2>
            <p className="mt-3 max-w-2xl text-sm leading-6 text-zinc-400">{primary.detail}</p>
            <span className="mt-7 inline-flex items-center gap-2 text-sm font-semibold text-white">Continue <ArrowRight className="h-4 w-4 transition group-hover:translate-x-1" /></span>
          </Link>

          <div className="rounded-[28px] border border-white/10 bg-white/[0.028] p-6 sm:p-7">
            <div className="flex items-center justify-between">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-500/10 text-emerald-200"><ShieldCheck className="h-5 w-5" /></div>
              <span className="font-mono text-sm text-zinc-300">{complete}%</span>
            </div>
            <h2 className="mt-5 text-lg font-semibold">Student profile</h2>
            <p className="mt-2 text-sm leading-6 text-zinc-500">{hasProfile ? `${profile?.cutoff.toFixed(2)} cutoff · ${profile?.rank ? `General rank ${profile.rank.toLocaleString("en-IN")}` : "Cutoff evidence mode"}` : "Complete the essentials that make guidance personal."}</p>
            <div className="mt-5 h-2 overflow-hidden rounded-full bg-white/[0.07]"><div className="h-full rounded-full bg-gradient-to-r from-emerald-400 to-cyan-300" style={{ width: `${complete}%` }} /></div>
            <Link href="/analyze" className="mt-5 inline-flex items-center gap-2 text-sm text-zinc-300 hover:text-white">{hasProfile ? "Review profile" : "Complete profile"} <ArrowRight className="h-3.5 w-3.5" /></Link>
          </div>
        </section>

        <section className="mt-5 grid gap-5 xl:grid-cols-[1.25fr_0.75fr]">
          <div className="rounded-[28px] border border-white/10 bg-zinc-900/30 p-5 sm:p-7">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
              <div>
                <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.18em] text-violet-300"><Target className="h-4 w-4" /> College recommendations</div>
                <h2 className="mt-2 text-xl font-semibold">{hasProfile ? "Your admission landscape" : "Ready when your profile is"}</h2>
                <p className="mt-2 text-sm leading-6 text-zinc-500">College-only results, ordered from ambitious to progressively safer evidence.</p>
              </div>
              {hasProfile && <Link href="/recommendations" className="inline-flex min-h-10 items-center justify-center gap-2 rounded-xl border border-white/10 px-3.5 text-sm text-zinc-300 hover:text-white">Open all <ArrowRight className="h-4 w-4" /></Link>}
            </div>
            {hasProfile ? <div className="mt-6 grid grid-cols-2 gap-2 sm:grid-cols-4">
              {levelMeta.map((item) => <div key={item.key} className={`rounded-2xl border p-4 ${item.bg}`}>
                <p className={`text-xs ${item.color}`}>{item.label}</p>
                <p className="mt-2 font-mono text-2xl font-semibold">{recommendationsLoading ? "…" : counts[item.key]}</p>
                <p className="mt-1 text-[11px] text-zinc-600">colleges</p>
              </div>)}
            </div> : <Link href="/analyze" className="mt-6 flex min-h-24 items-center justify-between rounded-2xl border border-dashed border-white/15 bg-black/20 p-5 text-sm text-zinc-400 hover:border-indigo-400/30 hover:text-white"><span>Add cutoff, general rank and preferences</span><ArrowRight className="h-4 w-4" /></Link>}
          </div>

          <div className="rounded-[28px] border border-white/10 bg-zinc-900/30 p-5 sm:p-7">
            <div className="flex items-center justify-between">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-cyan-500/10 text-cyan-200"><CalendarCheck2 className="h-5 w-5" /></div>
              <span className="font-mono text-xs text-zinc-500">{journeyProgress}% journey</span>
            </div>
            <h2 className="mt-5 text-lg font-semibold">{progress ? stage.title : "Set your counselling stage"}</h2>
            <p className="mt-2 text-sm leading-6 text-zinc-500">{progress ? stage.summary : "Tell CampusAI what your TNEA dashboard currently shows."}</p>
            <div className="mt-5 rounded-xl border border-cyan-400/15 bg-cyan-500/[0.05] p-3.5">
              <p className="text-[11px] uppercase tracking-[0.14em] text-cyan-300">Relevant date</p>
              <p className="mt-1.5 text-sm font-medium text-zinc-200">{nextDeadline}</p>
            </div>
            <Link href="/counselling" className="mt-5 inline-flex items-center gap-2 text-sm text-zinc-300 hover:text-white">{progress ? "Open action centre" : "Personalize tracker"} <ArrowRight className="h-3.5 w-3.5" /></Link>
          </div>
        </section>

        <section className="mt-5 grid gap-3 sm:grid-cols-2">
          <Link href="/counsellor" className="group flex items-center gap-4 rounded-2xl border border-white/10 bg-white/[0.025] p-5 transition hover:border-violet-400/25 hover:bg-violet-500/[0.045]">
            <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-violet-500/10 text-violet-200"><Bot className="h-5 w-5" /></div>
            <div className="min-w-0"><p className="font-medium">Ask your AI counsellor</p><p className="mt-1 text-xs leading-5 text-zinc-500">Get an evidence-grounded answer about colleges or the process.</p></div>
            <ArrowRight className="ml-auto h-4 w-4 shrink-0 text-zinc-600 transition group-hover:translate-x-1 group-hover:text-white" />
          </Link>
          <Link href="/recommendations" className="group flex items-center gap-4 rounded-2xl border border-white/10 bg-white/[0.025] p-5 transition hover:border-indigo-400/25 hover:bg-indigo-500/[0.045]">
            <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-indigo-500/10 text-indigo-200"><Compass className="h-5 w-5" /></div>
            <div className="min-w-0"><p className="font-medium">Review college options</p><p className="mt-1 text-xs leading-5 text-zinc-500">Revisit the evidence before making any high-stakes choice.</p></div>
            <ArrowRight className="ml-auto h-4 w-4 shrink-0 text-zinc-600 transition group-hover:translate-x-1 group-hover:text-white" />
          </Link>
        </section>

        <div className="mt-8 flex items-center justify-center gap-2 text-[11px] leading-5 text-zinc-700"><CheckCircle2 className="h-3.5 w-3.5" /> CampusAI never asks for or accesses your official TNEA login.</div>
      </div>
    </main>
  );
}
