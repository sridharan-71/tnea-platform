"use client";

import type { CategoryKey } from "./types";

interface CategoryTabsProps {
  value: CategoryKey;
  onChange: (category: CategoryKey) => void;
}

const categories: {
  value: CategoryKey;
  label: string;
}[] = [
  { value: "oc", label: "OC" },
  { value: "bc", label: "BC" },
  { value: "bcm", label: "BCM" },
  { value: "mbc", label: "MBC" },
  { value: "sc", label: "SC" },
  { value: "sca", label: "SCA" },
  { value: "st", label: "ST" },
];

export default function CategoryTabs({
  value,
  onChange,
}: CategoryTabsProps) {
  return (
    <div
      className="inline-flex max-w-full gap-1 overflow-x-auto rounded-xl border border-white/10 bg-black/30 p-1"
      role="tablist"
      aria-label="Community category"
    >
      {categories.map((category) => {
        const isActive =
          value === category.value;

        return (
          <button
            key={category.value}
            type="button"
            role="tab"
            aria-selected={isActive}
            onClick={() =>
              onChange(category.value)
            }
            className={[
              "min-w-14 rounded-lg px-4 py-2 text-sm font-medium transition",
              "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-400",
              isActive
                ? "bg-white text-black shadow-sm"
                : "text-zinc-400 hover:bg-white/5 hover:text-white",
            ].join(" ")}
          >
            {category.label}
          </button>
        );
      })}
    </div>
  );
}
