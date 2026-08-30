import TrendBadge from "./TrendBadge";
import TrendSparkline from "./TrendSparkline";

import type {
  CategoryKey,
  DashboardBranch,
} from "./types";

import {
  calculateTrend,
  formatCutoff,
  getLatestValue,
  getValues,
} from "./cutoffUtils";

interface CutoffRowProps {
  branch: DashboardBranch;
  category: CategoryKey;
}

export default function CutoffRow({
  branch,
  category,
}: CutoffRowProps) {
  const values = getValues(
    branch,
    category
  );

  const latestValue = getLatestValue(
    branch,
    category
  );

  const trend = calculateTrend(
    branch,
    category
  );

  return (
    <tr className="group border-b border-white/[0.06] transition-colors last:border-b-0 hover:bg-white/[0.025]">
      <td className="min-w-64 py-4 pl-5 pr-6">
        <div className="flex flex-col gap-1">
          <span className="text-sm font-medium leading-5 text-zinc-100">
            {branch.branch_name}
          </span>

          <span className="font-mono text-[11px] uppercase tracking-wider text-zinc-600">
            {branch.branch_code}
          </span>
        </div>
      </td>

      {values.map((value, index) => (
        <td
          key={`${branch.branch_code}-${index}`}
          className={[
            "whitespace-nowrap px-4 py-4 text-right",
            "font-mono text-sm tabular-nums",
            index === values.length - 1
              ? "font-semibold text-white"
              : "text-zinc-400",
          ].join(" ")}
        >
          {formatCutoff(value)}
        </td>
      ))}

      <td className="whitespace-nowrap px-4 py-4">
        <div className="flex items-center gap-3">
          <TrendSparkline
            values={values}
          />

          <TrendBadge trend={trend} />
        </div>
      </td>

      <td className="whitespace-nowrap py-4 pl-4 pr-5 text-right font-mono text-sm font-semibold tabular-nums text-indigo-300">
        {formatCutoff(latestValue)}
      </td>
    </tr>
  );
}