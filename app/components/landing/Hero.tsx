import Container from "@/components/shared/Container";
import SearchBox from "@/components/search/SearchBox";
import { ArrowRight, Sparkles, ShieldCheck, TrendingUp } from "lucide-react";

export default function Hero() {
  return (
    <div className="relative overflow-visible bg-[#09090B]">
      {/* Background */}
      <div className="absolute inset-0 -z-10">
        <div className="absolute left-1/2 top-0 h-[700px] w-[700px] -translate-x-1/2 rounded-full bg-indigo-500/20 blur-[160px]" />
        <div className="absolute right-0 top-1/3 h-[400px] w-[400px] rounded-full bg-purple-500/10 blur-[140px]" />
        <div className="absolute bottom-0 left-0 h-[400px] w-[400px] rounded-full bg-cyan-500/10 blur-[140px]" />

        {/* Grid */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.03)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.03)_1px,transparent_1px)] bg-[size:48px_48px]" />
      </div>

      <Container>
        <section className="flex min-h-screen flex-col items-center justify-center py-24 text-center">
          {/* Announcement pill */}
          <div className="inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/5 px-4 py-2 text-sm text-zinc-300 backdrop-blur-md">
            <Sparkles className="h-4 w-4 text-indigo-400" />
            AI-powered TNEA counselling
            <span className="rounded-full bg-indigo-500/20 px-2 py-0.5 text-xs text-indigo-300">
              2026
            </span>
          </div>

          {/* Headline */}
          <h1 className="mt-8 max-w-6xl text-5xl font-bold tracking-tight text-white sm:text-6xl lg:text-7xl xl:text-8xl">
            Find your perfect
            <span className="block bg-gradient-to-r from-white via-indigo-200 to-cyan-200 bg-clip-text text-transparent">
              engineering college.
            </span>
          </h1>

          {/* Subtitle */}
          <p className="mt-6 max-w-3xl text-lg leading-8 text-zinc-400 sm:text-xl">
            Search every engineering college in Tamil Nadu using official
            TNEA data. Compare previous year cutoffs, predict admission
            chances, and get a personalized AI-generated choice filling
            order in seconds.
          </p>

          {/* Search */}
          <div className="mt-12 w-full max-w-3xl">
            <SearchBox />
          </div>

          {/* Quick stats */}
          <div className="mt-8 flex flex-wrap items-center justify-center gap-6 text-sm text-zinc-400">
            <div className="flex items-center gap-2">
              <ShieldCheck className="h-4 w-4 text-green-400" />
              Official TNEA data
            </div>
            <div className="flex items-center gap-2">
              <TrendingUp className="h-4 w-4 text-indigo-400" />
              649+ colleges indexed
            </div>
            <div className="flex items-center gap-2">
              <Sparkles className="h-4 w-4 text-purple-400" />
              AI-powered recommendations
            </div>
          </div>

          {/* CTA buttons */}
          <div className="mt-12 flex flex-col gap-4 sm:flex-row">
            <a
              href="#search"
              className="group inline-flex items-center justify-center gap-2 rounded-xl bg-white px-6 py-3 font-medium text-black transition-all hover:scale-[1.02] hover:bg-zinc-200"
            >
              Start searching
              <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
            </a>

            <a
              href="#features"
              className="inline-flex items-center justify-center rounded-xl border border-white/10 bg-white/5 px-6 py-3 font-medium text-white backdrop-blur-md transition-all hover:bg-white/10"
            >
              Explore features
            </a>
          </div>

          {/* Preview card */}
          <div className="mt-20 w-full max-w-5xl">
            <div className="relative overflow-hidden rounded-3xl border border-white/10 bg-white/5 p-6 shadow-2xl backdrop-blur-xl">
              <div className="absolute inset-0 bg-gradient-to-br from-white/5 via-transparent to-indigo-500/5" />

              <div className="relative grid gap-6 md:grid-cols-3">
                <div className="rounded-2xl border border-white/10 bg-black/30 p-5 text-left">
                  <p className="text-sm text-zinc-400">Your rank</p>
                  <p className="mt-2 text-3xl font-bold text-white">12,450</p>
                  <p className="mt-1 text-sm text-zinc-500">SC category</p>
                </div>

                <div className="rounded-2xl border border-indigo-500/20 bg-indigo-500/10 p-5 text-left">
                  <div className="flex items-center justify-between">
                    <p className="text-sm text-indigo-300">Best match</p>
                    <span className="rounded-full bg-green-500/20 px-2 py-1 text-xs text-green-300">
                      92% chance
                    </span>
                  </div>
                  <p className="mt-2 text-xl font-semibold text-white">
                    Sri Eshwar College
                  </p>
                  <p className="mt-1 text-sm text-zinc-400">
                    CSE • Coimbatore
                  </p>
                </div>

                <div className="rounded-2xl border border-white/10 bg-black/30 p-5 text-left">
                  <p className="text-sm text-zinc-400">AI generated</p>
                  <p className="mt-2 text-lg font-semibold text-white">
                    Choice filling order
                  </p>
                  <p className="mt-1 text-sm text-zinc-500">
                    24 colleges ranked by safety, fit, and placement potential
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>
      </Container>
    </div>
  );
}