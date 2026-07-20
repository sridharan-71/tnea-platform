"use client";

import { useMemo, useState } from "react";

interface Cutoff {
  year: number;
  branch_code: string;
  branch_name: string;

  oc: number | null;
  bc: number | null;
  mbc: number | null;
  sc: number | null;
  sca: number | null;
  st: number | null;
}

interface CutoffExplorerProps {
  cutoffs: Cutoff[];
}


const categories = [
  { key: "oc", label: "OC" },
  { key: "bc", label: "BC" },
  { key: "mbc", label: "MBC" },
  { key: "sc", label: "SC" },
  { key: "sca", label: "SCA" },
  { key: "st", label: "ST" },
];


export default function CutoffExplorer({
  cutoffs,
}: CutoffExplorerProps) {


  const [selectedCategories,setSelectedCategories] =
    useState<string[]>(["oc"]);


  const [selectedBranches,setSelectedBranches] =
    useState<string[]>([]);



  /*
    Remove duplicate courses safely
  */

  const branches = useMemo(()=>{

    const map = new Map<string,Cutoff>();

    cutoffs.forEach((item)=>{

      const id =
        `${item.branch_code}-${item.branch_name}`;

      if(!map.has(id)){
        map.set(id,item);
      }

    });


    return Array.from(map.values());

  },[cutoffs]);





  function toggleCategory(category:string){

    setSelectedCategories(prev=>{

      if(prev.includes(category)){

        if(prev.length===1)
          return prev;

        return prev.filter(
          item=>item!==category
        );

      }


      return [
        ...prev,
        category
      ];

    });

  }




  function toggleBranch(branch:string){

    setSelectedBranches(prev=>{

      if(prev.includes(branch)){

        return prev.filter(
          item=>item!==branch
        );

      }


      return [
        ...prev,
        branch
      ];

    });

  }




  function selectAllCourses(){

    setSelectedBranches(
      branches.map(
        item =>
        `${item.branch_code}-${item.branch_name}`
      )
    );

  }




  function clearCourses(){

    setSelectedBranches([]);

  }





  const filtered = useMemo(()=>{

    if(selectedBranches.length===0)
      return cutoffs;


    return cutoffs.filter(item=>

      selectedBranches.includes(
        `${item.branch_code}-${item.branch_name}`
      )

    );


  },[
    cutoffs,
    selectedBranches
  ]);





  return (

<div className="space-y-8">



{/* CATEGORY */}

<div className="rounded-3xl border border-white/10 bg-zinc-900/50 p-6">


<h2 className="text-xl font-semibold mb-4">
Choose Category
</h2>


<div className="flex flex-wrap gap-3">


{
categories.map(cat=>(

<button

key={cat.key}

onClick={()=>
toggleCategory(cat.key)
}

className={`
px-5 py-2 rounded-xl border transition
${
selectedCategories.includes(cat.key)

?
"bg-indigo-600 border-indigo-500"

:

"bg-zinc-800 border-white/10"
}

`}

>

{cat.label}

</button>

))

}


</div>


</div>





{/* COURSES */}

<div className="rounded-3xl border border-white/10 bg-zinc-900/50 p-6">


<div className="flex justify-between mb-4">


<h2 className="text-xl font-semibold">
Choose Courses
</h2>


<div className="space-x-2">


<button
onClick={selectAllCourses}
className="px-3 py-2 bg-indigo-600 rounded-lg text-sm"
>
All
</button>


<button
onClick={clearCourses}
className="px-3 py-2 bg-zinc-700 rounded-lg text-sm"
>
Clear
</button>


</div>


</div>




<div className="grid md:grid-cols-3 gap-3">


{
branches.map((branch,index)=>{

const id =
`${branch.branch_code}-${branch.branch_name}`;


return (

<button

key={`${id}-${index}`}

onClick={()=>
toggleBranch(id)
}

className={`
text-left p-4 rounded-xl border transition

${
selectedBranches.includes(id)

?

"bg-indigo-600 border-indigo-500"

:

"bg-zinc-800 border-white/10"
}

`}

>


{branch.branch_name}


</button>


);


})

}


</div>


</div>






{/* TABLE */}


<div className="rounded-3xl border border-white/10 overflow-hidden">


<div className="p-6 bg-zinc-900">


<h2 className="text-2xl font-bold">
2025 TNEA Cutoff Analysis
</h2>


<p className="text-zinc-400">
Compare courses and categories
</p>


</div>




<div className="overflow-x-auto">


<table className="w-full">


<thead className="bg-zinc-800">


<tr>

<th className="p-4 text-left">
Course
</th>


{
selectedCategories.map(cat=>(

<th
key={cat}
className="p-4"
>

{cat.toUpperCase()}

</th>

))

}


</tr>


</thead>



<tbody>


{
filtered.map((item,index)=>(


<tr

key={`${item.year}-${item.branch_code}-${index}`}

className="border-t border-white/10"

>


<td className="p-4 font-medium">
{item.branch_name}
</td>



{
selectedCategories.map(cat=>(


<td

key={`${index}-${cat}`}

className="p-4 text-center"

>

{
item[
cat as keyof Cutoff
] ?? "-"
}


</td>


))

}


</tr>


))

}



</tbody>


</table>


</div>



</div>




</div>

  );
}