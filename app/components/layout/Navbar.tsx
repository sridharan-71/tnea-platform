"use client";

import Link from "next/link";
import { Menu, X, Sparkles } from "lucide-react";
import { useState } from "react";

const links = [
  {
    name: "Colleges",
    href: "/colleges",
  },
  {
    name: "Rank Predictor",
    href: "/predict",
  },
  {
    name: "Compare",
    href: "/compare",
  },
  {
    name: "AI Counsellor",
    href: "/counsellor",
  },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 border-b border-white/10 bg-black/70 backdrop-blur-xl">
      <nav className="mx-auto flex max-w-7xl items-center justify-between px-6 py-5">

        {/* Logo */}
        <Link
          href="/"
          className="flex items-center gap-3"
        >
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-600">
            <Sparkles className="h-5 w-5 text-white" />
          </div>

          <div>
            <div className="text-lg font-bold text-white">
              CampusAI
            </div>

            <div className="text-xs text-zinc-500">
              TNEA Intelligence
            </div>
          </div>
        </Link>


        {/* Desktop Links */}
        <div className="hidden items-center gap-8 md:flex">

          {links.map((link) => (
            <Link
              key={link.name}
              href={link.href}
              className="text-sm text-zinc-400 transition hover:text-white"
            >
              {link.name}
            </Link>
          ))}

        </div>


        {/* Desktop Actions */}
        <div className="hidden items-center gap-3 md:flex">

          <Link
            href="/login"
            className="rounded-xl px-4 py-2 text-sm text-zinc-300 transition hover:text-white"
          >
            Login
          </Link>


          <Link
            href="/signup"
            className="rounded-xl bg-white px-5 py-2 text-sm font-medium text-black transition hover:bg-zinc-200"
          >
            Get Started
          </Link>

        </div>


        {/* Mobile Button */}
        <button
          onClick={() => setOpen(!open)}
          className="rounded-xl border border-white/10 p-2 text-white md:hidden"
        >
          {open ? (
            <X className="h-6 w-6" />
          ) : (
            <Menu className="h-6 w-6" />
          )}
        </button>

      </nav>


      {/* Mobile Menu */}
      {open && (
        <div className="border-t border-white/10 bg-black px-6 py-6 md:hidden">

          <div className="flex flex-col gap-5">

            {links.map((link)=>(
              <Link
                key={link.name}
                href={link.href}
                onClick={()=>setOpen(false)}
                className="text-zinc-300"
              >
                {link.name}
              </Link>
            ))}


            <Link
              href="/login"
              className="text-zinc-300"
            >
              Login
            </Link>


            <Link
              href="/signup"
              className="rounded-xl bg-white px-5 py-3 text-center font-medium text-black"
            >
              Get Started
            </Link>

          </div>

        </div>
      )}

    </header>
  );
}