import { SearchX } from "lucide-react";

interface SearchEmptyProps {
  query: string;
}

export default function SearchEmpty({ query }: SearchEmptyProps) {
  return (
    <div className="flex flex-col items-center justify-center px-6 py-10 text-center">
      <div className="rounded-full border border-white/10 bg-white/5 p-3">
        <SearchX className="h-6 w-6 text-zinc-400" />
      </div>

      <h3 className="mt-4 text-base font-semibold text-white">
        No colleges found
      </h3>

      <p className="mt-2 max-w-sm text-sm text-zinc-400">
        We could not find any colleges matching{" "}
        <span className="font-medium text-zinc-300">&ldquo;{query}&rdquo;</span>.
        Try searching by college name or code.
      </p>
    </div>
  );
}
