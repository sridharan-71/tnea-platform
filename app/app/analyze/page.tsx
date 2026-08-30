import type { Metadata } from "next";
import Link from "next/link";
import { ArrowLeft, BrainCircuit } from "lucide-react";
import StudentProfileForm from "@/components/analyze/StudentProfileForm";
import { getActiveTneaBranchOptions } from "@/lib/repositories/tnea2026Repository";

export const metadata: Metadata = {
  title: "Student Analysis | CampusAI",
  description: "Create your TNEA counselling profile for personalized college recommendations.",
};

export default async function AnalyzePage() {
  // Keep deployments and the questionnaire available during a temporary data
  // service outage. StudentProfileForm owns the small built-in branch fallback.
  const activeBranches = await getActiveTneaBranchOptions().catch(() => []);
  return <main className="relative min-h-screen overflow-hidden bg-zinc-950 text-white">
    <div className="pointer-events-none absolute inset-x-0 top-0 h-[440px] bg-[radial-gradient(circle_at_top,rgba(79,70,229,0.14),transparent_65%)]" />
    <div className="relative mx-auto max-w-7xl px-4 pb-8 pt-5 sm:px-6 sm:py-12 lg:px-8">
      <Link href="/" className="inline-flex min-h-10 items-center gap-2 text-sm text-zinc-500 transition hover:text-white"><ArrowLeft className="h-4 w-4" />Home</Link>
      <header className="mt-4 max-w-3xl sm:mt-8">
        <div className="inline-flex items-center gap-2 rounded-full border border-indigo-400/20 bg-indigo-500/10 px-3 py-1.5 text-xs font-medium text-indigo-200"><BrainCircuit className="h-3.5 w-3.5" />Personalized counselling</div>
        <h1 className="mt-3 text-2xl font-semibold tracking-tight sm:mt-5 sm:text-5xl">Build your college list</h1>
        <p className="mt-2 max-w-2xl text-sm leading-6 text-zinc-500 sm:mt-4 sm:text-lg sm:leading-7">One question at a time. Your answers are saved automatically.</p>
      </header>
      <section className="mt-5 sm:mt-10" aria-label="Student profile questionnaire"><StudentProfileForm branchOptions={activeBranches} /></section>
    </div>
  </main>;
}
