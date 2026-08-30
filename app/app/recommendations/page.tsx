import type { Metadata } from "next";

import RecommendationsClient from "@/components/recommendations/RecommendationsClient";

export const metadata: Metadata = {
  title: "College Recommendations | CampusAI",
  description:
    "Personalized TNEA college recommendations based on cutoff, rank, community, and preferred districts.",
};

export default function RecommendationsPage() {
  return (
    <main className="min-h-screen bg-zinc-950 px-4 pb-10 pt-5 text-white sm:px-6 sm:py-12 lg:px-8">
      <RecommendationsClient />
    </main>
  );
}
