import Link from "next/link";

export default function CTA() {
  return (
    <section className="bg-black px-6 py-24">

      <div className="mx-auto max-w-5xl rounded-3xl border border-white/10 bg-gradient-to-br from-violet-900/40 to-zinc-900 p-12 text-center">

        <h2 className="text-4xl font-bold text-white">
          Make smarter counselling decisions
        </h2>


        <p className="mx-auto mt-5 max-w-xl text-gray-300">
          Use AI-powered insights to find colleges where you have the
          best chance of admission.
        </p>


        <Link
          href="/search"
          className="mt-8 inline-flex rounded-2xl bg-violet-600 px-8 py-4 font-semibold text-white transition hover:bg-violet-500"
        >
          Explore Colleges
        </Link>


      </div>

    </section>
  );
}