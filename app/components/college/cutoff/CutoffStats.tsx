import type { ComponentType } from "react";
import {
  BarChart3,
  Flame,
  Layers3,
  TrendingDown,
} from "lucide-react";

import type {
  CategoryKey,
  DashboardBranch,
} from "./types";

import {
  formatCutoff,
  getLatestValue,
} from "./cutoffUtils";

interface CutoffStatsProps {
  branches: DashboardBranch[];
  category: CategoryKey;
}

interface StatCardProps {
  label: string;
  value: string;
  helper: string;
  icon: ComponentType<{
    className?: string;
  }>;
}

function StatCard({
  label,
  value,
  helper,
  icon: Icon,
}: StatCardProps) {
  return (
    <div className="rounded-2xl border border-white/10 bg-white/[0.03] p-5">
      <div className="flex items-start justify-between gap-4">
        <div>
          <p className="text-xs uppercase tracking-wider text-zinc-500">
            {label}
          </p>

          <p className="mt-3 font-mono text-2xl font-bold tabular-nums text-white">
            {value}
          </p>

          <p className="mt-1 text-xs text-zinc-600">
            {helper}
          </p>
        </div>

        <div className="rounded-xl bg-indigo-500/10 p-2">
          <Icon className="h-5 w-5 text-indigo-300" />
        </div>
      </div>
    </div>
  );
}

export default function CutoffStats({
  branches,
  category,
}: CutoffStatsProps) {
  const values = branches
    .map((branch) =>
      getLatestValue(branch, category)
    )
    .filter(
      (value): value is number =>
        value !== null
    );

  const count = values.length;

  const highest =
    count > 0
      ? Math.max(...values)
      : null;

  const lowest =
    count > 0
      ? Math.min(...values)
      : null;

  const average =
    count > 0
      ? values.reduce(
          (total, value) => total + value,
          0
        ) / count
      : null;

  return (
    <div className="grid gap-4 border-b border-white/10 p-6 md:grid-cols-2 xl:grid-cols-4">
      <StatCard
        label="Branches"
        value={count.toString()}
        helper={`${category.toUpperCase()} data available`}
        icon={Layers3}
      />

      <StatCard
        label="Highest"
        value={formatCutoff(highest)}
        helper="Highest latest cutoff"
        icon={Flame}
      />

      <StatCard
        label="Lowest"
        value={formatCutoff(lowest)}
        helper="Lowest latest cutoff"
        icon={TrendingDown}
      />

      <StatCard
        label="Average"
        value={formatCutoff(average)}
        helper="Average latest cutoff"
        icon={BarChart3}
      />
    </div>
  );
}
