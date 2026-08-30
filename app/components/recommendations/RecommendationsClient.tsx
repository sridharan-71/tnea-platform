"use client";

import { useEffect, useMemo, useState } from "react";
import Link from "next/link";
import {
  ArrowLeft, ArrowUpRight, BarChart3, BedDouble, Compass,
  ExternalLink, MapPin, ShieldCheck, Sparkles, TrendingUp,
} from "lucide-react";

import type { StudentProfile } from "@/lib/types/student";
import type { BranchRecommendation, RecommendationLevel } from "@/lib/recommendations/types";
import { readStudentProfile } from "@/lib/account/studentState";
import { normalizeRecommendationRequest } from "@/lib/recommendations/normalizeRequest";
import {
  buildCollegeShortlist, groupCollegeRecommendations, orderByAdmissionBand,
} from "@/lib/recommendations/collegeRecommendations";

type VisibleLevel = Exclude<RecommendationLevel, "insufficient">;
type RecommendationFilter = "all" | VisibleLevel;
const LEVELS: VisibleLevel[] = ["reach", "target", "safe", "very_safe"];

const levelStyles: Record<RecommendationLevel, string> = {
  reach: "border-violet-400/25 bg-violet-500/10 text-violet-200",
  target: "border-amber-400/25 bg-amber-500/10 text-amber-200",
  safe: "border-emerald-400/25 bg-emerald-500/10 text-emerald-200",
  very_safe: "border-sky-400/25 bg-sky-500/10 text-sky-200",
  insufficient: "border-zinc-500/25 bg-zinc-500/10 text-zinc-300",
};

const levelCopy: Record<RecommendationLevel, { title: string; description: string }> = {
  reach: { title: "Reach", description: "Ambitious based on recent closing-rank history." },
  target: { title: "Target", description: "Your rank cleared the benchmark in one recent year." },
  safe: { title: "Safe", description: "Your rank cleared the benchmark in at least two recent years." },
  very_safe: { title: "Very Safe", description: "Cleared all three years plus an adaptive safety buffer." },
  insufficient: { title: "Insufficient evidence", description: "Not enough verified rank history to classify honestly." },
};

function titleCase(value: string) {
  return value.toLowerCase().replace(/\b\w/g, (letter) => letter.toUpperCase());
}

function websiteUrl(value: string) {
  return /^https?:\/\//i.test(value) ? value : `https://${value}`;
}

function numericRange(minimum: number | null, maximum: number | null, digits = 0) {
  if (minimum === null || maximum === null) return "Unavailable";
  const format = (value: number) => digits ? value.toFixed(digits) : Math.round(value).toLocaleString("en-IN");
  return minimum === maximum ? format(minimum) : `${format(minimum)}–${format(maximum)}`;
}

function rankGap(value: number | null) {
  if (value === null) return "Unavailable";
  return value >= 0
    ? `${Math.abs(value).toLocaleString("en-IN")} inside`
    : `${Math.abs(value).toLocaleString("en-IN")} outside`;
}

function Metric({ icon: Icon, label, value, helper }: {
  icon: typeof BarChart3; label: string; value: string; helper: string;
}) {
  return <div className="min-w-0 rounded-xl border border-white/[0.08] bg-black/25 p-3.5 sm:p-4">
    <div className="flex items-center gap-2 text-[11px] leading-4 text-zinc-500"><Icon className="h-3.5 w-3.5 shrink-0" />{label}</div>
    <p className="mt-2 break-words font-mono text-base font-semibold tabular-nums text-zinc-100">{value}</p>
    <p className="mt-1 text-[11px] leading-4 text-zinc-600">{helper}</p>
  </div>;
}

export default function RecommendationsClient() {
  const [items, setItems] = useState<BranchRecommendation[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [categoryUsed, setCategoryUsed] = useState("");
  const [filter, setFilter] = useState<RecommendationFilter>("all");
  const [profile, setProfile] = useState<StudentProfile | null>(null);
  const [exploreAll, setExploreAll] = useState(false);
  const [renderLimit, setRenderLimit] = useState(40);

  const colleges = useMemo(() => profile ? groupCollegeRecommendations(items, profile) : [], [items, profile]);
  const orderedColleges = useMemo(() => orderByAdmissionBand(colleges), [colleges]);
  const shortlist = useMemo(() => profile ? buildCollegeShortlist(colleges, profile) : null, [colleges, profile]);
  const activePool = useMemo(() => exploreAll ? orderedColleges : shortlist?.items ?? [], [exploreAll, orderedColleges, shortlist]);
  const filteredItems = useMemo(() => filter === "all" ? activePool : activePool.filter((item) => item.level === filter), [activePool, filter]);
  const visibleItems = filteredItems.slice(0, renderLimit);
  const counts = useMemo(() => Object.fromEntries(LEVELS.map((level) => [level, activePool.filter((item) => item.level === level).length])) as Record<VisibleLevel, number>, [activePool]);
  const outsideDistrict = useMemo(() => activePool.filter((item) => item.districtMatch === "statewide").slice(0, 6), [activePool]);
  const insufficient = activePool.filter((item) => item.level === "insufficient").length;

  useEffect(() => {
    const controller = new AbortController();

    async function loadRecommendations() {
      try {
        const stored = readStudentProfile();
        const { profile: normalized, error: profileError } =
          normalizeRecommendationRequest(stored);
        if (!normalized) {
          throw new Error(profileError ?? "Create your student profile first.");
        }

        setProfile(normalized);
        const response = await fetch("/api/recommendations", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(normalized),
          signal: controller.signal,
        });
        const payload = await response.json() as {
          error?: string;
          recommendations?: BranchRecommendation[];
          categoryUsed?: string;
        };
        if (!response.ok || !Array.isArray(payload.recommendations)) {
          throw new Error(payload.error ?? "Unable to generate recommendations.");
        }
        setItems(payload.recommendations);
        setCategoryUsed(payload.categoryUsed ?? normalized.community.toUpperCase());
      } catch (reason) {
        if (controller.signal.aborted) return;
        setError(reason instanceof Error ? reason.message : "Unable to generate recommendations.");
      } finally {
        if (!controller.signal.aborted) setLoading(false);
      }
    }
    void loadRecommendations();
    return () => controller.abort();
  }, []);

  return <div className="mx-auto w-full max-w-7xl overflow-x-hidden">
    <Link href="/analyze" className="inline-flex min-h-10 items-center gap-2 text-sm text-zinc-500 transition hover:text-white"><ArrowLeft className="h-4 w-4" /> Edit my details</Link>

    <header className="motion-scan mt-3 overflow-hidden rounded-3xl border border-white/10 bg-gradient-to-br from-indigo-500/[0.12] via-white/[0.035] to-transparent p-5 sm:mt-8 sm:p-8">
      <div className="inline-flex items-center gap-2 rounded-full border border-indigo-400/20 bg-indigo-500/10 px-3 py-1.5 text-xs text-indigo-200"><Sparkles className="h-3.5 w-3.5" /> Personalized for TNEA 2026</div>
      <h1 className="mt-4 text-3xl font-semibold tracking-[-0.035em] text-white sm:mt-5 sm:text-4xl">Your college list</h1>
      <p className="mt-2 max-w-3xl text-sm leading-6 text-zinc-400 sm:mt-3 sm:text-base sm:leading-7">Start ambitious, then move toward increasingly safer choices.</p>
      {!loading && !error && profile && <div className="mt-5 flex flex-wrap gap-2 text-xs">
        <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5 text-zinc-300">{profile.rank ? `General rank ${profile.rank.toLocaleString("en-IN")}` : `${profile.cutoff.toFixed(2)} cutoff fallback`}</span>
        <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5 text-zinc-300">{categoryUsed}</span>
        <span className="rounded-full border border-white/10 bg-black/20 px-3 py-1.5 text-zinc-300">{colleges.length} colleges evaluated</span>
      </div>}
      <p className="mt-4 text-[11px] leading-5 text-amber-200/70 sm:text-xs">Historical guidance, not an allotment guarantee.</p>
    </header>

    {!loading && !error && shortlist && <section className="mt-3 rounded-2xl border border-white/[0.08] bg-white/[0.025] p-3.5 sm:mt-5 sm:p-4">
      <div className="flex items-center justify-between gap-3">
        <div className="min-w-0">
          <h2 className="truncate text-sm font-medium text-white">{exploreAll ? `All ${colleges.length} evaluated colleges` : `${shortlist.targetSize} focused colleges`}</h2>
          <p className="mt-1 text-xs text-zinc-500">{shortlist.verySafeCount} met the strict Very Safe standard</p>
        </div>
        <button type="button" onClick={() => { setExploreAll((value) => !value); setFilter("all"); setRenderLimit(40); }} className="shrink-0 rounded-xl border border-white/10 bg-white/[0.05] px-3.5 py-2.5 text-xs font-medium text-zinc-200 transition hover:bg-white/[0.1]">
          {exploreAll ? "Return to focused list" : `Explore all ${colleges.length}`}
        </button>
      </div>
    </section>}

    {!loading && !error && profile && profile.locationFlexibility !== "anywhere" && outsideDistrict.length > 0 && <aside className="mt-4 rounded-2xl border border-cyan-400/20 bg-cyan-500/[0.055] p-4 sm:mt-6 sm:p-5">
      <div className="flex items-start gap-3"><Compass className="mt-0.5 h-5 w-5 shrink-0 text-cyan-300" /><div className="min-w-0">
        <h2 className="text-sm font-semibold text-cyan-100">Stronger opportunities exist outside your selected districts</h2>
        <p className="mt-1 text-xs leading-5 text-zinc-400">We kept them in the main list at their correct positions so location does not trap you in a weaker college.</p>
        <div className="mt-3 flex gap-2 overflow-x-auto pb-1">
          {outsideDistrict.map((college) => <a key={college.collegeCode} href={`#college-${college.collegeCode}`} className="shrink-0 rounded-lg border border-cyan-400/15 bg-black/20 px-3 py-2 text-xs text-cyan-100 transition hover:border-cyan-300/40">{college.collegeName.split(/[,(-]/)[0].trim()} · {titleCase(college.district)}</a>)}
        </div>
      </div></div>
    </aside>}

    <nav className="sticky top-[68px] z-20 -mx-1 mt-3 flex gap-2 overflow-x-auto rounded-2xl border border-white/10 bg-zinc-950/90 p-2 backdrop-blur-xl sm:top-20 sm:mt-6" aria-label="Recommendation categories">
      <button type="button" onClick={() => { setFilter("all"); setRenderLimit(40); }} aria-pressed={filter === "all"} className={`shrink-0 rounded-xl border px-4 py-2.5 text-sm font-medium ${filter === "all" ? "border-white bg-white text-black" : "border-white/10 text-zinc-400"}`}>All <span className="ml-1 opacity-60">{activePool.length}</span></button>
      {LEVELS.map((level) => <button type="button" key={level} onClick={() => { setFilter(level); setRenderLimit(40); }} aria-pressed={filter === level} className={`shrink-0 rounded-xl border px-4 py-2.5 text-sm font-medium capitalize transition ${levelStyles[level]} ${filter === level ? "ring-1 ring-white/60" : "opacity-70 hover:opacity-100"}`}>{level.replace("_", " ")} <span className="ml-1 opacity-60">{counts[level]}</span></button>)}
    </nav>

    {loading && <div className="motion-scan mt-6 rounded-2xl border border-white/10 p-10 text-center text-sm text-zinc-500 sm:mt-8 sm:p-12">Building your rank-first college list…</div>}
    {error && <div className="mt-6 rounded-2xl border border-rose-400/20 bg-rose-500/10 p-5 text-sm text-rose-200">{error} <Link href="/analyze" className="underline">Return to profile</Link></div>}
    {!loading && !error && visibleItems.length === 0 && <div className="mt-6 rounded-2xl border border-white/10 p-8 text-center text-sm text-zinc-500">No colleges are available in this view.</div>}

    <div className="mt-6 space-y-4 sm:mt-8">
      {visibleItems.map((item) => {
        const position = activePool.findIndex((college) => college.collegeCode === item.collegeCode) + 1;
        const evidenceYears = profile?.rank ? item.rankYearsAvailable : item.cutoffYearsAvailable;
        return <article id={`college-${item.collegeCode}`} key={item.collegeCode} className="motion-pop scroll-mt-40 overflow-hidden rounded-2xl border border-white/10 bg-gradient-to-r from-white/[0.05] to-white/[0.018] transition hover:-translate-y-0.5 hover:border-white/20" style={{ animationDelay: `${Math.min(position - 1, 8) * 45}ms` }}>
          <div className="p-4 sm:p-6">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
              <div className="flex min-w-0 gap-3 sm:gap-4">
                <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl border border-white/10 bg-black/30 font-mono text-sm text-zinc-400 sm:h-11 sm:w-11">{position}</span>
                <div className="min-w-0">
                  <div className="flex flex-wrap items-center gap-2 text-[11px] text-zinc-500 sm:text-xs"><span className="text-indigo-300">Code {item.collegeCode}</span><span>•</span><span>{item.collegeType}</span></div>
                  <h2 className="mt-2 text-lg font-semibold leading-6 text-white sm:text-xl sm:leading-7">{item.collegeName}</h2>
                  <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-zinc-500"><span className="inline-flex items-center gap-1.5"><MapPin className="h-3.5 w-3.5" />{titleCase(item.district)}</span>{item.districtMatch === "statewide" && <span className="rounded-full border border-cyan-400/20 bg-cyan-500/[0.07] px-2 py-0.5 text-cyan-200">Outside preferred districts</span>}</div>
                </div>
              </div>
              <div className="flex flex-wrap items-center gap-2 pl-[52px] sm:shrink-0 sm:justify-end sm:pl-0">
                <span className={`rounded-lg border px-2.5 py-1.5 text-[11px] font-semibold uppercase ${levelStyles[item.level]}`}>{levelCopy[item.level].title}</span>
              </div>
            </div>

            <div className="mt-4 rounded-xl border border-white/[0.07] bg-black/20 p-3.5 sm:mt-5 sm:p-4">
              <div className="flex items-start gap-2.5"><ShieldCheck className="mt-0.5 h-4 w-4 shrink-0 text-indigo-300" /><div><p className="text-sm font-medium leading-5 text-zinc-200">{levelCopy[item.level].description}</p><p className="mt-1 hidden text-xs leading-5 text-zinc-500 sm:block">{item.explanation}</p></div></div>
            </div>

            <div className="mt-3 grid grid-cols-2 gap-2 lg:grid-cols-3">
              <Metric icon={BarChart3} label={profile?.rank ? "Historical closing rank" : `Historical ${categoryUsed} cutoff`} value={profile?.rank ? numericRange(item.closingRankMinimum, item.closingRankMaximum) : numericRange(item.cutoffMinimum, item.cutoffMaximum, 2)} helper="Best fitting selected branch" />
              <Metric icon={TrendingUp} label="Rank gap" value={profile?.rank ? rankGap(item.rankDifference) : "Rank unavailable"} helper="Compared with the three-year average" />
              <div className="col-span-2 hidden lg:block"><Metric icon={ShieldCheck} label="Evidence" value={`${evidenceYears}/3 years`} helper={`${item.confidence} confidence`} /></div>
            </div>

            {profile && (profile.livingArrangement === "hostel_required" || profile.livingArrangement === "hostel_preferred") && <div className={`mt-3 flex items-center gap-2 rounded-xl border px-3.5 py-3 text-xs ${item.hostelAvailable === true ? "border-emerald-400/20 bg-emerald-500/[0.07] text-emerald-200" : "border-amber-400/20 bg-amber-500/[0.06] text-amber-200"}`}><BedDouble className="h-4 w-4 shrink-0" />{item.hostelAvailable === true ? "Verified hostel availability matches your preference." : "Hostel availability needs verification."}</div>}

            <div className="mt-4 flex flex-col gap-3 border-t border-white/[0.07] pt-4 sm:flex-row sm:items-center sm:justify-between">
              <p className="text-[11px] leading-5 text-amber-300/70 sm:text-xs">Historical evidence only—not guaranteed admission.</p>
              <div className="grid w-full grid-cols-1 gap-2 min-[430px]:grid-cols-2 sm:flex sm:w-auto">
                <Link href={`/college/${item.collegeCode}`} className="inline-flex min-h-11 items-center justify-center gap-2 rounded-lg bg-white px-3.5 py-2.5 text-sm font-medium text-black">View college <ArrowUpRight className="h-4 w-4" /></Link>
                {item.website && <a href={websiteUrl(item.website)} target="_blank" rel="noreferrer" className="inline-flex min-h-11 items-center justify-center gap-2 rounded-lg border border-white/10 px-3.5 py-2.5 text-sm text-zinc-300">Official site <ExternalLink className="h-3.5 w-3.5" /></a>}
              </div>
            </div>
          </div>
        </article>;
      })}
    </div>

    {!loading && !error && insufficient > 0 && filter === "all" && <p className="mt-5 text-center text-xs text-zinc-600">{insufficient} college{insufficient === 1 ? "" : "s"} appear at the end without a band because rank evidence was insufficient.</p>}
    {!loading && !error && visibleItems.length < filteredItems.length && <div className="mt-6 rounded-2xl border border-white/10 bg-white/[0.025] p-5 text-center"><p className="text-sm text-zinc-400">Showing {visibleItems.length} of {filteredItems.length} colleges.</p><button type="button" onClick={() => setRenderLimit((value) => value + 100)} className="mt-3 min-h-11 rounded-xl bg-white px-4 py-2.5 text-sm font-semibold text-black">Show more</button></div>}
  </div>;
}
