import { notFound } from "next/navigation";
import { getCollegeCutoffs } from "@/lib/repositories/cutoffRepository";
import { getCollegeByCode } from "@/lib/repositories/collegeRepository";

import CutoffExplorer from "@/components/college/CutoffExplorer";

import {
  MapPin,
  GraduationCap,
  Building2,
} from "lucide-react";


interface CollegePageProps {
  params: Promise<{
    collegeCode: string;
  }>;
}


export default async function CollegePage({
  params,
}: CollegePageProps) {


  const { collegeCode } = await params;


  const code = Number(collegeCode);


  if (Number.isNaN(code)) {
    notFound();
  }



  const college = await getCollegeByCode(code);

  const cutoffs = await getCollegeCutoffs(code);



  if (!college) {
    notFound();
  }



  return (

    <main className="min-h-screen bg-black px-6 py-20 text-white">


      <div className="mx-auto max-w-6xl">


        {/* College Header */}

        <section className="rounded-3xl border border-white/10 bg-zinc-900/50 p-10">


          <h1 className="text-4xl font-bold leading-tight">
            {college.college_name}
          </h1>



          <div className="mt-6 flex flex-wrap gap-6 text-zinc-400">


            <div className="flex items-center gap-2">
              <MapPin className="h-5 w-5 text-indigo-400" />

              {college.district}

            </div>



            <div className="flex items-center gap-2">

              <GraduationCap className="h-5 w-5 text-indigo-400" />

              {college.college_type}

            </div>



            <div className="flex items-center gap-2">

              <Building2 className="h-5 w-5 text-indigo-400" />

              Code: {college.college_code}

            </div>



          </div>


        </section>





        {/* Cutoff Explorer */}

        <CutoffExplorer
          cutoffs={cutoffs}
        />





        {/* Future Features */}

        <section className="mt-12 grid gap-6 md:grid-cols-2">


          <div className="rounded-3xl border border-white/10 bg-zinc-900/40 p-6">


            <h3 className="text-xl font-semibold">
              Admission Chances
            </h3>


            <p className="mt-2 text-zinc-400">
              AI prediction based on your marks,
              category and previous year trends.
            </p>


          </div>





          <div className="rounded-3xl border border-white/10 bg-zinc-900/40 p-6">


            <h3 className="text-xl font-semibold">
              Compare College
            </h3>


            <p className="mt-2 text-zinc-400">
              Compare this college with other
              engineering colleges.
            </p>


          </div>



        </section>



      </div>


    </main>

  );
}