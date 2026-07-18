import Navbar from "@/components/layout/Navbar";
import Hero from "@/components/home/Hero";
import SearchSection from "@/components/home/SearchSection";
import Features from "@/components/home/Features";

import { getFeaturedColleges } from "@/lib/repositories/collegeRepository";

export default async function Home() {
  try {
    const colleges = await getFeaturedColleges();

    // Temporary: verify repository works
    console.log(colleges);

    return (
      <>
        <Navbar />
        <Hero />
        <SearchSection />
        <Features />
      </>
    );
  } catch (error) {
    return (
      <>
        <Navbar />
        <main className="min-h-screen flex items-center justify-center">
          <h1 className="text-red-600 text-2xl">
            {error instanceof Error ? error.message : "Something went wrong"}
          </h1>
        </main>
      </>
    );
  }
}