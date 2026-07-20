export default function SearchLoading() {
  return (
    <div className="space-y-3 p-3">
      {Array.from({ length: 5 }).map((_, index) => (
        <div
          key={index}
          className="animate-pulse rounded-xl border border-white/5 bg-zinc-900/60 p-4"
        >
          <div className="h-4 w-2/3 rounded bg-zinc-800" />
          <div className="mt-3 h-3 w-1/3 rounded bg-zinc-800" />
        </div>
      ))}
    </div>
  );
}