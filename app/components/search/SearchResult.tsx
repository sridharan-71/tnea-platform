import Link from "next/link";
import { GraduationCap, MapPin, ArrowUpRight } from "lucide-react";
import type { CollegeSearchResult } from "@/hooks/useCollegeSearch";

interface SearchResultProps {
  college: CollegeSearchResult;
  active?: boolean;
}

export default function SearchResult({
  college,
  active = false,
}: SearchResultProps) {
  return (
    <Link
      href={`/college/${college.college_code}`}
      className={`group flex items-center justify-between px-5 py-4 transition-colors ${
        active
          ? "bg-indigo-500/10"
          : "hover:bg-white/5"
      }`}
    >
      <div className="min-w-0 flex-1">
        <h3 className="truncate text-sm font-semibold text-white">
          {college.college_name}
        </h3>

        <div className="mt-2 flex flex-wrap gap-4 text-xs text-zinc-400">
          <span className="flex items-center gap-1">
            <MapPin className="h-3.5 w-3.5" />
            {college.district}
          </span>

          <span className="flex items-center gap-1">
            <GraduationCap className="h-3.5 w-3.5" />
            {college.college_type}
          </span>

          <span className="font-mono text-zinc-500">
            #{college.college_code}
          </span>
        </div>
      </div>

      <ArrowUpRight className="ml-4 h-4 w-4 text-zinc-500 transition group-hover:text-white" />
    </Link>
  );
}