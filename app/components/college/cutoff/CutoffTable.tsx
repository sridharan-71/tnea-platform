import CutoffRow from "./CutoffRow";

import type {
  CategoryKey,
  DashboardBranch,
} from "./types";

import {
  sortBranches,
} from "./cutoffUtils";

interface CutoffTableProps {
  branches: DashboardBranch[];
  category: CategoryKey;
}

export default function CutoffTable({
  branches,
  category,
}: CutoffTableProps) {
  const sortedBranches = sortBranches(
    branches,
    category
  );

  if (sortedBranches.length === 0) {
    return (
      <div className="flex min-h-48 items-center justify-center px-6 text-center text-sm text-zinc-500">
        No cutoff history is available for this
        college.
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="w-full border-collapse">
        <thead>
          <tr className="border-b border-white/10 bg-white/[0.025]">
            <th className="min-w-64 py-3 pl-5 pr-6 text-left text-xs font-medium uppercase tracking-wider text-zinc-500">
              Branch
            </th>

            <th className="px-4 py-3 text-right text-xs font-medium uppercase tracking-wider text-zinc-500">
              2023
            </th>

            <th className="px-4 py-3 text-right text-xs font-medium uppercase tracking-wider text-zinc-500">
              2024
            </th>

            <th className="bg-indigo-500/[0.06] px-4 py-3 text-right text-xs font-semibold uppercase tracking-wider text-indigo-300">
              2025
            </th>

            <th className="min-w-52 px-4 py-3 text-left text-xs font-medium uppercase tracking-wider text-zinc-500">
              Trend
            </th>

            <th className="py-3 pl-4 pr-5 text-right text-xs font-medium uppercase tracking-wider text-zinc-500">
              Latest
            </th>
          </tr>
        </thead>

        <tbody>
          {sortedBranches.map((branch) => (
            <CutoffRow
              key={`${branch.branch_code}-${category}`}
              branch={branch}
              category={category}
            />
          ))}
        </tbody>
      </table>
    </div>
  );
}