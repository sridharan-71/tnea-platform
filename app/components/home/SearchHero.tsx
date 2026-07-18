"use client";

import { Search, MapPin, GraduationCap } from "lucide-react";
import Link from "next/link";
import { useEffect, useState } from "react";

interface CollegeSearchResult {
  college_code: number;
  college_name: string;
  district: string;
  college_type: string;
}

export default function SearchHero() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<CollegeSearchResult[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const timer = setTimeout(async () => {
      if (query.trim() === "") {
        setResults([]);
        return;
      }

      try {
        setLoading(true);

        const res = await fetch(
          `/api/colleges/search?q=${encodeURIComponent(query)}`
        );

        const json = await res.json();

        if (json.success) {
          setResults(json.data);
        } else {
          setResults([]);
        }
      } catch {
        setResults([]);
      } finally {
        setLoading(false);
      }
    }, 250);

    return () => clearTimeout(timer);
  }, [query]);

  return (
    <section className="bg-black px-6 pb-24">
      <div className="mx-auto max-w-4xl">

        <div className="relative">

          <Search className="absolute left-6 top-6 h-6 w-6 text-gray-400" />

          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search colleges (PSG, CIT, Anna University...)"
            className="w-full rounded-3xl border border-white/10 bg-zinc-900 py-6 pl-16 pr-6 text-lg text-white placeholder:text-gray-500 outline-none transition focus:border-violet-500 focus:ring-2 focus:ring-violet-500/30"
          />

          {loading && (
            <div className="absolute right-6 top-6 h-6 w-6 animate-spin rounded-full border-2 border-violet-500 border-t-transparent" />
          )}

        </div>

        {results.length > 0 && (
          <div className="mt-4 overflow-hidden rounded-3xl border border-white/10 bg-zinc-900">

            {results.map((college) => (
              <Link
                key={college.college_code}
                href={`/college/${college.college_code}`}
                className="flex items-center justify-between border-b border-white/5 px-6 py-5 transition hover:bg-zinc-800 last:border-none"
              >
                <div>
                  <div className="font-semibold text-white">
                    {college.college_name}
                  </div>

                  <div className="mt-2 flex items-center gap-4 text-sm text-gray-400">

                    <div className="flex items-center gap-1">
                      <MapPin size={14} />
                      {college.district}
                    </div>

                    <div className="flex items-center gap-1">
                      <GraduationCap size={14} />
                      {college.college_type}
                    </div>

                  </div>
                </div>

                <div className="rounded-xl bg-violet-600 px-4 py-2 text-sm font-medium">
                  View
                </div>
              </Link>
            ))}

          </div>
        )}

        {!loading &&
          query.length > 0 &&
          results.length === 0 && (
            <div className="mt-4 rounded-2xl border border-white/10 bg-zinc-900 p-6 text-center text-gray-400">
              No colleges found.
            </div>
          )}

      </div>
    </section>
  );
}