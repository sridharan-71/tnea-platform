import {
  Sparkles,
} from "lucide-react";


export default function AdmissionCard() {

  return (
    <section className="mt-10 rounded-3xl border border-indigo-500/20 bg-indigo-500/10 p-8">


      <div className="flex items-center gap-3">

        <Sparkles className="h-6 w-6 text-indigo-400" />

        <h2 className="text-2xl font-bold text-white">
          AI Admission Analysis
        </h2>

      </div>


      <p className="mt-4 max-w-xl text-zinc-300">
        Enter your TNEA rank and category to get your
        admission probability and personalized choice order.
      </p>


      <button className="mt-6 rounded-xl bg-white px-6 py-3 font-medium text-black">
        Analyze My Chance
      </button>


    </section>
  );
}