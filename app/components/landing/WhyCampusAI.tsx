import {
  ShieldCheck,
  Target,
  Zap,
} from "lucide-react";

const reasons = [
  {
    icon: Target,
    title: "Data Driven Decisions",
    text:
      "Recommendations powered by real counselling data instead of guesswork.",
  },
  {
    icon: Zap,
    title: "Clear next actions",
    text:
      "Know the official step, deadline rule and consequence before acting.",
  },
  {
    icon: ShieldCheck,
    title: "Built For Students",
    text:
      "Designed specifically for Tamil Nadu engineering admissions.",
  },
];

export default function WhyCampusAI() {
  return (
    <section className="bg-zinc-950 px-6 py-24">

      <div className="mx-auto max-w-6xl">

        <h2 className="text-center text-4xl font-bold text-white">
          Why CampusAI?
        </h2>


        <div className="mt-14 grid gap-8 md:grid-cols-3">

          {reasons.map((reason)=>{

            const Icon = reason.icon;

            return (
              <div
                key={reason.title}
                className="text-center"
              >

                <Icon className="mx-auto h-10 w-10 text-violet-400"/>

                <h3 className="mt-5 text-xl font-semibold text-white">
                  {reason.title}
                </h3>

                <p className="mt-3 text-gray-400">
                  {reason.text}
                </p>

              </div>
            );

          })}

        </div>

      </div>

    </section>
  );
}
