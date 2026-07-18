"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Search } from "lucide-react";

interface CollegeSearchResult {
  college_code: number;
  college_name: string;
  district: string;
  college_type: string;
}

export default function SearchSection() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<CollegeSearchResult[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const timeout = setTimeout(async () => {
      if (query.trim() === "") {
        setResults([]);
        return;
      }

      try {
        setLoading(true);

        const response = await fetch(
          `/api/colleges/search?q=${encodeURIComponent(query)}`
        );

        const data = await response.json();

        if (data.success) {
          setResults(data.data);
        } else {
          setResults([]);
        }
      } catch (err) {
        console.error(err);
        setResults([]);
      } finally {
        setLoading(false);
      }
    }, 300);

    return () => clearTimeout(timeout);
  }, [query]);

  return (
    <section className="bg-white py-16">
      <div className="mx-auto max-w-4xl px-6">

        <h2 className="mb-8 text-center text-4xl font-bold text-gray-900">
          Search Colleges
        </h2>

        <div className="relative">
          <Search className="absolute left-4 top-1/2 h-5 w-5 -translate-y-1/2 text-gray-400" />

          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search PSG, CIT, Anna University..."
            className="w-full rounded-2xl border border-gray-300 bg-white py-4 pl-12 pr-4 text-lg text-black placeholder:text-gray-500 caret-black shadow-sm outline-none focus:border-blue-500"
          />

          {loading && (
            <div className="absolute right-4 top-1/2 -translate-y-1/2">
              <div className="h-6 w-6 animate-spin rounded-full border-2 border-blue-600 border-t-transparent" />
            </div>
          )}
        </div>

        {results.length > 0 && (
          <div className="mt-4 overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-xl">
            {results.map((college) => (
              <Link
                key={college.college_code}
                href={`/college/${college.college_code}`}
                className="block border-b p-5 transition hover:bg-gray-50 last:border-b-0"
              >
                <h3 className="font-semibold text-gray-900">
                  {college.college_name}
                </h3>

                <p className="mt-1 text-sm text-gray-600">
                  {college.district} • {college.college_type}
                </p>
              </Link>
            ))}
          </div>
        )}

        {!loading && query !== "" && results.length === 0 && (
          <div className="mt-4 rounded-2xl border bg-white p-6 text-center text-gray-500">
            No colleges found.
          </div>
        )}
      </div>
    </section>
  );
}