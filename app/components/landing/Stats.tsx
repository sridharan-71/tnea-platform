import {
  Building2,
  Database,
  GraduationCap,
  Sparkles,
} from "lucide-react";

const stats = [
  {
    icon: Building2,
    value: "649+",
    label: "Engineering Colleges",
  },
  {
    icon: Database,
    value: "3 Years",
    label: "Historical Cutoff Data",
  },
  {
    icon: GraduationCap,
    value: "TNEA",
    label: "Counselling Intelligence",
  },
  {
    icon: Sparkles,
    value: "AI",
    label: "Personalized Guidance",
  },
];

export default function Stats() {
  return (
    <section className="border-y border-white/10 bg-black px-6 py-20">
      <div className="mx-auto grid max-w-6xl gap-6 md:grid-cols-4">
        {stats.map((stat) => {
          const Icon = stat.icon;

          return (
            <div
              key={stat.label}
              className="rounded-3xl border border-white/10 bg-zinc-900/50 p-8 text-center"
            >
              <Icon className="mx-auto mb-5 h-8 w-8 text-violet-400" />

              <h3 className="text-3xl font-bold text-white">
                {stat.value}
              </h3>

              <p className="mt-2 text-sm text-gray-400">
                {stat.label}
              </p>
            </div>
          );
        })}
      </div>
    </section>
  );
}