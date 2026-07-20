import {
  MapPin,
  GraduationCap,
  Building2,
} from "lucide-react";

interface CollegeHeaderProps {
  college: {
    college_name: string;
    district: string;
    college_type: string;
    college_code: number;
  };
}


export default function CollegeHeader({
  college,
}: CollegeHeaderProps) {

  return (
    <section className="rounded-3xl border border-white/10 bg-zinc-900/50 p-10">

      <div className="flex flex-col gap-6">

        <div>
          <h1 className="text-4xl font-bold tracking-tight text-white">
            {college.college_name}
          </h1>

          <p className="mt-3 max-w-3xl text-zinc-400">
            Official TNEA cutoff data, admission prediction,
            and AI-powered counselling insights.
          </p>
        </div>


        <div className="flex flex-wrap gap-6 text-sm text-zinc-400">


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


        <div className="flex flex-wrap gap-4">

          <button className="rounded-xl bg-indigo-500 px-6 py-3 font-medium text-white transition hover:bg-indigo-400">
            Predict My Chance
          </button>


          <button className="rounded-xl border border-white/10 bg-white/5 px-6 py-3 font-medium text-white transition hover:bg-white/10">
            Compare College
          </button>

        </div>


      </div>

    </section>
  );
}