"use client";

import {
  useMemo,
  useState,
} from "react";

import {
  Activity,
  Database,
} from "lucide-react";

import CategoryTabs from "./CategoryTabs";
import CutoffStats from "./CutoffStats";
import CutoffTable from "./CutoffTable";

import type {
  CategoryKey,
  DashboardBranch,
} from "./types";

import {
  getLatestValue,
} from "./cutoffUtils";

interface CutoffDashboardProps {
  branches: DashboardBranch[];
}

export default function CutoffDashboard({
  branches,
}: CutoffDashboardProps) {
  const [category, setCategory] =
    useState<CategoryKey>("oc");

  const availableBranchCount = useMemo(
    () =>
      branches.filter(
        (branch) =>
          getLatestValue(
            branch,
            category
          ) !== null
      ).length,
    [branches, category]
  );

  return (
    <section className="mt-10">
      <div className="overflow-hidden rounded-2xl border border-white/10 bg-zinc-950/80 shadow-2xl shadow-black/20">
        <div className="flex flex-col gap-5 border-b border-white/10 px-5 py-5 md:flex-row md:items-center md:justify-between">
          <div className="flex items-start gap-3">
            <div className="rounded-xl border border-indigo-400/15 bg-indigo-500/10 p-2.5">
              <Activity className="h-5 w-5 text-indigo-300" />
            </div>

            <div>
              <h2 className="text-lg font-semibold tracking-tight text-white">
                Cutoff Intelligence
              </h2>

              <p className="mt-1 text-sm text-zinc-500">
                Three-year branch cutoff trends by community category
              </p>
            </div>
          </div>

          <CategoryTabs
            value={category}
            onChange={setCategory}
          />
        </div>

        <CutoffStats
          branches={branches}
          category={category}
        />

        <div className="flex items-center gap-2 border-b border-white/[0.06] px-5 py-3 text-xs text-zinc-500">
          <Database className="h-3.5 w-3.5" />

          <span>
            {availableBranchCount} of{" "}
            {branches.length} branches have{" "}
            {category.toUpperCase()} cutoff data
          </span>
        </div>

        <CutoffTable
          branches={branches}
          category={category}
        />
      </div>
    </section>
  );
}