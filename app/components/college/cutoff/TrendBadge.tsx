import { TrendingDown, TrendingUp, Minus } from "lucide-react";

import { TrendDirection } from "./types";

interface TrendBadgeProps {
  trend: TrendDirection;
}

export default function TrendBadge({
  trend,
}: TrendBadgeProps) {
  const config = {
    rising: {
      icon: TrendingUp,
      label: "Rising",
      className:
        "border-emerald-500/20 bg-emerald-500/10 text-emerald-400",
    },
    falling: {
      icon: TrendingDown,
      label: "Falling",
      className:
        "border-rose-500/20 bg-rose-500/10 text-rose-400",
    },
    stable: {
      icon: Minus,
      label: "Stable",
      className:
        "border-zinc-700 bg-zinc-800/70 text-zinc-300",
    },
  } as const;

  const item = config[trend];
  const Icon = item.icon;

  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full border px-2.5 py-1 text-xs font-medium ${item.className}`}
    >
      <Icon className="h-3.5 w-3.5" />
      {item.label}
    </span>
  );
}