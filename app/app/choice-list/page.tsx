import type { Metadata } from "next";

import ChoiceListRater from "@/components/choice-filling/ChoiceListRater";

export const metadata: Metadata = {
  title: "Choice List Rater | CampusAI",
  description: "Audit a TNEA 2026 choice list for preference order, admission coverage and avoidable mistakes.",
};

export default function ChoiceListPage() {
  return (
    <main className="min-h-screen overflow-x-hidden bg-zinc-950 px-4 pb-28 pt-5 text-white sm:px-6 sm:py-10 lg:px-8">
      <ChoiceListRater />
    </main>
  );
}
