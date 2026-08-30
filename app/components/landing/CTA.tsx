import Link from "next/link";

export default function CTA() {
  return (
    <section className="bg-black px-6 py-24">

      <div className="mx-auto max-w-5xl rounded-3xl border border-white/10 bg-gradient-to-br from-violet-900/40 to-zinc-900 p-12 text-center">

        <h2 className="text-4xl font-bold text-white">
          Make smarter counselling decisions
        </h2>


        <p className="mx-auto mt-5 max-w-xl text-gray-300">
          See what you need to do next, what deadline rule applies and what happens if the step is missed.
        </p>


        <Link
          href="/counselling"
          className="mt-8 inline-flex rounded-2xl bg-violet-600 px-8 py-4 font-semibold text-white transition hover:bg-violet-500"
        >
          Open My Counselling
        </Link>


      </div>

    </section>
  );
}
