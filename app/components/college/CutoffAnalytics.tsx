import {
  TrendingUp,
  GraduationCap,
} from "lucide-react";

interface Cutoff {
  year: number;
  branch_code: number;
  branch_name: string;
  oc: number | null;
  bc: number | null;
  mbc: number | null;
  sc: number | null;
  sca: number | null;
  st: number | null;
}

interface CutoffAnalyticsProps {
  cutoffs: Cutoff[];
}

const categories = [
  {
    key: "oc",
    label: "OC",
  },
  {
    key: "bc",
    label: "BC",
  },
  {
    key: "mbc",
    label: "MBC",
  },
  {
    key: "sc",
    label: "SC",
  },
  {
    key: "sca",
    label: "SCA",
  },
  {
    key: "st",
    label: "ST",
  },
] as const;


export default function CutoffAnalytics({
  cutoffs,
}: CutoffAnalyticsProps) {

  const uniqueBranches = Array.from(
    new Map(
      cutoffs.map((item) => [
        `${item.branch_code}-${item.branch_name}`,
        item,
      ])
    ).values()
  );


  return (
    <section className="mt-10">

      <div className="mb-6 flex items-center gap-3">

        <div className="rounded-xl bg-indigo-500/10 p-3">
          <TrendingUp className="h-6 w-6 text-indigo-400" />
        </div>

        <div>
          <h2 className="text-2xl font-bold text-white">
            2025 TNEA Cutoff Analysis
          </h2>

          <p className="text-sm text-zinc-400">
            Branch-wise cutoff scores by category
          </p>
        </div>

      </div>


      <div className="space-y-6">

        {uniqueBranches.map((branch) => (

          <div
            key={`${branch.branch_code}-${branch.branch_name}`}
            className="rounded-3xl border border-white/10 bg-zinc-900/40 p-6"
          >

            <div className="mb-5 flex items-center gap-3">

              <GraduationCap className="h-5 w-5 text-indigo-400" />

              <h3 className="font-semibold text-white">
                {branch.branch_name}
              </h3>

            </div>


            <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-6">

              {categories.map((category) => {

                const value = branch[category.key];

                return (
                  <div
                    key={category.key}
                    className="rounded-2xl border border-white/10 bg-black/30 p-4"
                  >

                    <p className="text-xs text-zinc-500">
                      {category.label}
                    </p>


                    <p className="mt-2 text-xl font-bold text-white">
                      {value ?? "-"}
                    </p>

                  </div>
                );

              })}

            </div>

          </div>

        ))}

      </div>

    </section>
  );
}