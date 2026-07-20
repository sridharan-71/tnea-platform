"use client";

import { useMemo, useState } from "react";
import {
  ChevronDown,
  ChevronUp,
  TrendingUp,
  TrendingDown,
  Minus,
} from "lucide-react";


interface Cutoff {

  year:number;

  branch_code:string;

  branch_name:string;

  oc:number|null;
  bc:number|null;
  bcm:number|null;
  mbc:number|null;
  sc:number|null;
  sca:number|null;
  st:number|null;

}


interface Props {

  cutoffs:Cutoff[];

}


type Category =
  | "oc"
  | "bc"
  | "bcm"
  | "mbc"
  | "sc"
  | "sca"
  | "st";



const categories:{
 key:Category;
 label:string;
}[]=[

{
 key:"oc",
 label:"OC"
},

{
 key:"bc",
 label:"BC"
},

{
 key:"bcm",
 label:"BCM"
},

{
 key:"mbc",
 label:"MBC"
},

{
 key:"sc",
 label:"SC"
},

{
 key:"sca",
 label:"SCA"
},

{
 key:"st",
 label:"ST"
}

];




interface BranchTrend {

 branch_code:string;

 branch_name:string;

 history:{
  year:number;
  value:number|null;
 }[];

 latest:number|null;

 change:number|null;

 trend:
 "up"
 |"down"
 |"stable"
 |"none";

}





export default function CutoffExplorer({
 cutoffs
}:Props){



const [category,setCategory]=useState<Category>("oc");


const [expanded,setExpanded]=useState<string|null>(null);





const branches = useMemo(()=>{


const map = new Map<string,BranchTrend>();


cutoffs.forEach(item=>{


const key=item.branch_code;



if(!map.has(key)){


map.set(
key,
{
branch_code:item.branch_code,

branch_name:item.branch_name,

history:[],

latest:null,

change:null,

trend:"none"

}

);


}



const branch=map.get(key)!;


branch.history.push({

year:item.year,

value:item[category]

});



});



return Array.from(map.values())
.map(branch=>{


const sorted =
branch.history.sort(
(a,b)=>a.year-b.year
);



const latest =
sorted.at(-1)?.value ?? null;


const previous =
sorted.at(-2)?.value ?? null;



let change:null|number=null;

let trend:
"up"|"down"|"stable"|"none"
="none";



if(
latest!==null &&
previous!==null
){


change =
Number(
(
latest-previous
).toFixed(2)
);



if(change>0)
trend="up";


else if(change<0)
trend="down";


else
trend="stable";


}



return {

...branch,

history:sorted,

latest,

change,

trend

};


})

.sort(
(a,b)=>
(b.latest ?? 0)
-
(a.latest ?? 0)
);



},[
cutoffs,
category
]);






return (

<div className="mt-10 space-y-8">



{/* CATEGORY */}

<section
className="
rounded-3xl
border
border-white/10
bg-zinc-900/50
p-6
"
>


<h2 className="text-xl font-semibold mb-5">

Community Category

</h2>



<div className="flex flex-wrap gap-3">


{
categories.map(cat=>(


<button

key={cat.key}

onClick={()=>setCategory(cat.key)}

className={`
px-5 py-2 rounded-xl border
transition

${
category===cat.key

?

"bg-indigo-600 border-indigo-500"

:

"bg-zinc-800 border-white/10 hover:bg-zinc-700"

}

`}
>

{cat.label}

</button>


))

}


</div>


</section>









{/* TABLE */}



<section
className="
rounded-3xl
border
border-white/10
overflow-hidden
"
>



<div
className="
p-6
bg-zinc-900
"
>


<h2 className="text-2xl font-bold">

Cutoff Intelligence

</h2>


<p className="text-zinc-400 mt-2">

Compare branch difficulty trends from previous years

</p>


</div>







<div
className="
divide-y
divide-white/10
"
>


{

branches.map(branch=>(



<div
key={branch.branch_code}
>



<button

className="
w-full
flex
items-center
justify-between
p-5
hover:bg-white/5
transition
"

onClick={()=>{


setExpanded(
expanded===branch.branch_code
?
null
:
branch.branch_code
);


}}

>



<div
className="text-left"
>


<p className="font-semibold">

{branch.branch_name}

</p>


<p className="text-sm text-zinc-500">

{branch.branch_code}

</p>


</div>







<div
className="
flex
items-center
gap-6
"
>


<div className="text-right">

<p className="text-xs text-zinc-500">

Latest

</p>


<p className="text-xl font-bold tabular-nums">

{
branch.latest ?? "-"
}

</p>


</div>





<div>


{
branch.trend==="up" &&

<TrendingUp
className="text-emerald-400"
/>
}



{
branch.trend==="down" &&

<TrendingDown
className="text-red-400"
/>
}



{
branch.trend==="stable" &&

<Minus
className="text-zinc-400"
/>
}


</div>





{
expanded===branch.branch_code

?

<ChevronUp/>

:

<ChevronDown/>

}



</div>



</button>







{
expanded===branch.branch_code &&

<div
className="
px-6
pb-6
"
>


<div
className="
grid
grid-cols-3
gap-4
"
>


{
branch.history.map(item=>(


<div
key={item.year}
className="
rounded-xl
bg-black/30
p-4
"
>


<p
className="
text-zinc-400
text-sm
"
>

{item.year}

</p>


<p
className="
text-2xl
font-bold
tabular-nums
"
>

{
item.value ?? "-"
}

</p>


</div>


))

}



</div>



{
branch.change!==null &&

<p
className="
mt-4
text-sm
text-zinc-400
"
>


Change from previous year:

<span className="ml-2 font-semibold">

{
branch.change>0
?
`+${branch.change}`
:
branch.change
}


</span>


</p>


}


</div>

}



</div>



))

}


</div>



</section>



</div>


);


}