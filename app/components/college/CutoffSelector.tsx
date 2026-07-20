"use client";

import { useState } from "react";

interface CutoffSelectorProps {
  branches: string[];
  onChange: (branch: string, category: string) => void;
}

const categories = [
  "OC",
  "BC",
  "MBC",
  "SC",
  "SCA",
  "ST",
];

export default function CutoffSelector({
  branches,
  onChange,
}: CutoffSelectorProps) {

  const [branch, setBranch] = useState(branches[0]);
  const [category, setCategory] = useState("OC");


  function updateBranch(value:string){
    setBranch(value);
    onChange(value, category);
  }


  function updateCategory(value:string){
    setCategory(value);
    onChange(branch, value);
  }


  return (
    <div className="grid gap-5 md:grid-cols-2">

      <div>
        <label className="text-sm text-zinc-400">
          Select Course
        </label>

        <select
          value={branch}
          onChange={(e)=>updateBranch(e.target.value)}
          className="mt-2 w-full rounded-xl border border-white/10 bg-zinc-900 p-4 text-white"
        >

          {branches.map((item)=>(
            <option key={item}>
              {item}
            </option>
          ))}

        </select>

      </div>



      <div>

        <label className="text-sm text-zinc-400">
          Select Category
        </label>

        <select
          value={category}
          onChange={(e)=>updateCategory(e.target.value)}
          className="mt-2 w-full rounded-xl border border-white/10 bg-zinc-900 p-4 text-white"
        >

          {categories.map((item)=>(
            <option key={item}>
              {item}
            </option>
          ))}

        </select>

      </div>

    </div>
  );
}