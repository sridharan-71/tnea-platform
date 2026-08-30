"use client";

import { FormEvent, useEffect, useRef, useState } from "react";
import Link from "next/link";
import {
  AlertTriangle, ArrowRight, Bot, BrainCircuit, CheckCircle2, ChevronDown,
  CircleUserRound, ExternalLink, FileSearch, LoaderCircle, LockKeyhole,
  MessageSquareText, RefreshCcw, Send, ShieldCheck, Sparkles,
} from "lucide-react";

import {
  PROCESS_STAGES,
} from "@/lib/counselling/tnea2026";
import {
  readCounsellingProgress,
  readStudentProfile,
  STUDENT_STATE_CHANGE_EVENT,
} from "@/lib/account/studentState";
import type {
  CounsellingTrackerSnapshot,
  CounsellorHistoryItem,
  CounsellorResponse,
} from "@/lib/counsellor/types";
import type { StudentProfile } from "@/lib/types/student";

const MAX_HISTORY = 8;

const SUGGESTIONS = [
  "What should I do today?",
  "Is my college list safety-complete?",
  "Explain Accept & Upward in simple words",
  "What are my exact round dates?",
  "Do I have enough Very Safe colleges?",
  "Should I consider colleges outside my districts?",
];

interface ConversationItem {
  id: number;
  role: "user" | "assistant";
  content: string;
  result?: CounsellorResponse;
}

function readTracker(): CounsellingTrackerSnapshot | null {
  const progress = readCounsellingProgress();
  return progress ? {
    stageId: progress.stage,
    pathway: progress.pathway,
    round: progress.round,
  } : null;
}

function firstName(profile: StudentProfile | null) {
  return profile?.name.trim().split(/\s+/)[0] || "there";
}

function AssistantResult({ result }: { result: CounsellorResponse }) {
  return (
    <div>
      <div className="flex flex-wrap items-center gap-2">
        <span className={`inline-flex items-center gap-1.5 rounded-full border px-2.5 py-1 text-[11px] font-medium ${
          result.mode === "model"
            ? "border-violet-400/25 bg-violet-500/10 text-violet-200"
            : "border-emerald-400/20 bg-emerald-500/[0.08] text-emerald-200"
        }`}>
          {result.mode === "model" ? <BrainCircuit className="h-3 w-3" /> : <ShieldCheck className="h-3 w-3" />}
          {result.mode === "model" ? "AI + verified evidence" : "Verified reasoning mode"}
        </span>
        {result.profileUsed && <span className="rounded-full border border-white/10 px-2.5 py-1 text-[11px] text-zinc-500">Profile used</span>}
        {result.trackerUsed && <span className="rounded-full border border-white/10 px-2.5 py-1 text-[11px] text-zinc-500">Tracker used</span>}
      </div>

      <p className="mt-4 whitespace-pre-wrap text-sm leading-7 text-zinc-100 sm:text-[15px]">{result.answer}</p>

      {result.nextSteps.length > 0 && <div className="mt-5 rounded-2xl border border-indigo-400/15 bg-indigo-500/[0.06] p-4">
        <p className="text-xs font-semibold uppercase tracking-[0.16em] text-indigo-300">Do this next</p>
        <ol className="mt-3 space-y-2.5">
          {result.nextSteps.map((step, index) => <li key={step} className="flex gap-3 text-sm leading-6 text-zinc-300">
            <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-lg bg-indigo-400/10 font-mono text-[11px] text-indigo-200">{index + 1}</span>
            {step}
          </li>)}
        </ol>
      </div>}

      <div className="mt-4 flex items-start gap-2.5 rounded-xl border border-amber-400/15 bg-amber-500/[0.055] px-3.5 py-3 text-xs leading-5 text-amber-100/80">
        <AlertTriangle className="mt-0.5 h-4 w-4 shrink-0 text-amber-300" />{result.caution}
      </div>

      {(result.reasoning.length > 0 || result.evidence.length > 0) && <details className="group mt-4 rounded-xl border border-white/[0.08] bg-black/20">
        <summary className="flex min-h-12 cursor-pointer list-none items-center justify-between gap-3 px-4 py-3 text-xs font-medium text-zinc-300">
          Why this answer
          <ChevronDown className="h-4 w-4 text-zinc-600 transition group-open:rotate-180" />
        </summary>
        <div className="border-t border-white/[0.07] px-4 py-4">
          <ul className="space-y-2">
            {result.reasoning.map((reason) => <li key={reason} className="flex gap-2 text-xs leading-5 text-zinc-400"><CheckCircle2 className="mt-0.5 h-3.5 w-3.5 shrink-0 text-emerald-400/70" />{reason}</li>)}
          </ul>
          {result.evidence.length > 0 && <div className="mt-4 border-t border-white/[0.07] pt-4">
            <p className="text-[11px] font-semibold uppercase tracking-[0.16em] text-zinc-600">Evidence</p>
            <div className="mt-2 space-y-2">
              {result.evidence.map((item) => <div key={`${item.label}-${item.detail}`} className="text-xs leading-5 text-zinc-500">
                {item.url ? <a href={item.url} target="_blank" rel="noreferrer" className="inline-flex items-center gap-1 font-medium text-cyan-300/80 hover:text-cyan-200">{item.label}<ExternalLink className="h-3 w-3" /></a> : <span className="font-medium text-zinc-300">{item.label}</span>}
                <span className="block">{item.detail}</span>
              </div>)}
            </div>
          </div>}
        </div>
      </details>}

      {result.actions.length > 0 && <div className="mt-4 flex flex-wrap gap-2">
        {result.actions.map((action) => <Link key={action.href} href={action.href} className="inline-flex min-h-11 items-center justify-center gap-2 rounded-xl border border-white/10 bg-white/[0.04] px-3.5 py-2.5 text-xs font-medium text-zinc-200 transition hover:border-white/20 hover:bg-white/[0.07]">
          {action.label}<ArrowRight className="h-3.5 w-3.5" />
        </Link>)}
      </div>}
    </div>
  );
}

export default function AICounsellor() {
  const [profile, setProfile] = useState<StudentProfile | null>(null);
  const [tracker, setTracker] = useState<CounsellingTrackerSnapshot | null>(null);
  const [ready, setReady] = useState(false);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [messages, setMessages] = useState<ConversationItem[]>([]);
  const messageId = useRef(1);
  const transcriptEnd = useRef<HTMLDivElement>(null);
  const activeRequest = useRef<AbortController | null>(null);

  useEffect(() => {
    const load = () => {
      setProfile(readStudentProfile());
      setTracker(readTracker());
      setReady(true);
    };
    load();
    window.addEventListener(STUDENT_STATE_CHANGE_EVENT, load);
    window.addEventListener("storage", load);
    return () => {
      activeRequest.current?.abort();
      window.removeEventListener(STUDENT_STATE_CHANGE_EVENT, load);
      window.removeEventListener("storage", load);
    };
  }, []);

  useEffect(() => {
    if (messages.length) transcriptEnd.current?.scrollIntoView({ behavior: "smooth", block: "end" });
  }, [messages]);

  async function ask(question: string) {
    const cleaned = question.trim();
    if (!cleaned || loading) return;
    setError("");
    setInput("");
    const userItem: ConversationItem = { id: messageId.current++, role: "user", content: cleaned };
    setMessages((items) => [...items, userItem]);
    setLoading(true);
    const history: CounsellorHistoryItem[] = messages.slice(-MAX_HISTORY).map((item) => ({
      role: item.role,
      content: item.content,
    }));
    const controller = new AbortController();
    activeRequest.current = controller;
    try {
      const anonymousProfile = profile ? { ...profile, name: "" } : null;
      const response = await fetch("/api/counsellor", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: cleaned, profile: anonymousProfile, tracker, history, tone: "direct" }),
        signal: controller.signal,
      });
      const payload = await response.json() as Partial<CounsellorResponse> & { error?: string };
      if (!response.ok) throw new Error(payload.error ?? "The counsellor could not answer.");
      if (typeof payload.answer !== "string"
        || !Array.isArray(payload.nextSteps)
        || !Array.isArray(payload.reasoning)
        || !Array.isArray(payload.evidence)
        || !Array.isArray(payload.actions)) {
        throw new Error("The counsellor returned an incomplete answer. Please try again.");
      }
      const result = payload as CounsellorResponse;
      setMessages((items) => [...items, {
        id: messageId.current++,
        role: "assistant",
        content: result.answer,
        result,
      }]);
    } catch (reason) {
      if (controller.signal.aborted) return;
      setError(reason instanceof Error ? reason.message : "The counsellor could not answer.");
    } finally {
      if (activeRequest.current === controller) {
        activeRequest.current = null;
        setLoading(false);
      }
    }
  }

  function submit(event: FormEvent) {
    event.preventDefault();
    void ask(input);
  }

  function resetConversation() {
    setMessages([]);
    setError("");
    setInput("");
  }

  const stage = tracker ? PROCESS_STAGES.find((item) => item.id === tracker.stageId) : null;

  if (!ready) return <div className="h-[720px] animate-pulse rounded-3xl border border-white/10 bg-white/[0.025]" />;

  return (
    <div className="mx-auto w-full max-w-7xl">
      <header className="motion-scan relative overflow-hidden rounded-3xl border border-white/10 bg-[radial-gradient(circle_at_12%_10%,rgba(139,92,246,0.2),transparent_30%),radial-gradient(circle_at_85%_20%,rgba(34,211,238,0.12),transparent_26%),rgba(9,9,11,0.97)] p-5 sm:p-8 lg:p-10">
        <div className="motion-grid-drift absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.025)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.025)_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="motion-ambient-float absolute -right-16 -top-16 h-48 w-48 rounded-full bg-violet-500/15 blur-3xl" />
        <div className="relative flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
          <div>
            <span className="inline-flex items-center gap-2 rounded-full border border-violet-300/20 bg-violet-400/10 px-3 py-1.5 text-xs font-medium text-violet-100"><BrainCircuit className="h-3.5 w-3.5" /> TNEA decision copilot</span>
            <h1 className="mt-5 max-w-3xl text-3xl font-bold tracking-tight text-white sm:text-5xl">Ask the decision—not just the question.</h1>
            <p className="mt-4 max-w-2xl text-sm leading-6 text-zinc-400 sm:text-base sm:leading-7">Personal answers from your saved admission profile, CampusAI’s rank evidence and the official 2026 counselling rules. Facts are shown separately from advice.</p>
          </div>
          <div className="grid gap-2 text-xs sm:grid-cols-3 lg:min-w-[500px]">
            <div className={`rounded-xl border p-3 ${profile ? "border-emerald-400/20 bg-emerald-400/[0.06]" : "border-amber-400/20 bg-amber-500/[0.06]"}`}>
              <CircleUserRound className={`h-4 w-4 ${profile ? "text-emerald-300" : "text-amber-300"}`} />
              <p className="mt-2 font-medium text-zinc-200">{profile ? `${firstName(profile)}’s profile linked` : "Profile not found"}</p>
            </div>
            <div className={`rounded-xl border p-3 ${tracker ? "border-cyan-400/20 bg-cyan-400/[0.06]" : "border-white/10 bg-white/[0.025]"}`}>
              <FileSearch className={`h-4 w-4 ${tracker ? "text-cyan-300" : "text-zinc-600"}`} />
              <p className="mt-2 font-medium text-zinc-200">{stage ? stage.shortLabel : "Stage not set"}</p>
            </div>
            <div className="rounded-xl border border-indigo-400/20 bg-indigo-400/[0.06] p-3">
              <ShieldCheck className="h-4 w-4 text-indigo-300" />
              <p className="mt-2 font-medium text-zinc-200">Official rules grounded</p>
            </div>
          </div>
        </div>
      </header>

      <section className="mt-5 grid gap-5 lg:grid-cols-[minmax(0,1fr)_300px]">
        <div className="flex min-h-[680px] flex-col overflow-hidden rounded-3xl border border-white/10 bg-zinc-900/35">
          <div className="flex items-center justify-between gap-4 border-b border-white/[0.08] px-4 py-4 sm:px-6">
            <div className="flex items-center gap-3">
              <div className="motion-ai-orb flex h-10 w-10 items-center justify-center rounded-xl bg-violet-500/15 text-violet-200"><Bot className="h-5 w-5" /></div>
              <div><p className="text-sm font-semibold text-white">CampusAI Counsellor</p><p className="text-xs text-zinc-600">No portal access · no guarantees</p></div>
            </div>
            {messages.length > 0 && <button type="button" onClick={resetConversation} className="inline-flex min-h-11 items-center gap-2 rounded-xl border border-white/10 px-3 text-xs text-zinc-400 transition hover:text-white"><RefreshCcw className="h-3.5 w-3.5" /> New chat</button>}
          </div>

          <div className="flex-1 space-y-5 overflow-y-auto p-4 sm:p-6" aria-live="polite">
            {messages.length === 0 && <div className="mx-auto flex min-h-[360px] max-w-2xl flex-col items-center justify-center text-center">
              <div className="motion-ai-orb flex h-14 w-14 items-center justify-center rounded-2xl border border-violet-400/20 bg-violet-500/10"><Sparkles className="h-6 w-6 text-violet-200" /></div>
              <h2 className="mt-5 text-xl font-semibold text-white">What decision are you facing, {firstName(profile)}?</h2>
              <p className="mt-2 max-w-lg text-sm leading-6 text-zinc-500">{profile ? "Your admission profile is ready. Ask about a college band, list safety, district trade-off, deadline or allotment option." : "I can explain official procedure now. Create your admission profile for personalized college guidance."}</p>
              <div className="mt-6 grid w-full gap-2 sm:grid-cols-2">
                {SUGGESTIONS.slice(0, 4).map((suggestion) => <button key={suggestion} type="button" onClick={() => void ask(suggestion)} className="motion-tap min-h-12 rounded-xl border border-white/10 bg-white/[0.025] px-4 py-3 text-left text-xs leading-5 text-zinc-300 hover:-translate-y-0.5 hover:border-violet-400/25 hover:bg-violet-500/[0.06]">{suggestion}</button>)}
              </div>
            </div>}

            {messages.map((item) => <article key={item.id} className={`motion-pop ${item.role === "user" ? "ml-auto max-w-[88%] sm:max-w-[75%]" : "mr-auto max-w-[96%] sm:max-w-[88%]"}`}>
              {item.role === "user"
                ? <div className="rounded-2xl rounded-br-md bg-white px-4 py-3 text-sm leading-6 text-black">{item.content}</div>
                : <div className="rounded-2xl rounded-bl-md border border-white/10 bg-black/25 p-4 sm:p-5">{item.result ? <AssistantResult result={item.result} /> : item.content}</div>}
            </article>)}

            {loading && <div className="mr-auto flex max-w-[88%] items-center gap-3 rounded-2xl rounded-bl-md border border-white/10 bg-black/25 px-4 py-4 text-sm text-zinc-400">
              <LoaderCircle className="h-4 w-4 animate-spin text-violet-300" /> Checking your evidence and official rules…
            </div>}
            {error && <div className="rounded-xl border border-rose-400/20 bg-rose-500/[0.08] px-4 py-3 text-sm text-rose-200">{error}</div>}
            <div ref={transcriptEnd} />
          </div>

          <div className="border-t border-white/[0.08] bg-zinc-950/60 p-3 sm:p-4">
            <form onSubmit={submit} className="flex items-end gap-2 rounded-2xl border border-white/10 bg-black/30 p-2 focus-within:border-violet-400/40 focus-within:ring-4 focus-within:ring-violet-500/[0.06]">
              <textarea
                value={input}
                onChange={(event) => setInput(event.target.value.slice(0, 800))}
                onKeyDown={(event) => {
                  if (event.key === "Enter" && !event.shiftKey) {
                    event.preventDefault();
                    if (input.trim()) void ask(input);
                  }
                }}
                rows={1}
                placeholder="Ask about your colleges, round, deadline or allotment decision…"
                aria-label="Question for AI Counsellor"
                className="max-h-32 min-h-11 flex-1 resize-none bg-transparent px-3 py-3 text-sm leading-5 text-white outline-none placeholder:text-zinc-700"
              />
              <button type="submit" disabled={!input.trim() || loading} aria-label="Send question" className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-white text-black transition hover:bg-zinc-200 disabled:cursor-not-allowed disabled:opacity-30"><Send className="h-4 w-4" /></button>
            </form>
            <div className="mt-2 flex items-center justify-between gap-3 px-1 text-[10px] text-zinc-700"><span>Enter to send · Shift+Enter for a new line</span><span>{input.length}/800</span></div>
          </div>
        </div>

        <aside className="space-y-4">
          <div className="rounded-3xl border border-white/10 bg-zinc-900/35 p-5">
            <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.16em] text-zinc-500"><MessageSquareText className="h-4 w-4" /> Useful questions</div>
            <div className="mt-4 space-y-2">
              {SUGGESTIONS.map((suggestion) => <button key={suggestion} type="button" onClick={() => void ask(suggestion)} disabled={loading} className="min-h-11 w-full rounded-xl border border-white/[0.08] px-3 py-2.5 text-left text-xs leading-5 text-zinc-400 transition hover:border-white/20 hover:text-white disabled:opacity-40">{suggestion}</button>)}
            </div>
          </div>

          <div className="rounded-3xl border border-emerald-400/15 bg-emerald-500/[0.045] p-5">
            <div className="flex items-center gap-2 text-xs font-semibold text-emerald-200"><LockKeyhole className="h-4 w-4" /> Privacy boundary</div>
            <p className="mt-3 text-xs leading-5 text-zinc-500">Your name is removed before questions reach the server. Never enter your TNEA password, OTP, application number, Aadhaar, certificates or payment details.</p>
          </div>

          {!profile && <Link href="/analyze" className="inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl bg-white px-4 py-3 text-sm font-semibold text-black">Create profile <ArrowRight className="h-4 w-4" /></Link>}
          {!tracker && <Link href="/counselling" className="inline-flex min-h-12 w-full items-center justify-center gap-2 rounded-xl border border-white/10 px-4 py-3 text-sm font-medium text-zinc-200">Set counselling stage <ArrowRight className="h-4 w-4" /></Link>}
        </aside>
      </section>
    </div>
  );
}
