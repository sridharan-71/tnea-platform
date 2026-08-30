"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import {
  ArrowRight,
  CheckCircle2,
  Sparkles,
} from "lucide-react";

import type { StudentProfile } from "@/lib/types/student";
import {
  readStudentProfile,
  STUDENT_STATE_CHANGE_EVENT,
} from "@/lib/account/studentState";

export default function RecommendationEntry() {
  const [profile, setProfile] = useState<StudentProfile | null>(null);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    const load = () => {
      setProfile(readStudentProfile());
      setReady(true);
    };
    load();
    window.addEventListener(STUDENT_STATE_CHANGE_EVENT, load);
    window.addEventListener("storage", load);
    return () => {
      window.removeEventListener(STUDENT_STATE_CHANGE_EVENT, load);
      window.removeEventListener("storage", load);
    };
  }, []);

  const hasCompleteProfile = Boolean(
    profile?.cutoff &&
    profile?.community &&
    profile.preferredDistricts?.length &&
    profile.preferredBranches?.length,
  );

  return (
    <div className="mt-8 w-full max-w-xl sm:mt-10">
      <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
        <Link
          href={hasCompleteProfile ? "/recommendations" : "/analyze"}
          className="motion-shine motion-tap group inline-flex min-h-14 items-center justify-center gap-2 rounded-2xl bg-white px-6 text-[15px] font-semibold text-black shadow-[0_14px_45px_rgba(255,255,255,0.12)] hover:-translate-y-0.5 hover:bg-indigo-100"
        >
          <Sparkles className="h-4 w-4" />
          {hasCompleteProfile ? "View my college list" : "Find colleges for me"}
          <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
        </Link>

        <Link
          href={hasCompleteProfile ? "/analyze" : "/counselling"}
          className="motion-tap inline-flex min-h-12 items-center justify-center rounded-2xl px-5 text-sm font-medium text-zinc-400 hover:bg-white/[0.05] hover:text-white"
        >
          {hasCompleteProfile ? "Update my details" : "How TNEA counselling works"}
        </Link>
      </div>

      {!ready ? (
        <div className="mx-auto mt-5 h-12 max-w-sm animate-pulse rounded-2xl bg-white/[0.035]" />
      ) : hasCompleteProfile && profile ? (
        <div className="mx-auto mt-5 flex max-w-md items-center justify-between gap-4 rounded-2xl border border-indigo-400/15 bg-indigo-500/[0.07] px-4 py-3 text-left">
          <div className="min-w-0">
            <p className="truncate text-sm font-medium text-white">
              {profile.name ? `${profile.name.split(" ")[0]}'s profile` : "Your profile"} is ready
            </p>
            <p className="mt-0.5 text-xs text-zinc-500">
              {profile.rank ? `Rank ${new Intl.NumberFormat("en-IN").format(profile.rank)}` : `${profile.cutoff} cutoff`} · {profile.community.toUpperCase()}
            </p>
          </div>
          <CheckCircle2 className="h-5 w-5 shrink-0 text-emerald-400" />
        </div>
      ) : null}
    </div>
  );
}
