import Link from "next/link";
import { notFound } from "next/navigation";
import {
  ArrowRight,
  Building2,
  GraduationCap,
  MapPin,
  MessageSquareText,
} from "lucide-react";

import CutoffDashboard from "@/components/college/cutoff/CutoffDashboard";
import { getCollegeByCode } from "@/lib/repositories/collegeRepository";
import { getCollegeCutoffDashboard } from "@/lib/repositories/cutoffDashboardRepository";

interface CollegePageProps {
  params: Promise<{ collegeCode: string }>;
}

export default async function CollegePage({ params }: CollegePageProps) {
  const code = Number((await params).collegeCode);
  if (!Number.isInteger(code) || code <= 0) notFound();

  const college = await getCollegeByCode(code);
  if (!college) notFound();
  const cutoffDashboard = await getCollegeCutoffDashboard(code);

  return (
    <main className="min-h-screen bg-black px-4 py-8 text-white sm:px-6 sm:py-14">
      <div className="mx-auto max-w-6xl">
        <section className="rounded-3xl border border-white/10 bg-zinc-900/50 p-5 sm:p-8 lg:p-10">
          <h1 className="text-2xl font-bold leading-tight sm:text-4xl">
            {college.college_name}
          </h1>
          <div className="mt-6 flex flex-wrap gap-6 text-zinc-400">
            <span className="flex items-center gap-2">
              <MapPin className="h-5 w-5 text-indigo-400" />
              {college.district}
            </span>
            <span className="flex items-center gap-2">
              <GraduationCap className="h-5 w-5 text-indigo-400" />
              {college.college_type}
            </span>
            <span className="flex items-center gap-2">
              <Building2 className="h-5 w-5 text-indigo-400" />
              Code: {college.college_code}
            </span>
          </div>
        </section>

        <CutoffDashboard branches={cutoffDashboard} />

        <section className="mt-6 flex flex-col gap-4 rounded-3xl border border-indigo-400/15 bg-indigo-500/[0.055] p-5 sm:flex-row sm:items-center sm:justify-between sm:p-6">
          <div>
            <h2 className="flex items-center gap-2 text-base font-semibold text-white">
              <MessageSquareText className="h-4 w-4 text-indigo-300" />
              Need help interpreting this evidence?
            </h2>
            <p className="mt-2 max-w-2xl text-sm leading-6 text-zinc-500">
              Ask the counsellor about the cutoff history or return to your
              rank-first college list. CampusAI does not predict guaranteed admission.
            </p>
          </div>
          <div className="grid shrink-0 gap-2 sm:grid-cols-2">
            <Link href="/recommendations" className="inline-flex min-h-11 items-center justify-center gap-2 rounded-xl bg-white px-4 py-2.5 text-sm font-semibold text-black">
              My recommendations <ArrowRight className="h-4 w-4" />
            </Link>
            <Link href="/counsellor" className="inline-flex min-h-11 items-center justify-center gap-2 rounded-xl border border-white/10 px-4 py-2.5 text-sm font-medium text-zinc-200">
              Ask counsellor <ArrowRight className="h-4 w-4" />
            </Link>
          </div>
        </section>
      </div>
    </main>
  );
}
