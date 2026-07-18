export default function Navbar() {
  return (
    <header className="sticky top-0 z-50 border-b border-white/10 bg-black/70 backdrop-blur-xl">
      <div className="mx-auto flex h-20 max-w-7xl items-center justify-between px-8">

        <div className="flex items-center gap-3">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-violet-600 font-bold text-white">
            T
          </div>

          <div>
            <h1 className="text-lg font-bold text-white">
              CampusAI
            </h1>
            <p className="text-xs text-gray-400">
              TNEA Counselling
            </p>
          </div>
        </div>

        <nav className="hidden gap-8 text-gray-300 md:flex">
          <a href="#" className="hover:text-white">Home</a>
          <a href="#" className="hover:text-white">Colleges</a>
          <a href="#" className="hover:text-white">Cutoffs</a>
          <a href="#" className="hover:text-white">Compare</a>
        </nav>

        <button className="rounded-xl bg-violet-600 px-5 py-2 font-semibold text-white transition hover:bg-violet-500">
          Get Started
        </button>

      </div>
    </header>
  );
}