export default function Hero() {
  return (
    <section className="min-h-screen bg-black text-white">
      <div className="mx-auto flex min-h-screen max-w-7xl flex-col items-center justify-center px-6 text-center">

        <span className="rounded-full border border-white/10 bg-white/5 px-4 py-2 text-sm text-gray-300">
          🚀 AI-Powered Engineering Counselling
        </span>

        <h1 className="mt-8 max-w-5xl text-6xl font-bold leading-tight">
          Find the{" "}
          <span className="text-violet-400">
            right engineering college
          </span>
          , not just any college.
        </h1>

        <p className="mt-6 max-w-2xl text-lg text-gray-400">
          CampusAI analyzes your cutoff, community, district,
          previous year cutoffs, placements, and thousands of
          admission records to build your perfect TNEA choice list.
        </p>

        <div className="mt-10 flex gap-4">
          <button className="rounded-xl bg-white px-6 py-3 font-semibold text-black hover:scale-105 transition">
            Get Started
          </button>

          <button className="rounded-xl border border-white/20 px-6 py-3 hover:bg-white/10 transition">
            Watch Demo
          </button>
        </div>

      </div>
    </section>
  );
}