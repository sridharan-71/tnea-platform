import { ListChecks, SlidersHorizontal, Target } from "lucide-react";

const features = [
  {
    icon: SlidersHorizontal,
    step: "01",
    title: "Tell us what matters",
    description: "Your rank, cutoff, branches and practical preferences.",
  },
  {
    icon: Target,
    step: "02",
    title: "See your realistic range",
    description: "Colleges grouped into Reach, Target, Safe and Very Safe.",
  },
  {
    icon: ListChecks,
    step: "03",
    title: "Build a confident plan",
    description: "Understand why each college fits before counselling.",
  },
];

export default function FeatureGrid() {
  return (
    <section className="bg-[#070708] px-4 py-16 sm:px-6 sm:py-24">
      <div className="mx-auto max-w-5xl">
        <div className="max-w-2xl">
          <p className="text-xs font-semibold uppercase tracking-[0.18em] text-indigo-300">One clear path</p>
          <h2 className="mt-3 text-3xl font-semibold tracking-tight text-white sm:text-4xl">From confused to counselling-ready.</h2>
          <p className="mt-4 text-sm leading-6 text-zinc-500 sm:text-base">CampusAI shows the right amount of information at the right time.</p>
        </div>
        <div className="mt-9 grid gap-3 md:mt-12 md:grid-cols-3">
          {features.map((feature) => {
            const Icon = feature.icon;
            return (
              <div key={feature.title} className="motion-tap flex gap-4 rounded-3xl border border-white/[0.08] bg-gradient-to-br from-white/[0.05] to-transparent p-5 hover:-translate-y-1 hover:border-indigo-400/20 hover:bg-indigo-500/[0.035] sm:block sm:p-7">
                <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-2xl border border-indigo-400/15 bg-indigo-500/[0.09]"><Icon className="h-5 w-5 text-indigo-300" /></div>
                <div>
                  <p className="text-[10px] font-semibold tracking-[0.18em] text-zinc-600 sm:mt-5">STEP {feature.step}</p>
                  <h3 className="mt-1 text-base font-semibold text-white sm:text-lg">{feature.title}</h3>
                  <p className="mt-1.5 text-sm leading-6 text-zinc-500 sm:mt-3">{feature.description}</p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
