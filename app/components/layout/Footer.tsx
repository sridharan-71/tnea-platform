import Link from "next/link";
import { ExternalLink, Sparkles } from "lucide-react";

const productLinks = [
  { label: "My CampusAI", href: "/dashboard" },
  { label: "Recommendations", href: "/analyze" },
  { label: "My Counselling", href: "/counselling" },
  { label: "AI Counsellor", href: "/counsellor" },
];

export default function Footer() {
  return (
    <footer className="border-t border-white/10 bg-black px-4 py-12 sm:px-6 sm:py-16">
      <div className="mx-auto grid max-w-7xl gap-10 md:grid-cols-[1fr_auto_auto] md:items-start">
        <div>
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-600"><Sparkles className="h-5 w-5 text-white" /></div>
            <div><h3 className="font-bold text-white">CampusAI</h3><p className="text-xs text-zinc-600">TNEA 2026 decision support</p></div>
          </div>
          <p className="mt-4 max-w-md text-sm leading-6 text-zinc-500">Historical admission evidence and official-process guidance. CampusAI does not guarantee allotment or operate the official counselling portal.</p>
        </div>

        <div>
          <h4 className="text-xs font-semibold uppercase tracking-[0.16em] text-zinc-600">Product</h4>
          <div className="mt-4 flex flex-col gap-3">
            {productLinks.map((item) => <Link key={item.label} href={item.href} className="text-sm text-zinc-400 transition hover:text-white">{item.label}</Link>)}
          </div>
        </div>

        <div>
          <h4 className="text-xs font-semibold uppercase tracking-[0.16em] text-zinc-600">Official source</h4>
          <a href="https://www.tneaonline.org/" target="_blank" rel="noreferrer" className="mt-4 inline-flex items-center gap-2 text-sm text-zinc-400 transition hover:text-white">TNEA portal <ExternalLink className="h-3.5 w-3.5" /></a>
        </div>
      </div>
      <div className="mx-auto mt-10 max-w-7xl border-t border-white/10 pt-6 text-xs text-zinc-700">© {new Date().getFullYear()} CampusAI. Independent TNEA decision-support product.</div>
    </footer>
  );
}
