"use client";

import { useEffect, useRef, useState } from "react";
import { Search, Loader2 } from "lucide-react";

import { useCollegeSearch } from "@/hooks/useCollegeSearch";
import SearchDropdown from "./SearchDropdown";

export default function SearchBox() {
  const [query, setQuery] = useState("");
  const [activeIndex, setActiveIndex] = useState(-1);

  const { results, loading } = useCollegeSearch(query);

  const wrapperRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
  function handleClickOutside(event: MouseEvent) {
    if (
      wrapperRef.current &&
      !wrapperRef.current.contains(event.target as Node)
    ) {
      setActiveIndex(-1);
    }
  }

  document.addEventListener("mousedown", handleClickOutside);

  return () =>
    document.removeEventListener("mousedown", handleClickOutside);
}, []);

  function handleKeyDown(e: React.KeyboardEvent<HTMLInputElement>) {
    if (!results.length) return;

    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        setActiveIndex((prev) =>
          prev < results.length - 1 ? prev + 1 : 0
        );
        break;

      case "ArrowUp":
        e.preventDefault();
        setActiveIndex((prev) =>
          prev > 0 ? prev - 1 : results.length - 1
        );
        break;

      case "Escape":
        setActiveIndex(-1);
        setQuery("");
        break;
    }
  }

  return (
    <div
      ref={wrapperRef}
      className="relative z-50 w-full max-w-3xl"
    >
      <div className="relative">
        <Search className="absolute left-5 top-1/2 h-5 w-5 -translate-y-1/2 text-zinc-500" />

        <input
          type="text"
          value={query}
          placeholder="Search colleges by name or college code..."
          onChange={(e) => {
            setQuery(e.target.value);
            setActiveIndex(-1);
          }}
          onKeyDown={handleKeyDown}
          className="h-16 w-full rounded-2xl border border-white/10 bg-zinc-900/90 pl-14 pr-14 text-base text-white placeholder:text-zinc-500 outline-none transition-all focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/15"
        />

        {loading && (
          <Loader2 className="absolute right-5 top-1/2 h-5 w-5 -translate-y-1/2 animate-spin text-zinc-400" />
        )}
      </div>

      <SearchDropdown
        query={query}
        loading={loading}
        results={results}
        activeIndex={activeIndex}
      />
    </div>
  );
}
