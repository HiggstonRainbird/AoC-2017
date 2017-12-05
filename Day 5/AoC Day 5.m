(* ::Package:: *)

(* ::Text:: *)
(*Written December 5th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


Do[
	s[i]=input[[i]];
	,{i,Length@input}];
pos=1;
n=0;
While[pos>0\[And]pos<=Length[input],
	input[[pos]]++;
	pos+=input[[pos]]-1;
	n++;
]


n


(* ::Subsubsection:: *)
(*Part 2*)


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
Do[
	s[i]=input[[i]];
	,{i,Length@input}];
pos=1;
n=0;
While[pos>0\[And]pos<=Length[input],
	tempPos=pos;
	pos+=input[[tempPos]];
	
	If[input[[tempPos]]<3,
		input[[tempPos]]++,
		input[[tempPos]]--
		];
	n++;
];
n]
