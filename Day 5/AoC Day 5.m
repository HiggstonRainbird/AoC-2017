(* ::Package:: *)

(* ::Text:: *)
(*Written December 5th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];

part1=Compile[{},Module[{pos,n,l,inputTemp},
pos=1;
n=0;
inputTemp=input;
l=Length[inputTemp];
While[pos>0\[And]pos<=Length[inputTemp],
	inputTemp[[pos]]++;
	pos+=inputTemp[[pos]]-1;
	n++;
];
n],CompilationTarget->"C"];

part1[]]


(* ::Subsubsection:: *)
(*Part 2*)


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];

part2=Compile[{},Module[{pos=1,n=0,l,tempPos=1,in,inputTemp},
pos=1;
n=0;
inputTemp=input;
l=Length[inputTemp];
While[0<pos<=l,
	tempPos=pos;
	in=inputTemp[[tempPos]];
	pos+=in;
	
	If[in<3,
		inputTemp[[tempPos]]++,
		inputTemp[[tempPos]]--
		];
	n++;
];
n],CompilationTarget->"C"];

part2[]]
