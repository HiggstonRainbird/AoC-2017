(* ::Package:: *)

(* ::Text:: *)
(*Written December 15th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


input={618,814};


(* ::Subsubsection:: *)
(*Part 1*)


part1=Compile[{},
Module[{i,c,a,b},
i=1;c=0;
a=618;b=814;
While[i<4*10^7,
a=Mod[16807*a,2147483647];
b=Mod[48271*b,2147483647];
If[IntegerDigits[a,2,31][[16;;31]]==IntegerDigits[b,2,31][[16;;31]],c++];
i++
];
c
],
CompilationTarget->"C"];

part1[]//AbsoluteTiming


(* ::Subsubsection:: *)
(*Part 2*)


part2=Compile[{},
Module[{i,c,a,b},
i=1;c=0;
a=618;b=814;
While[i<5*10^6,
a=Mod[16807*a,2147483647];
b=Mod[48271*b,2147483647];

While[Mod[a,4]!=0,a=Mod[16807*a,2147483647]];
While[Mod[b,8]!=0,b=Mod[48271*b,2147483647]];

If[IntegerDigits[a,2,31][[16;;31]]==IntegerDigits[b,2,31][[16;;31]],c++];
i++];
c],
CompilationTarget->"C"];

part2[]//AbsoluteTiming
