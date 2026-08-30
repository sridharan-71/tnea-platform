"use client";

import { ChangeEvent, DragEvent, useEffect, useMemo, useRef, useState } from "react";
import Link from "next/link";
import {
  AlertTriangle, ArrowLeft, ArrowRight, Check, CheckCircle2, ChevronDown,
  ClipboardCheck, FileText, ListChecks, LoaderCircle, LockKeyhole,
  RefreshCcw, ShieldCheck, Sparkles, Target, Upload, XCircle,
} from "lucide-react";

import { readStudentProfile } from "@/lib/account/studentState";
import type {
  ChoiceAuditPreferences,
  ChoiceAuditResult,
  ChoicePriority,
  ParsedChoice,
  SafetyPreference,
} from "@/lib/choice-filling/types";
import type { StudentProfile } from "@/lib/types/student";

type Stage = "upload" | "branches" | "priority" | "expected" | "safety" | "result";

interface ParseResponse {
  choices: ParsedChoice[];
  sourceName: string;
  unmatchedLines: number;
  fileStored: false;
  error?: string;
}

const STAGES: Stage[] = ["upload", "branches", "priority", "expected", "safety", "result"];
const QUESTION_STAGES: Stage[] = ["branches", "priority", "expected", "safety"];

const PRIORITY_OPTIONS: Array<{ value: ChoicePriority; title: string; description: string }> = [
  { value: "college_first", title: "College matters more", description: "I may accept another suitable branch for a substantially better college." },
  { value: "balanced", title: "College and branch equally", description: "I want the strongest sensible combination of both." },
  { value: "branch_first", title: "Branch matters more", description: "I would choose my preferred branch even at a less prominent college." },
];

const SAFETY_OPTIONS: Array<{ value: SafetyPreference; title: string; description: string }> = [
  { value: "balanced", title: "Balanced list", description: "Keep ambitious choices at the top and enough safe choices at the bottom." },
  { value: "safety_first", title: "Admission security matters most", description: "I still want true preference order, with stronger fallback depth." },
  { value: "ambitious", title: "I want to stretch", description: "Include more ambitious options without removing the final safety net." },
];

function McqCard({ selected, title, description, onClick }: {
  selected: boolean;
  title: string;
  description?: string;
  onClick: () => void;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-pressed={selected}
      className={`motion-tap flex w-full items-start gap-3 rounded-2xl border p-4 text-left sm:p-5 ${
        selected
          ? "border-indigo-400/60 bg-indigo-500/[0.12] shadow-[0_16px_45px_rgba(49,46,129,0.16)]"
          : "border-white/10 bg-white/[0.025] hover:border-white/20 hover:bg-white/[0.045]"
      }`}
    >
      <span className={`mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full border ${
        selected ? "border-indigo-300 bg-indigo-400 text-black" : "border-white/20"
      }`}>
        {selected && <Check className="h-3.5 w-3.5" strokeWidth={3} />}
      </span>
      <span>
        <span className="block text-sm font-semibold text-white sm:text-[15px]">{title}</span>
        {description && <span className="mt-1 block text-xs leading-5 text-zinc-500 sm:text-sm">{description}</span>}
      </span>
    </button>
  );
}

function StepHeading({ eyebrow, title, description }: {
  eyebrow: string;
  title: string;
  description: string;
}) {
  return (
    <div>
      <p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-300">{eyebrow}</p>
      <h2 className="mt-3 text-2xl font-semibold tracking-tight text-white sm:text-3xl">{title}</h2>
      <p className="mt-3 max-w-2xl text-sm leading-6 text-zinc-400 sm:text-base">{description}</p>
    </div>
  );
}

function levelLabel(value: string) {
  return value.replace("_", " ").replace(/\b\w/g, (letter) => letter.toUpperCase());
}

export default function ChoiceListRater() {
  const fileInput = useRef<HTMLInputElement>(null);
  const [profile, setProfile] = useState<StudentProfile | null>(null);
  const [ready, setReady] = useState(false);
  const [stage, setStage] = useState<Stage>("upload");
  const [file, setFile] = useState<File | null>(null);
  const [pastedText, setPastedText] = useState("");
  const [dragging, setDragging] = useState(false);
  const [parsed, setParsed] = useState<ParseResponse | null>(null);
  const [preferences, setPreferences] = useState<ChoiceAuditPreferences>({
    likedBranches: [],
    priority: "balanced",
    safetyPreference: "balanced",
    expectedCollegeCode: null,
  });
  const [result, setResult] = useState<ChoiceAuditResult | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    const timer = window.setTimeout(() => {
      setProfile(readStudentProfile());
      setReady(true);
    }, 0);
    return () => window.clearTimeout(timer);
  }, []);

  const profileComplete = Boolean(profile?.cutoff && profile?.community && profile.preferredBranches.length);
  const availableBranches = useMemo(() => {
    if (!parsed) return [];
    const branches = new Map<string, string>();
    for (const choice of parsed.choices) branches.set(choice.branchCode, choice.branchName);
    return [...branches.entries()].map(([code, name]) => ({ code, name }));
  }, [parsed]);
  const availableColleges = useMemo(() => {
    if (!parsed) return [];
    const colleges = new Map<number, string>();
    for (const choice of parsed.choices) {
      if (!colleges.has(choice.collegeCode)) colleges.set(choice.collegeCode, choice.collegeName);
    }
    return [...colleges.entries()].map(([code, name]) => ({ code, name })).slice(0, 30);
  }, [parsed]);
  const questionNumber = Math.max(0, QUESTION_STAGES.indexOf(stage)) + 1;

  function chooseFile(nextFile: File | null) {
    setError("");
    if (!nextFile) return;
    if (nextFile.size > 5 * 1024 * 1024) {
      setError("Choose a PDF, TXT or CSV smaller than 5 MB.");
      return;
    }
    setFile(nextFile);
  }

  function handleDrop(event: DragEvent<HTMLDivElement>) {
    event.preventDefault();
    setDragging(false);
    chooseFile(event.dataTransfer.files[0] ?? null);
  }

  async function parseUpload() {
    if (!file && pastedText.trim().length < 8) {
      setError("Upload your choice-list PDF or paste the college and branch codes.");
      return;
    }
    setBusy(true);
    setError("");
    try {
      const formData = new FormData();
      if (file) formData.append("file", file);
      if (pastedText.trim()) formData.append("text", pastedText.trim());
      const response = await fetch("/api/choice-list/parse", { method: "POST", body: formData });
      const payload = await response.json() as ParseResponse;
      if (!response.ok || !Array.isArray(payload.choices)) {
        throw new Error(payload.error ?? "CampusAI could not read this choice list.");
      }
      setParsed(payload);
      const detected = [...new Set(payload.choices.map((choice) => choice.branchCode))];
      const saved = profile?.preferredBranches.filter((branch) => detected.includes(branch)) ?? [];
      setPreferences((current) => ({
        ...current,
        likedBranches: saved.length ? saved : detected.slice(0, Math.min(3, detected.length)),
      }));
      setStage("branches");
    } catch (reason) {
      setError(reason instanceof Error ? reason.message : "CampusAI could not read this choice list.");
    } finally {
      setBusy(false);
    }
  }

  function toggleBranch(code: string) {
    setPreferences((current) => ({
      ...current,
      likedBranches: current.likedBranches.includes(code)
        ? current.likedBranches.filter((branch) => branch !== code)
        : [...current.likedBranches, code],
    }));
  }

  async function runAudit() {
    if (!profile || !parsed) return;
    setBusy(true);
    setError("");
    try {
      const response = await fetch("/api/choice-list/audit", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ profile, choices: parsed.choices, preferences }),
      });
      const payload = await response.json() as ChoiceAuditResult & { error?: string };
      if (!response.ok || typeof payload.score !== "number") {
        throw new Error(payload.error ?? "CampusAI could not audit this choice list.");
      }
      setResult(payload);
      setStage("result");
      window.scrollTo({ top: 0, behavior: "smooth" });
    } catch (reason) {
      setError(reason instanceof Error ? reason.message : "CampusAI could not audit this choice list.");
    } finally {
      setBusy(false);
    }
  }

  function next() {
    setError("");
    if (stage === "branches") {
      if (!preferences.likedBranches.length) {
        setError("Choose at least one branch you would genuinely study.");
        return;
      }
      setStage("priority");
    } else if (stage === "priority") setStage("expected");
    else if (stage === "expected") setStage("safety");
    else if (stage === "safety") void runAudit();
  }

  function back() {
    const index = STAGES.indexOf(stage);
    if (index > 0) setStage(STAGES[index - 1]);
  }

  function reset() {
    setStage("upload");
    setFile(null);
    setPastedText("");
    setParsed(null);
    setResult(null);
    setError("");
    setPreferences({
      likedBranches: [],
      priority: "balanced",
      safetyPreference: "balanced",
      expectedCollegeCode: null,
    });
  }

  if (!ready) {
    return <div className="mx-auto h-[620px] max-w-5xl animate-pulse rounded-3xl border border-white/10 bg-white/[0.025]" />;
  }

  return (
    <div className="mx-auto w-full max-w-6xl">
      <header className="motion-scan relative overflow-hidden rounded-3xl border border-white/10 bg-[radial-gradient(circle_at_12%_5%,rgba(99,102,241,0.2),transparent_32%),radial-gradient(circle_at_90%_20%,rgba(34,211,238,0.09),transparent_27%),rgba(9,9,11,0.98)] p-5 sm:p-8">
        <div className="motion-grid-drift absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.022)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.022)_1px,transparent_1px)] bg-[size:36px_36px]" />
        <div className="relative">
          <span className="inline-flex items-center gap-2 rounded-full border border-indigo-300/20 bg-indigo-400/10 px-3 py-1.5 text-xs font-medium text-indigo-100">
            <ClipboardCheck className="h-3.5 w-3.5" /> TNEA 2026 choice-list audit
          </span>
          <h1 className="mt-5 max-w-3xl text-3xl font-bold tracking-tight text-white sm:text-5xl">
            Know what is weak before you lock it.
          </h1>
          <p className="mt-3 max-w-2xl text-sm leading-6 text-zinc-400 sm:text-base sm:leading-7">
            Upload your draft list. CampusAI checks whether it follows your real preferences, contains enough admission safety and avoids preventable mistakes.
          </p>
          <div className="mt-5 flex flex-wrap gap-2 text-[11px] text-zinc-500 sm:text-xs">
            <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5">Active 2026 choices only</span>
            <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5">Your file is not stored</span>
            <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5">No allotment guarantees</span>
          </div>
        </div>
      </header>

      {!profileComplete && (
        <section className="mt-5 rounded-3xl border border-amber-400/20 bg-amber-500/[0.07] p-5 sm:p-6">
          <div className="flex items-start gap-3">
            <AlertTriangle className="mt-0.5 h-5 w-5 shrink-0 text-amber-300" />
            <div>
              <h2 className="text-sm font-semibold text-amber-100">Create your admission profile first</h2>
              <p className="mt-1 text-xs leading-5 text-zinc-400">Your general rank, cutoff and community are required to judge whether the list has realistic safety coverage.</p>
              <Link href="/analyze" className="mt-4 inline-flex min-h-11 items-center gap-2 rounded-xl bg-white px-4 text-sm font-semibold text-black">
                Add my details <ArrowRight className="h-4 w-4" />
              </Link>
            </div>
          </div>
        </section>
      )}

      {profileComplete && stage !== "result" && (
        <section className="mt-5 overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-white/[0.05] to-white/[0.018] shadow-[0_30px_90px_rgba(0,0,0,0.3)]">
          {stage !== "upload" && (
            <div className="border-b border-white/[0.08] px-5 py-4 sm:px-8">
              <div className="flex items-center justify-between text-xs">
                <span className="font-medium text-zinc-300">Question {questionNumber} of {QUESTION_STAGES.length}</span>
                <span className="text-zinc-600">{parsed?.choices.length ?? 0} choices read</span>
              </div>
              <div className="mt-3 h-1 overflow-hidden rounded-full bg-white/[0.07]">
                <div className="h-full rounded-full bg-gradient-to-r from-indigo-500 via-violet-400 to-cyan-300 transition-all duration-500" style={{ width: `${questionNumber / QUESTION_STAGES.length * 100}%` }} />
              </div>
            </div>
          )}

          <div key={stage} className="motion-pop min-h-[450px] p-5 pb-28 sm:min-h-[520px] sm:p-8">
            {stage === "upload" && (
              <>
                <StepHeading eyebrow="Step 1" title="Upload your draft choice list" description="A text-based PDF works best. You can also upload TXT/CSV or paste college-code and branch-code pairs." />
                <input
                  ref={fileInput}
                  type="file"
                  accept=".pdf,.txt,.csv,application/pdf,text/plain,text/csv"
                  className="sr-only"
                  onChange={(event: ChangeEvent<HTMLInputElement>) => chooseFile(event.target.files?.[0] ?? null)}
                />
                <div
                  onDragOver={(event) => { event.preventDefault(); setDragging(true); }}
                  onDragLeave={() => setDragging(false)}
                  onDrop={handleDrop}
                  className={`mt-7 rounded-3xl border border-dashed p-7 text-center transition sm:p-10 ${
                    dragging ? "border-indigo-300 bg-indigo-500/10" : "border-white/15 bg-black/20"
                  }`}
                >
                  <div className="motion-ai-orb mx-auto flex h-14 w-14 items-center justify-center rounded-2xl border border-indigo-400/20 bg-indigo-500/10">
                    {file ? <FileText className="h-6 w-6 text-indigo-200" /> : <Upload className="h-6 w-6 text-indigo-200" />}
                  </div>
                  <p className="mt-5 text-sm font-semibold text-white">{file ? file.name : "Drop your choice list here"}</p>
                  <p className="mt-1 text-xs text-zinc-600">{file ? `${Math.max(1, Math.round(file.size / 1024))} KB selected` : "PDF, TXT or CSV · maximum 5 MB"}</p>
                  <button type="button" onClick={() => fileInput.current?.click()} className="motion-tap mt-5 min-h-11 rounded-xl border border-white/10 bg-white/[0.05] px-4 text-sm font-medium text-zinc-200 hover:bg-white/[0.09]">
                    {file ? "Choose another file" : "Choose file"}
                  </button>
                </div>
                <details className="mt-4 rounded-2xl border border-white/[0.08] bg-black/15">
                  <summary className="flex min-h-12 cursor-pointer list-none items-center justify-between px-4 text-sm text-zinc-400">
                    Or paste the list <ChevronDown className="h-4 w-4" />
                  </summary>
                  <div className="border-t border-white/[0.07] p-4">
                    <textarea value={pastedText} onChange={(event) => setPastedText(event.target.value.slice(0, 100_000))} rows={7} placeholder={"1 2006 CS\n2 2006 IT\n3 2718 EC"} className="w-full resize-y rounded-xl border border-white/10 bg-black/30 p-4 font-mono text-xs leading-6 text-white outline-none placeholder:text-zinc-700 focus:border-indigo-400/50" />
                  </div>
                </details>
              </>
            )}

            {stage === "branches" && (
              <>
                <StepHeading eyebrow="Your course preference" title="Which branches would you genuinely study?" description="Select every acceptable branch. CampusAI will flag choices that do not match what you actually want." />
                <div className="mt-7 grid gap-3 sm:grid-cols-2">
                  {availableBranches.map((branch) => (
                    <McqCard key={branch.code} selected={preferences.likedBranches.includes(branch.code)} title={`${branch.code} · ${branch.name}`} onClick={() => toggleBranch(branch.code)} />
                  ))}
                </div>
              </>
            )}

            {stage === "priority" && (
              <>
                <StepHeading eyebrow="Your trade-off" title="If you must choose, what matters more?" description="There is no universally correct answer. The audit should follow your actual decision rule." />
                <div className="mt-7 grid max-w-3xl gap-3">
                  {PRIORITY_OPTIONS.map((option) => (
                    <McqCard key={option.value} selected={preferences.priority === option.value} title={option.title} description={option.description} onClick={() => setPreferences((current) => ({ ...current, priority: option.value }))} />
                  ))}
                </div>
              </>
            )}

            {stage === "expected" && (
              <>
                <StepHeading eyebrow="Your expectation" title="Which college do you realistically think you may get?" description="This does not change the evidence. It helps CampusAI explain whether your expectation is ambitious, realistic or conservative." />
                <div className="mt-7 grid max-h-[390px] gap-2.5 overflow-y-auto pr-1 sm:grid-cols-2">
                  <McqCard selected={preferences.expectedCollegeCode === null} title="I’m not sure yet" description="Judge my list without an expected college." onClick={() => setPreferences((current) => ({ ...current, expectedCollegeCode: null }))} />
                  {availableColleges.map((college) => (
                    <McqCard key={college.code} selected={preferences.expectedCollegeCode === college.code} title={college.name} description={`College code ${college.code}`} onClick={() => setPreferences((current) => ({ ...current, expectedCollegeCode: college.code }))} />
                  ))}
                </div>
              </>
            )}

            {stage === "safety" && (
              <>
                <StepHeading eyebrow="Your risk comfort" title="How should your final list balance ambition and safety?" description="Safe choices stay near the bottom. CampusAI never moves them above colleges you genuinely prefer." />
                <div className="mt-7 grid max-w-3xl gap-3">
                  {SAFETY_OPTIONS.map((option) => (
                    <McqCard key={option.value} selected={preferences.safetyPreference === option.value} title={option.title} description={option.description} onClick={() => setPreferences((current) => ({ ...current, safetyPreference: option.value }))} />
                  ))}
                </div>
              </>
            )}

            {error && <div role="alert" className="mt-5 flex items-start gap-2 rounded-xl border border-rose-400/20 bg-rose-500/[0.08] p-3.5 text-xs leading-5 text-rose-200"><XCircle className="mt-0.5 h-4 w-4 shrink-0" />{error}</div>}
          </div>

          <div className="fixed bottom-[76px] left-4 right-4 z-40 mx-auto flex max-w-2xl items-center justify-between gap-3 rounded-2xl border border-white/10 bg-zinc-950/95 px-4 py-3 shadow-[0_20px_60px_rgba(0,0,0,0.55)] backdrop-blur-xl sm:static sm:max-w-none sm:rounded-none sm:border-x-0 sm:border-b-0 sm:bg-black/20 sm:px-8 sm:shadow-none">
            <button type="button" onClick={back} disabled={stage === "upload" || busy} className="inline-flex min-h-11 items-center gap-2 rounded-xl px-3 text-sm text-zinc-500 transition hover:bg-white/5 hover:text-white disabled:pointer-events-none disabled:opacity-0"><ArrowLeft className="h-4 w-4" /> Back</button>
            {stage === "upload" ? (
              <button type="button" onClick={() => void parseUpload()} disabled={busy} className="motion-shine motion-tap inline-flex min-h-12 items-center gap-2 rounded-xl bg-white px-5 text-sm font-semibold text-black disabled:opacity-50">
                {busy ? <LoaderCircle className="h-4 w-4 animate-spin" /> : <Sparkles className="h-4 w-4" />} Read my list
              </button>
            ) : (
              <button type="button" onClick={next} disabled={busy} className="motion-tap inline-flex min-h-12 items-center gap-2 rounded-xl bg-white px-5 text-sm font-semibold text-black disabled:opacity-50">
                {busy ? <><LoaderCircle className="h-4 w-4 animate-spin" /> Auditing…</> : stage === "safety" ? <>Rate my list <ClipboardCheck className="h-4 w-4" /></> : <>Continue <ArrowRight className="h-4 w-4" /></>}
              </button>
            )}
          </div>
        </section>
      )}

      {stage === "result" && result && (
        <div className="motion-pop mt-5 space-y-5">
          <section className="overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-indigo-500/[0.11] via-white/[0.04] to-transparent p-5 sm:p-8">
            <div className="flex flex-col gap-6 sm:flex-row sm:items-center">
              <div className="relative flex h-36 w-36 shrink-0 items-center justify-center rounded-full p-3" style={{ background: `conic-gradient(rgb(129 140 248) ${result.score * 3.6}deg, rgba(255,255,255,0.07) 0deg)` }}>
                <div className="flex h-full w-full flex-col items-center justify-center rounded-full bg-zinc-950">
                  <span className="font-mono text-4xl font-bold text-white">{result.score}</span>
                  <span className="mt-1 text-[10px] uppercase tracking-[0.18em] text-zinc-600">out of 100</span>
                </div>
              </div>
              <div>
                <span className="inline-flex rounded-full border border-indigo-400/20 bg-indigo-500/10 px-3 py-1 text-xs font-medium text-indigo-200">{result.verdict}</span>
                <h2 className="mt-4 text-2xl font-semibold text-white sm:text-3xl">Your choice-list audit</h2>
                <p className="mt-2 max-w-2xl text-sm leading-6 text-zinc-400">{result.summary}</p>
                <p className="mt-3 text-xs text-zinc-600">{parsed?.sourceName} · {result.choices.length} choices reviewed</p>
              </div>
            </div>
          </section>

          <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-5">
            {result.dimensions.map((dimension) => (
              <div key={dimension.key} className="rounded-2xl border border-white/[0.08] bg-white/[0.025] p-4">
                <div className="flex items-center justify-between text-xs"><span className="text-zinc-500">{dimension.label}</span><span className="font-mono text-zinc-200">{dimension.score}/{dimension.maximum}</span></div>
                <div className="mt-3 h-1.5 overflow-hidden rounded-full bg-white/[0.07]"><div className="h-full rounded-full bg-indigo-400" style={{ width: `${dimension.score / dimension.maximum * 100}%` }} /></div>
                <p className="mt-3 text-[11px] leading-5 text-zinc-600">{dimension.summary}</p>
              </div>
            ))}
          </section>

          <section className="grid gap-5 lg:grid-cols-2">
            <div className="rounded-3xl border border-white/10 bg-white/[0.025] p-5 sm:p-6">
              <div className="flex items-center gap-2"><Target className="h-5 w-5 text-amber-300" /><h2 className="text-lg font-semibold text-white">What needs attention</h2></div>
              <div className="mt-5 space-y-3">
                {result.findings.length ? result.findings.map((finding) => (
                  <div key={finding} className="flex items-start gap-3 rounded-xl border border-white/[0.07] bg-black/20 p-3.5 text-xs leading-5 text-zinc-300">
                    <AlertTriangle className="mt-0.5 h-4 w-4 shrink-0 text-amber-300" />{finding}
                  </div>
                )) : <div className="flex items-center gap-3 rounded-xl border border-emerald-400/15 bg-emerald-500/[0.06] p-4 text-sm text-emerald-200"><CheckCircle2 className="h-5 w-5" />No major structural problem was detected.</div>}
              </div>
            </div>

            <div className="rounded-3xl border border-indigo-400/15 bg-indigo-500/[0.045] p-5 sm:p-6">
              <div className="flex items-center gap-2"><Sparkles className="h-5 w-5 text-indigo-300" /><h2 className="text-lg font-semibold text-white">Recommended improvements</h2></div>
              <div className="mt-5 space-y-3">
                {result.suggestions.length ? result.suggestions.map((suggestion, index) => (
                  <div key={`${suggestion.title}-${index}`} className="rounded-xl border border-indigo-400/10 bg-black/20 p-4">
                    <div className="flex items-center justify-between gap-3">
                      <p className="text-sm font-medium text-zinc-100">{suggestion.title}</p>
                      <span className="rounded-md bg-indigo-400/10 px-2 py-1 text-[9px] font-semibold uppercase tracking-wider text-indigo-300">{suggestion.type}</span>
                    </div>
                    <p className="mt-2 text-xs leading-5 text-zinc-500">{suggestion.detail}</p>
                  </div>
                )) : <p className="text-sm text-zinc-500">No specific additions are needed from the currently verified evidence.</p>}
              </div>
            </div>
          </section>

          <section className="rounded-3xl border border-white/10 bg-white/[0.02] p-5 sm:p-6">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <div><h2 className="text-lg font-semibold text-white">Admission coverage</h2><p className="mt-1 text-xs text-zinc-600">Reach choices should begin the list; strict Very Safe choices should protect the end.</p></div>
              <div className="flex flex-wrap gap-2 text-xs">
                {(["reach", "target", "safe", "very_safe"] as const).map((level) => <span key={level} className="rounded-lg border border-white/10 bg-black/20 px-2.5 py-1.5 text-zinc-300">{levelLabel(level)} {result.counts[level]}</span>)}
              </div>
            </div>
            <details className="mt-5 rounded-2xl border border-white/[0.07]">
              <summary className="flex min-h-12 cursor-pointer list-none items-center justify-between px-4 text-sm text-zinc-400"><span className="flex items-center gap-2"><ListChecks className="h-4 w-4" />View choices and evidence bands</span><ChevronDown className="h-4 w-4" /></summary>
              <div className="max-h-[520px] space-y-2 overflow-y-auto border-t border-white/[0.07] p-3">
                {result.choices.map((choice) => (
                  <div key={`${choice.position}-${choice.collegeCode}-${choice.branchCode}`} className="flex items-start gap-3 rounded-xl bg-black/20 p-3">
                    <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-white/[0.05] font-mono text-xs text-zinc-500">{choice.position}</span>
                    <div className="min-w-0 flex-1"><p className="text-xs font-medium leading-5 text-zinc-200">{choice.collegeName}</p><p className="mt-0.5 text-[11px] text-zinc-600">{choice.collegeCode} · {choice.branchCode} · {choice.branchName}</p></div>
                    <span className="shrink-0 rounded-md border border-white/10 px-2 py-1 text-[9px] font-semibold uppercase text-zinc-400">{levelLabel(choice.level)}</span>
                  </div>
                ))}
              </div>
            </details>
          </section>

          <div className="flex flex-col gap-3 rounded-2xl border border-amber-400/15 bg-amber-500/[0.05] p-4 sm:flex-row sm:items-center sm:justify-between">
            <p className="flex items-start gap-2 text-xs leading-5 text-amber-100/70"><ShieldCheck className="mt-0.5 h-4 w-4 shrink-0 text-amber-300" />{result.disclaimer}</p>
            <button type="button" onClick={reset} className="motion-tap inline-flex min-h-11 shrink-0 items-center justify-center gap-2 rounded-xl border border-white/10 px-4 text-sm text-zinc-200"><RefreshCcw className="h-4 w-4" />Audit another list</button>
          </div>
        </div>
      )}

      <div className="mt-5 flex items-start gap-3 rounded-2xl border border-emerald-400/15 bg-emerald-500/[0.04] p-4 text-xs leading-5 text-zinc-500">
        <LockKeyhole className="mt-0.5 h-4 w-4 shrink-0 text-emerald-300" />
        The uploaded file is read only for this audit and is not saved. Never upload an application form containing your password, OTP, Aadhaar, certificates or payment details.
      </div>
    </div>
  );
}
