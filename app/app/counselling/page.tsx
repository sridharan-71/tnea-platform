import type { Metadata } from "next";
import CounsellingActionCentre from "@/components/counselling/CounsellingActionCentre";

export const metadata: Metadata = {
  title: "My Counselling | CampusAI",
  description: "Track your TNEA 2026 counselling stage, next action, official deadlines and reporting checklist.",
};

export default function CounsellingPage() {
  return (
    <main className="min-h-screen overflow-x-hidden bg-zinc-950 px-4 py-8 text-white sm:px-6 sm:py-12 lg:px-8">
      <CounsellingActionCentre />
    </main>
  );
}
