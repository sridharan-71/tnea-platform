import Container from "@/components/shared/Container";
import SearchBox from "@/components/search/SearchBox";
import RecommendationEntry from "@/components/landing/RecommendationEntry";
import { Search, ShieldCheck, Sparkles } from "lucide-react";

export default function Hero() {
  return (
    <div className="relative overflow-hidden bg-[#08080a]">
      <div className="absolute inset-0 -z-10">
        <div className="absolute left-1/2 top-[-180px] h-[620px] w-[620px] -translate-x-1/2">
          <div className="motion-ambient-float h-full w-full rounded-full bg-indigo-500/25 blur-[150px]" />
        </div>
        <div className="motion-ambient-drift absolute right-[-180px] top-1/3 h-[380px] w-[380px] rounded-full bg-cyan-500/10 blur-[140px]" />
        <div className="motion-grid-drift absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.018)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.018)_1px,transparent_1px)] bg-[size:44px_44px]" />
      </div>

      <Container>
        <section className="mx-auto flex min-h-[calc(100svh-69px)] max-w-5xl flex-col items-center justify-center pb-14 pt-12 text-center sm:py-20 lg:py-24">
          <div className="motion-reveal inline-flex items-center gap-2 rounded-full border border-indigo-300/15 bg-indigo-400/[0.08] px-3 py-1.5 text-xs font-medium text-indigo-100 backdrop-blur-xl sm:text-sm">
            <Sparkles className="h-3.5 w-3.5 text-indigo-300" />
            Built for TNEA 2026
          </div>

          <h1 className="motion-reveal-delay-1 mt-6 max-w-4xl text-[2.7rem] font-bold leading-[0.98] tracking-[-0.05em] text-white sm:mt-8 sm:text-6xl lg:text-7xl">
            Your TNEA choices,
            <span className="mt-1 block bg-gradient-to-r from-white via-indigo-200 to-cyan-200 bg-clip-text text-transparent sm:mt-2">
              made clear.
            </span>
          </h1>

          <p className="motion-reveal-delay-2 mt-5 max-w-2xl text-[15px] leading-6 text-zinc-400 sm:mt-6 sm:text-lg sm:leading-8">
            Answer a few simple questions and get a realistic college list
            built around your 2026 rank, cutoff and preferences.
          </p>

          <div className="motion-reveal-delay-3 w-full">
            <RecommendationEntry />
          </div>

          <div className="motion-reveal-delay-3 mt-6 flex flex-wrap items-center justify-center gap-x-5 gap-y-2 text-xs text-zinc-500 sm:text-sm">
            <div className="flex items-center gap-2">
              <ShieldCheck className="h-4 w-4 text-emerald-400" />
              418 active colleges only
            </div>
            <span className="hidden h-1 w-1 rounded-full bg-zinc-700 sm:block" />
            <span>About 3 minutes</span>
          </div>

          <div className="mt-12 w-full max-w-2xl border-t border-white/[0.07] pt-8 sm:mt-16">
            <p className="mb-3 flex items-center justify-center gap-2 text-xs font-medium text-zinc-500">
              <Search className="h-3.5 w-3.5" />
              Already have a college in mind?
            </p>
            <SearchBox />
          </div>
        </section>
      </Container>
    </div>
  );
}
