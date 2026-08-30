"use client";

import Link from "next/link";
import { Bot, CalendarCheck2, ClipboardCheck, Home, LayoutDashboard, LogIn, LogOut, Sparkles, Target, UserRound } from "lucide-react";
import { usePathname, useRouter } from "next/navigation";
import { useAuth } from "@/components/auth/AuthProvider";

const links = [
  { name: "My CampusAI", href: "/dashboard", icon: LayoutDashboard, matches: ["/dashboard"] },
  { name: "Recommendations", href: "/analyze", icon: Target, matches: ["/analyze", "/recommendations"] },
  { name: "Choice List Rater", href: "/choice-list", icon: ClipboardCheck, matches: ["/choice-list"] },
  { name: "My Counselling", href: "/counselling", icon: CalendarCheck2, matches: ["/counselling"] },
  { name: "AI Counsellor", href: "/counsellor", icon: Bot, matches: ["/counsellor"] },
];

const mobileLinks = [
  { name: "Home", href: "/", icon: Home, matches: ["/"] },
  { name: "Colleges", href: "/analyze", icon: Target, matches: ["/analyze", "/recommendations"] },
  { name: "Rate list", href: "/choice-list", icon: ClipboardCheck, matches: ["/choice-list"] },
  { name: "My plan", href: "/counselling", icon: CalendarCheck2, matches: ["/counselling"] },
  { name: "Ask AI", href: "/counsellor", icon: Bot, matches: ["/counsellor"] },
];

export default function Navbar() {
  const pathname = usePathname();
  const router = useRouter();
  const { user, loading, displayName, signOut } = useAuth();

  return (
    <>
      <header className="sticky top-0 z-50 border-b border-white/10 bg-black/80 backdrop-blur-xl">
        <nav className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3.5 sm:px-6 md:py-4">
          <Link href="/" className="flex items-center gap-2.5" aria-label="CampusAI home">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-indigo-500 to-violet-700 shadow-lg shadow-indigo-950/50 sm:h-10 sm:w-10">
              <Sparkles className="h-5 w-5 text-white" />
            </div>
            <div>
              <div className="text-[15px] font-bold text-white sm:text-lg">CampusAI</div>
              <div className="text-[10px] uppercase tracking-[0.15em] text-zinc-600 sm:text-xs sm:normal-case sm:tracking-normal">TNEA 2026</div>
            </div>
          </Link>

          <div className="hidden items-center gap-1 lg:flex">
            {links.map((link) => {
              const active = link.matches.some((prefix) => pathname.startsWith(prefix));
              return (
                <Link key={link.name} href={link.href} className={`rounded-xl px-4 py-2.5 text-sm transition ${active ? "bg-white/10 text-white" : "text-zinc-500 hover:bg-white/[0.05] hover:text-zinc-200"}`}>
                  {link.name}
                </Link>
              );
            })}
          </div>

          <div className="flex items-center gap-2">
            {!loading && !user && <>
              <Link href="/login" className="hidden min-h-10 items-center gap-2 rounded-xl px-3.5 text-sm text-zinc-400 transition hover:bg-white/[0.05] hover:text-white sm:inline-flex"><LogIn className="h-4 w-4" /> Sign in</Link>
              <Link href="/login" className="inline-flex min-h-10 items-center rounded-xl border border-white/10 bg-white/[0.04] px-3.5 text-sm font-medium text-zinc-200 transition hover:bg-white/[0.08] sm:hidden">Sign in</Link>
              <Link href="/signup" className="hidden min-h-10 items-center rounded-xl bg-white px-3.5 text-sm font-semibold text-black transition hover:bg-indigo-100 sm:inline-flex">Create account</Link>
            </>}
            {!loading && user && <details className="group relative">
              <summary className="flex min-h-10 cursor-pointer list-none items-center gap-2 rounded-xl border border-white/10 bg-white/[0.035] px-2.5 text-sm text-zinc-300 transition hover:border-white/20">
                <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-indigo-500/15 text-indigo-200"><UserRound className="h-4 w-4" /></span>
                <span className="hidden max-w-28 truncate sm:inline">{displayName}</span>
              </summary>
              <div className="absolute right-0 mt-2 w-64 overflow-hidden rounded-2xl border border-white/10 bg-zinc-950 p-2 shadow-2xl shadow-black/70">
                <div className="border-b border-white/[0.07] px-3 py-3">
                  <p className="truncate text-sm font-medium text-white">{displayName}</p>
                  <p className="mt-1 truncate text-xs text-zinc-600">{user.email}</p>
                </div>
                <Link href="/dashboard" className="mt-1 flex min-h-10 items-center gap-3 rounded-xl px-3 text-sm text-zinc-300 hover:bg-white/[0.05]"><LayoutDashboard className="h-4 w-4 text-indigo-300" /> My CampusAI</Link>
                <button type="button" onClick={async () => { await signOut(); router.push("/"); router.refresh(); }} className="flex min-h-10 w-full items-center gap-3 rounded-xl px-3 text-left text-sm text-zinc-400 hover:bg-white/[0.05] hover:text-white"><LogOut className="h-4 w-4" /> Sign out</button>
              </div>
            </details>}
          </div>
        </nav>
      </header>

      <nav aria-label="Primary navigation" className="fixed inset-x-0 bottom-0 z-50 border-t border-white/10 bg-black/90 px-2 pb-[max(0.5rem,env(safe-area-inset-bottom))] pt-2 backdrop-blur-xl md:hidden">
        <div className="mx-auto grid max-w-md grid-cols-5 gap-1">
          {mobileLinks.map((link) => {
            const Icon = link.icon;
            const active = link.href === "/"
              ? pathname === "/"
              : link.matches.some((prefix) => pathname.startsWith(prefix));
            return (
              <Link key={link.name} href={link.href} aria-current={active ? "page" : undefined} className={`flex min-h-14 flex-col items-center justify-center gap-1 rounded-xl px-2 text-[10px] font-medium transition ${active ? "bg-indigo-500/15 text-indigo-100" : "text-zinc-500"}`}>
                <Icon className={`h-5 w-5 ${active ? "stroke-[2.4]" : ""}`} />
                {link.name}
              </Link>
            );
          })}
        </div>
      </nav>
    </>
  );
}
