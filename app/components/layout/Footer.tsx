import Link from "next/link";
import { Sparkles } from "lucide-react";

const sections = [
  {
    title: "Product",
    links: [
      "Search Colleges",
      "Rank Predictor",
      "College Compare",
      "AI Counsellor",
    ],
  },
  {
    title: "Company",
    links: [
      "About",
      "Contact",
      "Careers",
    ],
  },
  {
    title: "Legal",
    links: [
      "Privacy Policy",
      "Terms",
    ],
  },
];

export default function Footer() {
  return (
    <footer className="border-t border-white/10 bg-black px-6 py-16">

      <div className="mx-auto grid max-w-7xl gap-12 md:grid-cols-4">


        <div>

          <div className="flex items-center gap-3">

            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-600">
              <Sparkles className="h-5 w-5 text-white"/>
            </div>

            <div>
              <h3 className="font-bold text-white">
                CampusAI
              </h3>

              <p className="text-xs text-zinc-500">
                TNEA Intelligence
              </p>
            </div>

          </div>


          <p className="mt-5 max-w-xs text-sm text-zinc-400">
            AI-powered engineering counselling platform helping students
            make smarter admission decisions.
          </p>

        </div>


        {sections.map((section)=>(

          <div key={section.title}>

            <h4 className="font-semibold text-white">
              {section.title}
            </h4>


            <div className="mt-5 flex flex-col gap-3">

              {section.links.map((item)=>(

                <Link
                  key={item}
                  href="#"
                  className="text-sm text-zinc-400 transition hover:text-white"
                >
                  {item}
                </Link>

              ))}

            </div>

          </div>

        ))}

      </div>


      <div className="mx-auto mt-12 max-w-7xl border-t border-white/10 pt-6 text-sm text-zinc-500">
        © {new Date().getFullYear()} CampusAI. All rights reserved.
      </div>

    </footer>
  );
}