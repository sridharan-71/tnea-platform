
import Hero from "@/components/landing/Hero";
import Stats from "@/components/landing/Stats";
import FeatureGrid from "@/components/landing/FeatureGrid";

export default function Home() {
  return (
    <main className="bg-[#070708] text-white">
      <Hero />
      <Stats />
      <FeatureGrid />
    </main>
  );
}
