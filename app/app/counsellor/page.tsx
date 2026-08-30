import type { Metadata } from "next";
import AICounsellor from "@/components/counsellor/AICounsellor";

export const metadata: Metadata = {
  title: "AI Counsellor | CampusAI",
  description: "Personalized, evidence-grounded TNEA 2026 decision support.",
};

export default function CounsellorPage() {
  return (
    <main className="min-h-screen overflow-x-hidden bg-zinc-950 px-4 py-6 text-white sm:px-6 sm:py-10 lg:px-8">
      <AICounsellor />
    </main>
  );
}
