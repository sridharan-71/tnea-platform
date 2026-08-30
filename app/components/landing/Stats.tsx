import {
  Building2,
  GitBranch,
  ShieldCheck,
} from "lucide-react";

const stats = [
  {
    icon: Building2,
    value: "418",
    label: "active TNEA colleges",
  },
  {
    icon: GitBranch,
    value: "3,419",
    label: "active branch choices",
  },
  {
    icon: ShieldCheck,
    value: "2026",
    label: "official counselling scope",
  },
];

export default function Stats() {
  return (
    <section className="border-y border-white/[0.07] bg-[#0a0a0c] px-4 py-8 sm:px-6 sm:py-12">
      <div className="mx-auto grid max-w-5xl grid-cols-3 divide-x divide-white/[0.07]">
        {stats.map((stat) => {
          const Icon = stat.icon;

          return (
            <div
              key={stat.label}
              className="motion-reveal px-2 text-center sm:px-8"
            >
              <Icon className="mx-auto mb-3 h-4 w-4 text-indigo-300 sm:h-5 sm:w-5" />
              <h3 className="text-xl font-semibold tracking-tight text-white sm:text-3xl">
                {stat.value}
              </h3>
              <p className="mt-1 text-[10px] leading-4 text-zinc-500 sm:text-sm">
                {stat.label}
              </p>
            </div>
          );
        })}
      </div>
    </section>
  );
}
