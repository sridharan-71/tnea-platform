import type { CollegeSearchResult } from "@/hooks/useCollegeSearch";
import SearchLoading from "./SearchLoading";
import SearchEmpty from "./SearchEmpty";
import SearchResult from "./SearchResult";

interface SearchDropdownProps {
  query: string;
  loading: boolean;
  results: CollegeSearchResult[];
  activeIndex?: number;
}

export default function SearchDropdown({
  query,
  loading,
  results,
  activeIndex = -1,
}: SearchDropdownProps) {
  if (!query.trim()) return null;

  return (
    <div className="pointer-events-auto absolute left-0 right-0 top-[calc(100%+12px)] z-[100] overflow-hidden rounded-2xl border border-white/10 bg-zinc-900/95 shadow-2xl backdrop-blur-xl">
      {loading ? (
        <SearchLoading />
      ) : results.length === 0 ? (
        <SearchEmpty query={query} />
      ) : (
        <div className="max-h-[420px] overflow-y-auto py-2">
          {results.map((college, index) => (
            <SearchResult
              key={college.college_code}
              college={college}
              active={index === activeIndex}
            />
          ))}
        </div>
      )}
    </div>
  );
}