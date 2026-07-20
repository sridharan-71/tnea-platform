import { notFound } from "next/navigation";

import {
  getCollegeByCode,
} from "@/lib/repositories/collegeRepository";

import {
  getCollegeCutoffs,
} from "@/lib/repositories/cutoffRepository";


import CollegeHeader from "@/components/college/CollegeHeader";
import CollegeStats from "@/components/college/CollegeStats";
import CutoffAnalytics from "@/components/college/CutoffAnalytics";
import AdmissionCard from "@/components/college/AdmissionCard";


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


  if (!college) {
    notFound();
  }


  const cutoffs = await getCollegeCutoffs(code);



  const branches = Array.from(
    new Set(
      cutoffs.map(
        (item) => item.branch_name
      )
    )
  );


  const cutoffValues = cutoffs
    .flatMap((item) => [
      item.oc,
      item.bc,
      item.mbc,
      item.sc,
      item.sca,
      item.st,
    ])
    .filter(
      (value): value is number =>
        value !== null
    );


  const highestCutoff =
    Math.max(...cutoffValues);


  const lowestCutoff =
    Math.min(...cutoffValues);



  return (

    <main className="min-h-screen bg-black px-6 py-20 text-white">


      <div className="mx-auto max-w-6xl">


        {/* Header */}

        <CollegeHeader
          college={college}
        />



        {/* Stats */}

        <CollegeStats
          branches={branches.length}
          highestCutoff={highestCutoff}
          lowestCutoff={lowestCutoff}
        />



        {/* Cutoff */}

        <CutoffAnalytics
          cutoffs={cutoffs}
        />



        {/* AI */}

        <AdmissionCard />


      </div>


    </main>

  );
}