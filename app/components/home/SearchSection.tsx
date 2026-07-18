"use client";

import { useState } from "react";

export default function SearchSection() {
  const [cutoff, setCutoff] = useState("");
  const [community, setCommunity] = useState("");
  const [rank, setRank] = useState("");
  const [course, setCourse] = useState("");

  function handleSubmit() {
    console.log({
      cutoff,
      community,
      rank,
      course,
    });
  }

  return (
    <section className="bg-zinc-900 py-20 text-white">
      <div className="mx-auto max-w-5xl px-6">

        <h2 className="text-center text-4xl font-bold">
          Find Your Best College
        </h2>

        <p className="mt-4 text-center text-gray-400">
          Enter your details and let AI recommend the best colleges for you.
        </p>

        <div className="mt-12 grid gap-6 md:grid-cols-2">

          <input
            value={cutoff}
            onChange={(e) => setCutoff(e.target.value)}
            placeholder="Cutoff (e.g. 166)"
            className="rounded-xl border border-white/10 bg-zinc-800 p-4"
          />

          <select
            value={community}
            onChange={(e) => setCommunity(e.target.value)}
            className="rounded-xl border border-white/10 bg-zinc-800 p-4"
          >
            <option value="">Community</option>
            <option>OC</option>
            <option>BC</option>
            <option>MBC</option>
            <option>SC</option>
            <option>ST</option>
          </select>

          <input
            value={rank}
            onChange={(e) => setRank(e.target.value)}
            placeholder="General Rank"
            className="rounded-xl border border-white/10 bg-zinc-800 p-4"
          />

          <input
            value={course}
            onChange={(e) => setCourse(e.target.value)}
            placeholder="Preferred Course (CSE, IT...)"
            className="rounded-xl border border-white/10 bg-zinc-800 p-4"
          />

        </div>

        <div className="mt-8 text-center">
          <button
            onClick={handleSubmit}
            className="rounded-xl bg-violet-600 px-8 py-4 font-semibold hover:bg-violet-500"
          >
            Get AI Recommendation
          </button>
        </div>

      </div>
    </section>
  );
}