import Navbar from "@/components/layout/Navbar";
import Hero from "@/components/home/Hero";
import SearchHero from "@/components/home/SearchHero";

export default function Home() {
  return (
    <>
      <Navbar />
      <Hero />

      <div className="bg-red-500 text-white p-10 text-center text-4xl">
        SEARCH HERO STARTS HERE
      </div>

      <SearchHero />
    </>
  );
}