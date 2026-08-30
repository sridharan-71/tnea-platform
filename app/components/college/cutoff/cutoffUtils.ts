import type {
  CategoryKey,
  DashboardBranch,
  TrendDirection,
} from "./types";

export const DASHBOARD_YEARS = [2023, 2024, 2025] as const;

export function getValueForYear(
  branch: DashboardBranch,
  category: CategoryKey,
  year: number
): number | null {
  const historyItem = branch.history.find(
    (item) => item.year === year
  );

  return historyItem?.[category] ?? null;
}

export function getValues(
  branch: DashboardBranch,
  category: CategoryKey
): (number | null)[] {
  return DASHBOARD_YEARS.map((year) =>
    getValueForYear(branch, category, year)
  );
}

export function getLatestValue(
  branch: DashboardBranch,
  category: CategoryKey
): number | null {
  const history = [...branch.history].sort(
    (a, b) => b.year - a.year
  );

  for (const item of history) {
    const value = item[category];

    if (value !== null) {
      return value;
    }
  }

  return null;
}

export function getDelta(
  branch: DashboardBranch,
  category: CategoryKey
): number | null {
  const numericValues = getValues(branch, category).filter(
    (value): value is number => value !== null
  );

  if (numericValues.length < 2) {
    return null;
  }

  const latest = numericValues[numericValues.length - 1];
  const previous = numericValues[numericValues.length - 2];

  return latest - previous;
}

export function calculateTrend(
  branch: DashboardBranch,
  category: CategoryKey
): TrendDirection {
  const numericValues = getValues(branch, category).filter(
    (value): value is number => value !== null
  );

  if (numericValues.length < 2) {
    return "stable";
  }

  const latest = numericValues[numericValues.length - 1];
  const previous = numericValues[numericValues.length - 2];
  const difference = latest - previous;

  if (difference > 0.25) {
    return "rising";
  }

  if (difference < -0.25) {
    return "falling";
  }

  return "stable";
}

export function sortBranches(
  branches: DashboardBranch[],
  category: CategoryKey
): DashboardBranch[] {
  return [...branches].sort((first, second) => {
    const firstValue = getLatestValue(first, category);
    const secondValue = getLatestValue(second, category);

    if (firstValue === null && secondValue === null) {
      return first.branch_name.localeCompare(second.branch_name);
    }

    if (firstValue === null) {
      return 1;
    }

    if (secondValue === null) {
      return -1;
    }

    return secondValue - firstValue;
  });
}

export function formatCutoff(
  value: number | null
): string {
  if (value === null) {
    return "—";
  }

  return value.toFixed(1).replace(/\.0$/, "");
}