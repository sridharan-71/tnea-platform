"use client";

import { useEffect, useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import {
  ArrowRight,
  BedDouble,
  Check,
  ChevronLeft,
  CircleUserRound,
  GraduationCap,
  Info,
  MapPin,
  RotateCcw,
  Search,
  ShieldCheck,
  SlidersHorizontal,
  Sparkles,
} from "lucide-react";

import DistrictSelector from "./DistrictSelector";
import {
  COMMUNITY_OPTIONS,
  DEFAULT_STUDENT_PROFILE,
  EXCLUSION_OPTIONS,
  type BranchPreference,
  type CollegeExclusion,
  type CommunityKey,
  type LivingArrangement,
  type LocationFlexibility,
  type RankStatus,
  type StudentProfile,
} from "@/lib/types/student";
import {
  notifyStudentStateChanged,
  STUDENT_PROFILE_DRAFT_KEY as DRAFT_KEY,
  STUDENT_PROFILE_KEY as STORAGE_KEY,
} from "@/lib/account/studentState";
import { normalizeStoredStudentProfile } from "@/lib/student/normalizeProfile";
import { useAuth } from "@/components/auth/AuthProvider";

type StepId = "rank" | "cutoff" | "community" | "branches" | "location" | "living" | "filters" | "review";

interface Props { branchOptions: BranchPreference[] }

const FALLBACK_BRANCHES: BranchPreference[] = [
  { code: "CS", name: "Computer Science and Engineering" },
  { code: "IT", name: "Information Technology" },
  { code: "AD", name: "Artificial Intelligence and Data Science" },
  { code: "EC", name: "Electronics and Communication Engineering" },
  { code: "EE", name: "Electrical and Electronics Engineering" },
  { code: "ME", name: "Mechanical Engineering" },
  { code: "CE", name: "Civil Engineering" },
];

const RANK_OPTIONS: Array<{ value: RankStatus; title: string; description: string }> = [
  { value: "known", title: "Yes, I know my general rank", description: "This gives you the strongest recommendation." },
  { value: "not_published", title: "My rank is not published yet", description: "We’ll use your cutoff for now." },
  { value: "unknown", title: "I’m not sure", description: "You can add it later." },
];

const LOCATION_OPTIONS: Array<{ value: LocationFlexibility; title: string; description: string }> = [
  { value: "selected_only", title: "Only my districts", description: "Do not show colleges elsewhere." },
  { value: "statewide_alternatives", title: "My districts first", description: "Also show better options elsewhere." },
  { value: "anywhere", title: "Anywhere in Tamil Nadu", description: "Show the strongest options statewide." },
];

const LIVING_OPTIONS: Array<{ value: LivingArrangement; title: string; description: string }> = [
  { value: "day_scholar", title: "Day scholar only", description: "I’ll travel from home daily." },
  { value: "hostel_required", title: "I need a hostel", description: "Remove verified no-hostel colleges." },
  { value: "hostel_preferred", title: "I prefer a hostel", description: "Keep other options visible." },
  { value: "either", title: "Either works", description: "Do not restrict my list." },
];

function OptionCard({ selected, title, description, onClick, compact = false }: {
  selected: boolean;
  title: string;
  description?: string;
  onClick: () => void;
  compact?: boolean;
}) {
  return (
    <button type="button" onClick={onClick} aria-pressed={selected}
      className={`motion-tap group flex w-full items-start gap-3 rounded-2xl border text-left focus-visible:ring-2 focus-visible:ring-indigo-400/70 ${compact ? "p-3.5" : "p-4 sm:p-5"} ${selected ? "border-indigo-400/60 bg-indigo-500/[0.12] shadow-[0_0_0_1px_rgba(129,140,248,0.12),0_18px_50px_rgba(49,46,129,0.18)]" : "border-white/10 bg-white/[0.025] hover:-translate-y-0.5 hover:border-white/20 hover:bg-white/[0.045]"}`}>
      <span className={`mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full border transition ${selected ? "border-indigo-300 bg-indigo-400 text-zinc-950" : "border-white/20 bg-black/20 group-hover:border-white/35"}`}>
        {selected && <Check className="h-3.5 w-3.5" strokeWidth={3} />}
      </span>
      <span>
        <span className="block text-sm font-semibold text-white sm:text-[15px]">{title}</span>
        {description && <span className="mt-1 block text-xs leading-5 text-zinc-500 sm:text-sm">{description}</span>}
      </span>
    </button>
  );
}

function StepHeading({ eyebrow, title, description }: { eyebrow: string; title: string; description: string }) {
  return <div>
    <p className="text-xs font-semibold uppercase tracking-[0.22em] text-indigo-300">{eyebrow}</p>
    <h2 className="mt-3 text-2xl font-semibold tracking-tight text-white sm:text-3xl">{title}</h2>
    <p className="mt-3 max-w-2xl text-sm leading-6 text-zinc-400 sm:text-base">{description}</p>
  </div>;
}

export default function StudentProfileForm({ branchOptions }: Props) {
  const router = useRouter();
  const { user } = useAuth();
  const branches = branchOptions.length ? branchOptions : FALLBACK_BRANCHES;
  const [profile, setProfile] = useState<StudentProfile>(DEFAULT_STUDENT_PROFILE);
  const [stepId, setStepId] = useState<StepId>("rank");
  const [ready, setReady] = useState(false);
  const [error, setError] = useState("");
  const [branchQuery, setBranchQuery] = useState("");
  const steps = useMemo<StepId[]>(() => [
    "rank", "cutoff", "community", "branches",
    "location", "living", "filters", "review",
  ], []);
  const stepIndex = Math.max(0, steps.indexOf(stepId));
  const progress = ((stepIndex + 1) / steps.length) * 100;

  useEffect(() => {
    const timer = window.setTimeout(() => {
      const stored = window.localStorage.getItem(DRAFT_KEY) ?? window.localStorage.getItem(STORAGE_KEY);
      if (stored) {
        try {
          setProfile(normalizeStoredStudentProfile(JSON.parse(stored)) ?? DEFAULT_STUDENT_PROFILE);
        } catch {
          setProfile(DEFAULT_STUDENT_PROFILE);
        }
      }
      setReady(true);
    }, 0);
    return () => window.clearTimeout(timer);
  }, []);

  useEffect(() => {
    if (!ready) return;
    window.localStorage.setItem(DRAFT_KEY, JSON.stringify(profile));
  }, [profile, ready]);

  function update<K extends keyof StudentProfile>(key: K, value: StudentProfile[K]) {
    setProfile((current) => ({ ...current, [key]: value }));
    setError("");
  }

  function validateStep(id: StepId) {
    if (id === "cutoff" && (!Number.isFinite(profile.cutoff) || profile.cutoff <= 0 || profile.cutoff > 200)) return "Enter an exact cutoff between 0 and 200.";
    if (id === "community" && !profile.community) return "Select the community category used in your TNEA application.";
    if (id === "rank" && profile.rankStatus === "known" && (!profile.rank || !Number.isInteger(profile.rank) || profile.rank <= 0)) return "Enter a valid overall TNEA rank.";
    if (id === "branches" && !profile.preferredBranches.length) return "Select at least one branch you would genuinely accept.";
    if (id === "location" && profile.locationFlexibility !== "anywhere" && !profile.preferredDistricts.length) return "Select at least one district, or choose anywhere in Tamil Nadu.";
    return "";
  }

  function next() {
    const nextError = validateStep(stepId);
    if (nextError) { setError(nextError); return; }
    const currentIndex = steps.indexOf(stepId);
    setStepId(steps[Math.min(currentIndex + 1, steps.length - 1)]);
    setError("");
    window.scrollTo({ top: 0, behavior: "smooth" });
  }

  function previous() {
    const currentIndex = steps.indexOf(stepId);
    setStepId(steps[Math.max(0, currentIndex - 1)]);
    setError("");
    window.scrollTo({ top: 0, behavior: "smooth" });
  }

  function toggleBranch(code: string) {
    const selected = profile.preferredBranches.includes(code);
    update("preferredBranches", selected
      ? profile.preferredBranches.filter((item) => item !== code)
      : [...profile.preferredBranches, code]);
  }

  function selectRankStatus(status: RankStatus) {
    setProfile((current) => ({ ...current, rankStatus: status, rank: status === "known" ? current.rank : null }));
    setError("");
  }

  function selectLocation(value: LocationFlexibility) {
    setProfile((current) => ({
      ...current,
      locationFlexibility: value,
      preferredDistricts: value === "anywhere"
        ? ["Anywhere in Tamil Nadu"]
        : current.preferredDistricts.filter((district) => district !== "Anywhere in Tamil Nadu"),
    }));
    setError("");
  }

  function selectLiving(value: LivingArrangement) {
    setProfile((current) => ({
      ...current,
      livingArrangement: value,
      excludedCollegeTraits: value === "hostel_required"
        ? [...new Set([...current.excludedCollegeTraits, "no_hostel" as CollegeExclusion])]
        : current.excludedCollegeTraits.filter((item) => item !== "no_hostel"),
    }));
    setError("");
  }

  function toggleExclusion(value: CollegeExclusion) {
    update("excludedCollegeTraits", profile.excludedCollegeTraits.includes(value)
      ? profile.excludedCollegeTraits.filter((item) => item !== value)
      : [...profile.excludedCollegeTraits, value]);
  }

  function submit() {
    for (const id of steps) {
      const nextError = validateStep(id);
      if (nextError) { setStepId(id); setError(nextError); return; }
    }
    const cleaned: StudentProfile = {
      ...profile,
      name: profile.name.trim(),
      cutoff: Number(profile.cutoff.toFixed(2)),
      rank: profile.rankStatus === "known" ? profile.rank : null,
      recommendationMode: "balanced",
    };
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(cleaned));
    window.localStorage.removeItem(DRAFT_KEY);
    notifyStudentStateChanged("profile");
    router.push("/recommendations");
  }

  const filteredBranches = useMemo(() => {
    const query = branchQuery.trim().toLowerCase();
    if (!query) return branches;
    return branches.filter((branch) => `${branch.code} ${branch.name}`.toLowerCase().includes(query));
  }, [branchQuery, branches]);

  const sidebarSections: Array<{ label: string; icon: typeof CircleUserRound; ids: StepId[] }> = [
    { label: "Admission profile", icon: CircleUserRound, ids: ["rank", "cutoff", "community"] },
    { label: "Academic interests", icon: GraduationCap, ids: ["branches"] },
    { label: "Real-life fit", icon: MapPin, ids: ["location", "living"] },
    { label: "Final review", icon: ShieldCheck, ids: ["filters", "review"] },
  ];

  if (!ready) return <div className="h-[620px] animate-pulse rounded-[28px] border border-white/10 bg-white/[0.025]" />;

  return (
    <div className="grid gap-6 lg:grid-cols-[250px_minmax(0,1fr)]">
      <aside className="hidden h-fit rounded-3xl border border-white/10 bg-white/[0.025] p-5 lg:sticky lg:top-24 lg:block">
        <div className="flex items-center gap-3">
          <div className="rounded-xl border border-indigo-400/20 bg-indigo-500/10 p-2.5"><Sparkles className="h-4 w-4 text-indigo-300" /></div>
          <div><p className="text-sm font-semibold text-white">Personal counsellor</p><p className="text-xs text-zinc-500">About 3 minutes</p></div>
        </div>
        <div className="mt-6 space-y-1">
          {sidebarSections.map(({ label, icon: Icon, ids }) => {
            const active = ids.includes(stepId);
            const sectionSteps = ids;
            const completed = sectionSteps.every((id) => !steps.includes(id) || steps.indexOf(id) < stepIndex);
            return <div key={label} className={`flex items-center gap-3 rounded-xl px-3 py-3 text-sm transition ${active ? "bg-white/[0.06] text-white" : "text-zinc-500"}`}>
              <span className={`flex h-7 w-7 items-center justify-center rounded-lg ${active ? "bg-indigo-500/15 text-indigo-300" : completed ? "text-emerald-400" : "text-zinc-600"}`}>
                {completed ? <Check className="h-4 w-4" /> : <Icon className="h-4 w-4" />}
              </span>{label}
            </div>;
          })}
        </div>
        <div className="mt-6 rounded-2xl border border-emerald-400/15 bg-emerald-500/[0.06] p-4">
          <p className="flex items-center gap-2 text-xs font-medium text-emerald-300"><ShieldCheck className="h-3.5 w-3.5" /> Private by default</p>
          <p className="mt-2 text-xs leading-5 text-zinc-500">{user ? "Your completed profile syncs privately to your CampusAI account." : "Your answers stay on this device. Create an account anytime to sync them."}</p>
        </div>
      </aside>

      <div className="overflow-hidden rounded-[28px] border border-white/10 bg-[linear-gradient(145deg,rgba(255,255,255,0.055),rgba(255,255,255,0.018))] shadow-[0_35px_100px_rgba(0,0,0,0.35)]">
        <div className="border-b border-white/[0.08] px-5 py-4 sm:px-8">
          <div className="flex items-center justify-between gap-4 text-xs">
            <span className="font-medium text-zinc-300">Question {stepIndex + 1} of {steps.length}</span>
            <span className="text-zinc-600">{user ? "Saved to My CampusAI" : "Saved on this device"}</span>
          </div>
          <div className="mt-3 h-1 overflow-hidden rounded-full bg-white/[0.07]"><div className="h-full rounded-full bg-gradient-to-r from-indigo-500 via-violet-400 to-cyan-300 transition-all duration-500" style={{ width: `${progress}%` }} /></div>
        </div>

        <div key={stepId} className="motion-pop min-h-[430px] px-5 pb-28 pt-6 sm:min-h-[530px] sm:px-8 sm:py-10">
          {stepId === "cutoff" && <div>
            <StepHeading eyebrow="Admission details" title="What is your TNEA cutoff?" description="Enter the exact aggregate shown in your application." />
            <div className="mt-6 max-w-md sm:mt-8">
              <label htmlFor="student-cutoff" className="text-sm font-medium text-zinc-300">Exact cutoff</label>
              <div className="relative mt-3">
                <input id="student-cutoff" autoFocus type="number" min="0" max="200" step="0.01" inputMode="decimal" value={profile.cutoff || ""} onChange={(event) => update("cutoff", event.target.value === "" ? 0 : Number(event.target.value))} placeholder="187.50"
                  className="h-20 w-full rounded-2xl border border-white/10 bg-black/25 px-5 pr-24 font-mono text-3xl font-semibold tabular-nums text-white outline-none transition placeholder:text-zinc-800 focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" />
                <span className="absolute right-5 top-1/2 -translate-y-1/2 text-sm text-zinc-600">out of 200</span>
              </div>
              <p className="mt-3 text-xs leading-5 text-zinc-500">Used with 2023–2025 historical cutoff evidence.</p>
            </div>
          </div>}

          {stepId === "community" && <div>
            <StepHeading eyebrow="Admission details" title="Which community is on your application?" description="We’ll use the matching historical cutoff category." />
            <div className="mt-6 grid max-w-2xl gap-2.5 sm:mt-8 sm:grid-cols-2 sm:gap-3">
              {COMMUNITY_OPTIONS.map((option) => <OptionCard key={option.value} compact selected={profile.community === option.value} title={option.label} description={option.value === "oc" ? "Open competition evidence" : `${option.label} category evidence`} onClick={() => update("community", option.value as CommunityKey)} />)}
            </div>
            <p className="mt-5 text-xs text-zinc-600">Not sure? Check the community category shown in your TNEA application before continuing.</p>
          </div>}

          {stepId === "rank" && <div>
            <StepHeading eyebrow="Start here" title="Do you know your 2026 general rank?" description="Use the overall general rank—not your community rank." />
            <div className="mt-6 grid max-w-2xl gap-2.5 sm:mt-8 sm:gap-3">
              {RANK_OPTIONS.map((option) => <OptionCard key={option.value} selected={profile.rankStatus === option.value} title={option.title} description={option.description} onClick={() => selectRankStatus(option.value)} />)}
            </div>
            {profile.rankStatus === "known" && <div className="mt-5 max-w-sm animate-in fade-in slide-in-from-top-2 duration-200">
              <label htmlFor="student-rank" className="text-sm font-medium text-zinc-300">Overall general rank</label>
              <input id="student-rank" type="number" min="1" step="1" inputMode="numeric" value={profile.rank ?? ""} onChange={(event) => update("rank", event.target.value === "" ? null : Number(event.target.value))} placeholder="24,500"
                className="mt-3 h-14 w-full rounded-2xl border border-white/10 bg-black/25 px-5 font-mono text-xl text-white outline-none focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" />
              <p className="mt-2 text-xs text-amber-300/80">Enter the overall general rank, not a community rank.</p>
            </div>}
          </div>}

          {stepId === "branches" && <div>
            <StepHeading eyebrow="Course choices" title="Which branches would you genuinely accept?" description={`Choose from ${branches.length} active branch codes in the official 2026 seat matrix. CampusAI will never add a related branch without you selecting it.`} />
            <div className="mt-6 flex flex-wrap gap-2">
              {profile.preferredBranches.map((code) => <button key={code} type="button" onClick={() => toggleBranch(code)} className="rounded-full border border-indigo-400/30 bg-indigo-500/10 px-3 py-1.5 text-xs font-medium text-indigo-200">{code} <span className="ml-1 text-indigo-300/50">×</span></button>)}
            </div>
            <div className="relative mt-5">
              <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-600" />
              <input type="search" value={branchQuery} onChange={(event) => setBranchQuery(event.target.value)} placeholder="Search CSE, robotics, textile, biomedical…" className="h-12 w-full rounded-2xl border border-white/10 bg-black/25 pl-11 pr-4 text-sm text-white outline-none placeholder:text-zinc-700 focus:border-indigo-400/60" />
            </div>
            <div className="mt-3 grid max-h-[360px] gap-2 overflow-y-auto pr-1 sm:grid-cols-2">
              {filteredBranches.map((branch) => <OptionCard key={branch.code} compact selected={profile.preferredBranches.includes(branch.code)} title={`${branch.code} · ${branch.name}`} onClick={() => toggleBranch(branch.code)} />)}
              {!filteredBranches.length && <p className="col-span-full py-12 text-center text-sm text-zinc-600">No active 2026 branch matches that search.</p>}
            </div>
          </div>}

          {stepId === "location" && <div>
            <StepHeading eyebrow="Real-life fit" title="How flexible can you be about location?" description="Location changes the order or scope of results, but it never changes the underlying admission evidence band." />
            <div className="mt-8 grid gap-3 lg:grid-cols-3">
              {LOCATION_OPTIONS.map((option) => <OptionCard key={option.value} selected={profile.locationFlexibility === option.value} title={option.title} description={option.description} onClick={() => selectLocation(option.value)} />)}
            </div>
            {profile.locationFlexibility !== "anywhere" && <div className="mt-7 animate-in fade-in slide-in-from-top-2 duration-200"><DistrictSelector value={profile.preferredDistricts} onChange={(value) => update("preferredDistricts", value.filter((district) => district !== "Anywhere in Tamil Nadu"))} /></div>}
          </div>}

          {stepId === "living" && <div>
            <StepHeading eyebrow="Real-life fit" title="What living arrangement works for you?" description="We use hostel information only when it has been verified. Unknown availability stays unknown and is clearly flagged." />
            <div className="mt-8 grid max-w-3xl gap-3 sm:grid-cols-2">
              {LIVING_OPTIONS.map((option) => <OptionCard key={option.value} selected={profile.livingArrangement === option.value} title={option.title} description={option.description} onClick={() => selectLiving(option.value)} />)}
            </div>
            {profile.livingArrangement === "hostel_required" && <div className="mt-5 flex max-w-2xl items-start gap-3 rounded-2xl border border-amber-400/20 bg-amber-500/[0.07] p-4 text-xs leading-5 text-amber-100/70"><Info className="mt-0.5 h-4 w-4 shrink-0 text-amber-300" />Colleges with verified no-hostel evidence will be excluded. Colleges with missing hostel evidence may remain, marked “needs verification,” so missing data is never treated as a confirmed no.</div>}
          </div>}

          {stepId === "filters" && <div>
            <StepHeading eyebrow="Your boundaries" title="Is anything else non-negotiable?" description="These are exclusions, not preferences. They apply only where CampusAI has reliable evidence and are never relaxed silently." />
            <div className="mt-8 grid max-w-3xl gap-3 sm:grid-cols-2">
              {EXCLUSION_OPTIONS.filter((option) => option.value !== "no_hostel" && option.value !== "minority").map((option) => <OptionCard key={option.value} selected={profile.excludedCollegeTraits.includes(option.value)} title={`Exclude ${option.label}`} description="Remove this college type when its status is verified." onClick={() => toggleExclusion(option.value)} />)}
              <OptionCard selected={profile.excludedCollegeTraits.filter((item) => item !== "no_hostel").length === 0} title="No additional exclusions" description="Keep every otherwise acceptable 2026 college–branch option." onClick={() => update("excludedCollegeTraits", profile.livingArrangement === "hostel_required" ? ["no_hostel"] : [])} />
            </div>
          </div>}

          {stepId === "review" && <div>
            <StepHeading eyebrow="Ready to recommend" title="Check your details" description="You can return and update these answers anytime." />
            <div className="mt-7 grid gap-3 sm:grid-cols-2">
              <ReviewItem icon={GraduationCap} label="Admission" value={`${profile.cutoff.toFixed(2)} cutoff · ${profile.community.toUpperCase()} · ${profile.rank ? `rank ${profile.rank.toLocaleString("en-IN")}` : "rank unavailable"}`} onEdit={() => setStepId("cutoff")} />
              <ReviewItem icon={SlidersHorizontal} label="Academic interests" value={profile.preferredBranches.join(", ")} onEdit={() => setStepId("branches")} />
              <ReviewItem icon={MapPin} label="Location" value={profile.locationFlexibility === "anywhere" ? "Anywhere in Tamil Nadu" : profile.preferredDistricts.join(", ")} onEdit={() => setStepId("location")} />
              <ReviewItem icon={BedDouble} label="Living arrangement" value={LIVING_OPTIONS.find((option) => option.value === profile.livingArrangement)?.title ?? "Either"} onEdit={() => setStepId("living")} />
            </div>
            <div className="mt-5 rounded-2xl border border-indigo-400/20 bg-indigo-500/[0.07] p-5">
              <p className="flex items-center gap-2 text-sm font-medium text-indigo-200"><ShieldCheck className="h-4 w-4" /> What CampusAI will do</p>
              <p className="mt-2 text-xs leading-6 text-indigo-100/55">Recommend active 2026 TNEA colleges that match your academic interests and personal boundaries, with each college shown once. Exact college–course ordering will be built later in AI Choice Filling.</p>
            </div>
          </div>}

          {error && <div role="alert" className="mt-6 rounded-xl border border-rose-400/20 bg-rose-500/10 px-4 py-3 text-sm text-rose-200">{error}</div>}
        </div>

        <div className="fixed bottom-[74px] left-4 right-4 z-40 mx-auto flex max-w-2xl items-center justify-between gap-3 rounded-2xl border border-white/10 bg-zinc-950/95 px-4 py-3 shadow-[0_20px_60px_rgba(0,0,0,0.55)] backdrop-blur-xl sm:static sm:max-w-none sm:rounded-none sm:border-x-0 sm:border-b-0 sm:bg-black/15 sm:px-8 sm:py-4 sm:shadow-none">
          <button type="button" onClick={previous} disabled={stepIndex === 0} className="inline-flex h-11 items-center gap-2 rounded-xl px-3 text-sm font-medium text-zinc-500 transition hover:bg-white/5 hover:text-white disabled:pointer-events-none disabled:opacity-0"><ChevronLeft className="h-4 w-4" /> Back</button>
          {stepId === "review" ? <button type="button" onClick={submit} className="group inline-flex h-12 items-center gap-2 rounded-xl bg-white px-5 text-sm font-semibold text-black shadow-[0_12px_35px_rgba(255,255,255,0.12)] transition hover:-translate-y-0.5 hover:bg-indigo-100">Build my recommendations <Sparkles className="h-4 w-4" /></button>
            : <button type="button" onClick={next} className="group inline-flex h-11 items-center gap-2 rounded-xl bg-white px-5 text-sm font-semibold text-black transition hover:-translate-y-0.5 hover:bg-zinc-200">Continue <ArrowRight className="h-4 w-4 transition group-hover:translate-x-0.5" /></button>}
        </div>
      </div>

      <button type="button" onClick={() => { setProfile(DEFAULT_STUDENT_PROFILE); setStepId("rank"); window.localStorage.removeItem(DRAFT_KEY); }} className="inline-flex min-h-10 items-center gap-2 text-xs text-zinc-600 transition hover:text-zinc-300 lg:col-start-2 lg:justify-self-end"><RotateCcw className="h-3.5 w-3.5" /> Start over</button>
    </div>
  );
}

function ReviewItem({ icon: Icon, label, value, onEdit }: { icon: typeof GraduationCap; label: string; value: string; onEdit: () => void }) {
  return <div className="rounded-2xl border border-white/10 bg-black/20 p-4">
    <div className="flex items-start justify-between gap-4">
      <div className="flex min-w-0 gap-3"><span className="rounded-xl bg-white/[0.05] p-2 text-indigo-300"><Icon className="h-4 w-4" /></span><div className="min-w-0"><p className="text-xs text-zinc-600">{label}</p><p className="mt-1 text-sm leading-6 text-zinc-200">{value || "Not selected"}</p></div></div>
      <button type="button" onClick={onEdit} className="text-xs font-medium text-indigo-300 transition hover:text-indigo-200">Edit</button>
    </div>
  </div>;
}
