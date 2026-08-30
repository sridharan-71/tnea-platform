"use client";

import { useEffect, useMemo, useState } from "react";
import Link from "next/link";
import {
  AlertTriangle, ArrowRight, BookOpenCheck, CalendarDays, Check, CheckCircle2,
  ChevronRight, Circle, Clock3, ExternalLink, FileCheck2, Info, Landmark,
  ListChecks, MapPinCheck, PlayCircle, RotateCcw, ShieldCheck, Sparkles,
} from "lucide-react";

import {
  CONFIRMATION_OPTIONS, EXPLAINER_VIDEO_URL, OFFICIAL_MILESTONES,
  GENERAL_ACADEMIC_ROUND_SCHEDULE,
  OFFICIAL_PORTAL_URL, OFFICIAL_PROCEDURE_URL, OFFICIAL_SCHEDULE_URL,
  PATHWAY_LABELS, PROCESS_STAGES, VERIFIED_ON,
  type CounsellingPathway, type CounsellingRound, type CounsellingStageId,
} from "@/lib/counselling/tnea2026";
import {
  COUNSELLING_PROGRESS_KEY as STORAGE_KEY,
  notifyStudentStateChanged,
  type SavedCounsellingProgress as SavedProgress,
} from "@/lib/account/studentState";
import { useAuth } from "@/components/auth/AuthProvider";

const stageIcons = {
  rank_ready: FileCheck2,
  waiting_round: Clock3,
  choice_filling: ListChecks,
  allotment: BookOpenCheck,
  confirmation: ShieldCheck,
  upward: RotateCcw,
  reporting: MapPinCheck,
  joined: CheckCircle2,
};

export default function CounsellingActionCentre() {
  const { user } = useAuth();
  const [stageId, setStageId] = useState<CounsellingStageId>("waiting_round");
  const [pathway, setPathway] = useState<CounsellingPathway>("academic");
  const [round, setRound] = useState<CounsellingRound>("not_sure");
  const [completed, setCompleted] = useState<string[]>([]);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    const timer = window.setTimeout(() => {
      const raw = window.localStorage.getItem(STORAGE_KEY);
      if (raw) {
        try {
          const saved = JSON.parse(raw) as Partial<SavedProgress>;
          if (PROCESS_STAGES.some((stage) => stage.id === saved.stage)) setStageId(saved.stage!);
          if (saved.pathway && saved.pathway in PATHWAY_LABELS) setPathway(saved.pathway);
          if (saved.round && ["1", "2", "3", "not_sure"].includes(saved.round)) setRound(saved.round);
          if (Array.isArray(saved.completed)) setCompleted(saved.completed.filter((item): item is string => typeof item === "string"));
        } catch {
          window.localStorage.removeItem(STORAGE_KEY);
        }
      }
      setReady(true);
    }, 0);
    return () => window.clearTimeout(timer);
  }, []);

  useEffect(() => {
    if (!ready) return;
    const meaningfulProgress = stageId !== "waiting_round"
      || pathway !== "academic"
      || round !== "not_sure"
      || completed.length > 0;
    if (!meaningfulProgress && !window.localStorage.getItem(STORAGE_KEY)) return;
    const progress: SavedProgress = { stage: stageId, pathway, round, completed };
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
    notifyStudentStateChanged("counselling");
  }, [completed, pathway, ready, round, stageId]);

  const stage = PROCESS_STAGES.find((item) => item.id === stageId) ?? PROCESS_STAGES[1];
  const exactRound = pathway === "academic" && round !== "not_sure"
    ? GENERAL_ACADEMIC_ROUND_SCHEDULE[round] : null;
  const stageIndex = PROCESS_STAGES.findIndex((item) => item.id === stage.id);
  const checkedForStage = stage.checklist.filter((item) => completed.includes(`${stage.id}:${item.id}`)).length;
  const stageProgress = Math.round((checkedForStage / stage.checklist.length) * 100);
  const overallProgress = Math.round(((stageIndex + stageProgress / 100) / PROCESS_STAGES.length) * 100);

  const nextLabel = useMemo(() => {
    if (stage.id === "joined") return "Admission completed";
    return PROCESS_STAGES[stageIndex + 1]?.title ?? "Complete";
  }, [stage.id, stageIndex]);

  const toggleCheck = (itemId: string) => {
    const key = `${stage.id}:${itemId}`;
    setCompleted((items) => items.includes(key) ? items.filter((item) => item !== key) : [...items, key]);
  };

  return (
    <div className="mx-auto w-full max-w-7xl">
      <header className="relative overflow-hidden rounded-3xl border border-white/10 bg-[radial-gradient(circle_at_top_left,rgba(34,211,238,0.14),transparent_32%),radial-gradient(circle_at_90%_20%,rgba(99,102,241,0.18),transparent_34%),rgba(9,9,11,0.96)] p-5 sm:p-8 lg:p-10">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.025)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.025)_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="relative">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
            <div>
              <span className="inline-flex items-center gap-2 rounded-full border border-cyan-300/20 bg-cyan-400/10 px-3 py-1.5 text-xs font-medium text-cyan-100">
                <CalendarDays className="h-3.5 w-3.5" /> TNEA 2026 Action Centre
              </span>
              <h1 className="mt-5 max-w-3xl text-3xl font-bold tracking-tight text-white sm:text-5xl">
                Know exactly what to do next.
              </h1>
              <p className="mt-4 max-w-2xl text-sm leading-6 text-zinc-400 sm:text-base sm:leading-7">
                A private, self-reported counselling tracker built from the official TNEA procedure. CampusAI never reads or controls your TNEA account.
              </p>
            </div>
            <div className="shrink-0 rounded-2xl border border-emerald-400/20 bg-emerald-400/[0.07] p-4 sm:max-w-[240px]">
              <div className="flex items-center gap-2 text-xs font-medium text-emerald-200"><ShieldCheck className="h-4 w-4" /> Official evidence checked</div>
              <p className="mt-2 text-xs leading-5 text-zinc-500">Verified {VERIFIED_ON}. Dates remain subject to official TNEA updates.</p>
            </div>
          </div>
        </div>
      </header>

      <section className="mt-5 grid gap-5 lg:grid-cols-[1.4fr_0.85fr]">
        <div className="overflow-hidden rounded-3xl border border-indigo-400/20 bg-gradient-to-br from-indigo-500/[0.12] via-zinc-950 to-zinc-950">
          <div className="border-b border-white/[0.08] p-5 sm:p-7">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.18em] text-indigo-300">Your current action</p>
                <h2 className="mt-2 text-2xl font-semibold text-white">{stage.title}</h2>
              </div>
              <span className="inline-flex w-fit items-center gap-2 rounded-xl border border-white/10 bg-black/30 px-3 py-2 text-xs text-zinc-300">
                <Clock3 className="h-4 w-4 text-indigo-300" /> {stage.deadlineRule}
              </span>
            </div>
            <p className="mt-4 max-w-3xl text-sm leading-6 text-zinc-400">{stage.summary}</p>
            {exactRound && <div className="mt-4 grid gap-2 rounded-2xl border border-cyan-400/15 bg-cyan-500/[0.055] p-3.5 text-xs sm:grid-cols-3">
              <div><span className="block text-zinc-600">Round {round} rank range</span><strong className="mt-1 block font-mono font-medium text-cyan-100">{exactRound.rank}</strong></div>
              <div><span className="block text-zinc-600">Choice filling</span><strong className="mt-1 block font-medium text-cyan-100">{exactRound.choice}</strong></div>
              <div><span className="block text-zinc-600">Confirmation</span><strong className="mt-1 block font-medium text-cyan-100">{exactRound.confirm}</strong></div>
            </div>}
          </div>

          <div className="p-5 sm:p-7">
            <div className="rounded-2xl border border-white/10 bg-white/[0.045] p-4 sm:p-5">
              <div className="flex items-start gap-3">
                <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-indigo-500/15 text-indigo-200">
                  <ArrowRight className="h-5 w-5" />
                </div>
                <div>
                  <p className="text-xs font-semibold uppercase tracking-[0.15em] text-zinc-500">Do this next</p>
                  <p className="mt-2 text-base font-medium leading-7 text-zinc-100">{stage.nextAction}</p>
                </div>
              </div>
            </div>

            <div className="mt-3 flex items-start gap-3 rounded-2xl border border-amber-400/20 bg-amber-500/[0.07] p-4 text-amber-100">
              <AlertTriangle className="mt-0.5 h-5 w-5 shrink-0 text-amber-300" />
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.15em] text-amber-300">If this is missed</p>
                <p className="mt-1.5 text-sm leading-6 text-amber-100/80">{stage.missedConsequence}</p>
              </div>
            </div>

            <div className="mt-6">
              <div className="flex items-end justify-between gap-4">
                <div>
                  <p className="text-sm font-semibold text-white">Stage checklist</p>
                  <p className="mt-1 text-xs text-zinc-500">{user ? "Synced to your CampusAI account." : "Saved only on this device."}</p>
                </div>
                <span className="font-mono text-sm text-zinc-400">{checkedForStage}/{stage.checklist.length}</span>
              </div>
              <div className="mt-4 space-y-2">
                {stage.checklist.map((item) => {
                  const key = `${stage.id}:${item.id}`;
                  const checked = completed.includes(key);
                  return (
                    <button
                      key={item.id}
                      type="button"
                      onClick={() => toggleCheck(item.id)}
                      aria-pressed={checked}
                      className={`flex min-h-12 w-full items-center gap-3 rounded-xl border px-3.5 py-3 text-left text-sm transition ${
                        checked ? "border-emerald-400/25 bg-emerald-500/[0.08] text-emerald-100" : "border-white/[0.08] bg-black/20 text-zinc-300 hover:border-white/20"
                      }`}
                    >
                      <span className={`flex h-6 w-6 shrink-0 items-center justify-center rounded-lg border ${checked ? "border-emerald-400/30 bg-emerald-400/15" : "border-white/15"}`}>
                        {checked && <Check className="h-3.5 w-3.5" />}
                      </span>
                      {item.label}
                    </button>
                  );
                })}
              </div>
            </div>

            <div className="mt-6 flex flex-col gap-3 border-t border-white/[0.08] pt-5 sm:flex-row sm:items-center sm:justify-between">
              <p className="text-xs leading-5 text-zinc-500">Next stage: <span className="text-zinc-300">{nextLabel}</span></p>
              <a href={OFFICIAL_PORTAL_URL} target="_blank" rel="noreferrer" className="inline-flex min-h-11 w-full items-center justify-center gap-2 rounded-xl bg-white px-4 py-2.5 text-sm font-semibold text-black transition hover:bg-zinc-200 sm:w-auto">
                Open official TNEA portal <ExternalLink className="h-4 w-4" />
              </a>
            </div>
          </div>
        </div>

        <aside className="rounded-3xl border border-white/10 bg-zinc-900/35 p-5 sm:p-6">
          <p className="text-xs font-semibold uppercase tracking-[0.18em] text-zinc-500">Personalize this tracker</p>
          <h2 className="mt-2 text-xl font-semibold text-white">Where are you now?</h2>
          <p className="mt-2 text-sm leading-6 text-zinc-500">Choose the answer that matches your official TNEA dashboard.</p>

          <div className="mt-5 grid grid-cols-2 gap-2">
            {PROCESS_STAGES.map((item) => {
              const Icon = stageIcons[item.id];
              const active = item.id === stage.id;
              return (
                <button key={item.id} type="button" onClick={() => setStageId(item.id)} aria-pressed={active} className={`min-h-20 rounded-2xl border p-3 text-left transition ${active ? "border-indigo-400/40 bg-indigo-500/15 text-white ring-1 ring-indigo-300/20" : "border-white/[0.08] bg-black/20 text-zinc-500 hover:border-white/20 hover:text-zinc-300"}`}>
                  <Icon className={`h-4 w-4 ${active ? "text-indigo-300" : ""}`} />
                  <span className="mt-2 block text-xs font-medium leading-4">{item.shortLabel}</span>
                </button>
              );
            })}
          </div>

          <div className="mt-6 border-t border-white/[0.08] pt-5">
            <p className="text-xs font-medium text-zinc-400">My counselling pathway</p>
            <div className="mt-3 flex flex-wrap gap-2">
              {(Object.entries(PATHWAY_LABELS) as Array<[CounsellingPathway, string]>).map(([value, label]) => (
                <button key={value} type="button" onClick={() => setPathway(value)} aria-pressed={pathway === value} className={`min-h-11 rounded-xl border px-3 py-2 text-xs transition ${pathway === value ? "border-cyan-400/35 bg-cyan-500/10 text-cyan-100" : "border-white/[0.08] text-zinc-500"}`}>{label}</button>
              ))}
            </div>
          </div>

          <div className="mt-5">
            <p className="text-xs font-medium text-zinc-400">My round</p>
            <div className="mt-3 grid grid-cols-4 gap-2">
              {(["1", "2", "3", "not_sure"] as CounsellingRound[]).map((value) => (
                <button key={value} type="button" onClick={() => setRound(value)} aria-pressed={round === value} className={`min-h-11 rounded-xl border px-2 py-2 text-xs transition ${round === value ? "border-indigo-400/35 bg-indigo-500/10 text-indigo-100" : "border-white/[0.08] text-zinc-500"}`}>{value === "not_sure" ? "Not sure" : `R${value}`}</button>
              ))}
            </div>
          </div>

          <div className="mt-6 rounded-2xl border border-white/[0.08] bg-black/20 p-4">
            <div className="flex items-center justify-between text-xs">
              <span className="text-zinc-500">Journey progress</span>
              <span className="font-mono text-zinc-300">{overallProgress}%</span>
            </div>
            <div className="mt-3 h-2 overflow-hidden rounded-full bg-white/[0.07]">
              <div className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-cyan-400 transition-all duration-500" style={{ width: `${overallProgress}%` }} />
            </div>
          </div>
        </aside>
      </section>

      <section className="mt-5 grid gap-5 lg:grid-cols-[0.9fr_1.1fr]">
        <div className="rounded-3xl border border-white/10 bg-zinc-900/30 p-5 sm:p-7">
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-cyan-500/10 text-cyan-200"><CalendarDays className="h-5 w-5" /></div>
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.16em] text-cyan-300">Official 2026 schedule</p>
              <h2 className="mt-1 text-xl font-semibold text-white">Season timeline</h2>
            </div>
          </div>

          <div className="mt-5 rounded-2xl border border-cyan-400/20 bg-cyan-500/[0.06] p-4">
            <p className="text-xs text-cyan-200">General counselling window</p>
            <div className="mt-2 flex flex-wrap items-end justify-between gap-2">
              <p className="text-lg font-semibold text-white">20 Jul – 30 Aug</p>
              <p className="font-mono text-sm text-cyan-200">Official window active</p>
            </div>
            <p className="mt-2 text-xs leading-5 text-zinc-500">This is the overall tentative window—not your personal round deadline.</p>
          </div>

          <ol className="mt-5 space-y-1">
            {OFFICIAL_MILESTONES.map((milestone) => (
              <li key={milestone.label} className="flex items-center gap-3 rounded-xl px-2 py-2.5">
                {milestone.status === "active" ? <span className="relative flex h-5 w-5 shrink-0 items-center justify-center"><span className="absolute h-5 w-5 animate-ping rounded-full bg-cyan-400/20" /><span className="relative h-2.5 w-2.5 rounded-full bg-cyan-300" /></span> : <CheckCircle2 className="h-5 w-5 shrink-0 text-emerald-500/70" />}
                <div className="flex min-w-0 flex-1 items-center justify-between gap-3">
                  <span className={`text-sm ${milestone.status === "active" ? "font-medium text-white" : "text-zinc-500"}`}>{milestone.label}</span>
                  <span className="shrink-0 text-right text-xs text-zinc-600">{milestone.date}</span>
                </div>
              </li>
            ))}
          </ol>
        </div>

        <div className="rounded-3xl border border-white/10 bg-zinc-900/30 p-5 sm:p-7">
          <div className="flex items-start justify-between gap-4">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.16em] text-violet-300">Understand before selecting</p>
              <h2 className="mt-2 text-xl font-semibold text-white">Six confirmation options</h2>
              <p className="mt-2 text-sm leading-6 text-zinc-500">These appear after allotment. Expand each one to understand what happens to the current seat.</p>
            </div>
            <Info className="h-5 w-5 shrink-0 text-violet-300" />
          </div>

          <div className="mt-5 space-y-2">
            {CONFIRMATION_OPTIONS.map((option) => (
              <details key={option.title} className="group rounded-2xl border border-white/[0.08] bg-black/20 open:border-violet-400/20 open:bg-violet-500/[0.05]">
                <summary className="flex min-h-14 cursor-pointer list-none items-center justify-between gap-3 px-4 py-3 text-sm font-medium text-zinc-200">
                  <span className="flex items-center gap-3">
                    {option.keepsSeat ? <ShieldCheck className="h-4 w-4 shrink-0 text-emerald-300" /> : <Circle className="h-4 w-4 shrink-0 text-amber-300" />}
                    {option.title}
                  </span>
                  <ChevronRight className="h-4 w-4 shrink-0 text-zinc-600 transition group-open:rotate-90" />
                </summary>
                <div className="border-t border-white/[0.07] px-4 py-4">
                  <p className="text-sm leading-6 text-zinc-300">{option.description}</p>
                  <p className="mt-2 text-xs leading-5 text-amber-200/70">{option.warning}</p>
                </div>
              </details>
            ))}
          </div>
        </div>
      </section>

      <section className="mt-5 rounded-3xl border border-white/10 bg-gradient-to-r from-white/[0.04] to-transparent p-5 sm:p-7">
        <div className="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
          <div>
            <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.16em] text-emerald-300"><Landmark className="h-4 w-4" /> Sources and safety</div>
            <h2 className="mt-2 text-xl font-semibold text-white">Official rules first. Explanation second.</h2>
            <p className="mt-2 max-w-2xl text-sm leading-6 text-zinc-500">CampusAI does not know your live portal status. Always follow the dates and instructions inside your own TNEA login and allotment order.</p>
          </div>
          <div className="grid gap-2 sm:grid-cols-2 lg:min-w-[470px]">
            <a href={OFFICIAL_PROCEDURE_URL} target="_blank" rel="noreferrer" className="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl bg-white px-4 py-3 text-sm font-semibold text-black">Official procedure <ExternalLink className="h-4 w-4" /></a>
            <a href={OFFICIAL_SCHEDULE_URL} target="_blank" rel="noreferrer" className="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl border border-white/10 px-4 py-3 text-sm text-zinc-200">Official schedule <ExternalLink className="h-4 w-4" /></a>
            <a href={EXPLAINER_VIDEO_URL} target="_blank" rel="noreferrer" className="inline-flex min-h-12 items-center justify-center gap-2 rounded-xl border border-white/10 px-4 py-3 text-sm text-zinc-300 sm:col-span-2"><PlayCircle className="h-4 w-4 text-red-300" /> Watch the supplied video explanation</a>
          </div>
        </div>
      </section>

      <section className="mt-5 flex flex-col gap-4 rounded-3xl border border-indigo-400/20 bg-indigo-500/[0.06] p-5 sm:flex-row sm:items-center sm:justify-between sm:p-7">
        <div>
          <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.16em] text-indigo-300"><Sparkles className="h-4 w-4" /> Recommendation support</div>
          <p className="mt-2 text-sm leading-6 text-zinc-400">When you are preparing choices, use your college recommendations as evidence—not as a guarantee.</p>
        </div>
        <Link href="/analyze" className="inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl border border-indigo-300/20 bg-indigo-400/10 px-4 py-3 text-sm font-semibold text-indigo-100 transition hover:bg-indigo-400/15 sm:w-auto">Open recommendations <ArrowRight className="h-4 w-4" /></Link>
      </section>
    </div>
  );
}
