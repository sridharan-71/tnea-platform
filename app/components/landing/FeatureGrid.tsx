import {
  Brain,
  ChartNoAxesCombined,
  ListChecks,
  Search,
} from "lucide-react";

const features = [
  {
    icon: Brain,
    title: "AI College Recommendations",
    description:
      "Get personalized college suggestions based on your rank, category, interests and career goals.",
  },
  {
    icon: Search,
    title: "Smart College Search",
    description:
      "Explore engineering colleges with verified TNEA data, branches and cutoff trends.",
  },
  {
    icon: ChartNoAxesCombined,
    title: "Rank Prediction",
    description:
      "Understand your admission chances before counselling starts.",
  },
  {
    icon: ListChecks,
    title: "Choice Filling Assistant",
    description:
      "Generate optimized college preference lists using data-driven insights.",
  },
];

export default function FeatureGrid() {
  return (
    <section className="bg-black px-6 py-24">
      <div className="mx-auto max-w-6xl">

        <div className="mx-auto max-w-2xl text-center">
          <h2 className="text-4xl font-bold text-white">
            Everything you need for counselling
          </h2>

          <p className="mt-4 text-gray-400">
            CampusAI combines admission data and artificial intelligence
            to simplify engineering counselling.
          </p>
        </div>


        <div className="mt-16 grid gap-6 md:grid-cols-2">

          {features.map((feature) => {
            const Icon = feature.icon;

            return (
              <div
                key={feature.title}
                className="rounded-3xl border border-white/10 bg-zinc-900/40 p-8 transition hover:border-violet-500/40"
              >

                <Icon className="h-10 w-10 text-violet-400"/>

                <h3 className="mt-6 text-xl font-semibold text-white">
                  {feature.title}
                </h3>

                <p className="mt-3 text-gray-400">
                  {feature.description}
                </p>

              </div>
            );
          })}

        </div>

      </div>
    </section>
  );
}