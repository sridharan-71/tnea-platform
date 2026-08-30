"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { Check, ChevronDown, Search, X } from "lucide-react";
import { TAMIL_NADU_DISTRICTS } from "@/lib/types/student";

interface Props { value: string[]; error?: string; onChange: (value: string[]) => void }

const SELECTABLE_DISTRICTS = TAMIL_NADU_DISTRICTS.filter((district) => district !== "Anywhere in Tamil Nadu");

export default function DistrictSelector({ value, error, onChange }: Props) {
  const [query, setQuery] = useState("");
  const [isOpen, setIsOpen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);
  const filteredDistricts = useMemo(() => {
    const normalizedQuery = query.trim().toLowerCase();
    return normalizedQuery
      ? SELECTABLE_DISTRICTS.filter((district) => district.toLowerCase().includes(normalizedQuery))
      : SELECTABLE_DISTRICTS;
  }, [query]);

  useEffect(() => {
    function handlePointerDown(event: PointerEvent) {
      if (!containerRef.current?.contains(event.target as Node)) {
        setIsOpen(false);
        setQuery("");
      }
    }
    function handleKeyDown(event: KeyboardEvent) {
      if (event.key === "Escape") {
        setIsOpen(false);
        setQuery("");
      }
    }
    document.addEventListener("pointerdown", handlePointerDown);
    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("pointerdown", handlePointerDown);
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, []);

  function toggleDistrict(district: string) {
    onChange(value.includes(district)
      ? value.filter((item) => item !== district)
      : [...value, district]);
  }

  return <div ref={containerRef}>
    <span className="mb-2 block text-sm font-medium text-zinc-200">Preferred districts</span>
    {value.length > 0 && <div className="mb-3 flex flex-wrap gap-2">
      {value.map((district) => <span key={district} className="inline-flex items-center gap-1.5 rounded-lg border border-indigo-400/30 bg-indigo-500/10 px-2.5 py-1.5 text-xs text-indigo-200">
        {district}<button type="button" onClick={() => toggleDistrict(district)} aria-label={`Remove ${district}`} className="rounded p-0.5 hover:bg-white/10"><X className="h-3 w-3" /></button>
      </span>)}
    </div>}
    <button type="button" onClick={() => setIsOpen((open) => !open)} aria-expanded={isOpen}
      className={`flex h-11 w-full items-center justify-between rounded-xl border bg-zinc-950 px-4 text-sm outline-none ${error ? "border-red-500/60" : "border-white/10 hover:border-white/20"}`}>
      <span className={value.length ? "text-zinc-200" : "text-zinc-600"}>{value.length ? `${value.length} district${value.length === 1 ? "" : "s"} selected` : "Choose districts"}</span>
      <ChevronDown className={`h-4 w-4 text-zinc-500 transition ${isOpen ? "rotate-180" : ""}`} />
    </button>
    {isOpen && <div className="mt-3 rounded-xl border border-white/10 bg-zinc-950 p-2 shadow-2xl shadow-black/40">
      <div className="relative">
        <Search className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-500" />
        <input autoFocus type="search" value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search districts"
          className="h-10 w-full rounded-lg border border-white/10 bg-black/30 pl-9 pr-3 text-sm text-white outline-none placeholder:text-zinc-600 focus:border-indigo-400/60" />
      </div>
      <div className="mt-2 grid max-h-64 gap-1 overflow-y-auto sm:grid-cols-2">
      {filteredDistricts.map((district) => {
        const selected = value.includes(district);
        return <button key={district} type="button" onClick={() => toggleDistrict(district)} aria-pressed={selected}
          className={`flex items-center justify-between rounded-lg px-3 py-2.5 text-left text-sm transition ${selected ? "bg-indigo-500/15 text-indigo-200" : "text-zinc-400 hover:bg-white/5 hover:text-white"}`}>
          {district}{selected && <Check className="h-4 w-4" />}
        </button>;
      })}
      {filteredDistricts.length === 0 && <p className="col-span-full px-3 py-6 text-center text-sm text-zinc-500">No districts found.</p>}
      </div>
    </div>}
    {error ? <p className="mt-2 text-sm text-red-400">{error}</p> :
      <p className="mt-2 text-xs text-zinc-500">Choose every district you would genuinely accept.</p>}
  </div>;
}
