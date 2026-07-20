interface CollegeStatsProps {
  branches: number;
  highestCutoff: number;
  lowestCutoff: number;
}


export default function CollegeStats({
  branches,
  highestCutoff,
  lowestCutoff,
}: CollegeStatsProps) {

  const stats = [
    {
      label: "Branches",
      value: branches,
    },
    {
      label: "Highest Cutoff",
      value: highestCutoff,
    },
    {
      label: "Lowest Cutoff",
      value: lowestCutoff,
    },
  ];


  return (
    <section className="mt-8 grid gap-5 md:grid-cols-3">

      {stats.map((stat) => (

        <div
          key={stat.label}
          className="rounded-3xl border border-white/10 bg-zinc-900/40 p-6"
        >

          <p className="text-sm text-zinc-500">
            {stat.label}
          </p>

          <p className="mt-3 text-3xl font-bold text-white">
            {stat.value}
          </p>

        </div>

      ))}

    </section>
  );
}