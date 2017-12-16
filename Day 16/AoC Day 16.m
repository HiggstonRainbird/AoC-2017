(* ::Package:: *)

(* ::Text:: *)
(*Written December 16th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day16Input.txt"}],"List"][[1]];
input=StringSplit[#,","]&@input;


(* ::Subsubsection:: *)
(*Part 1*)


l=CharacterRange["a","p"];
Do[
Which[
	Characters[i][[1]]=="s",l=RotateRight[l,ToExpression[StringJoin@Characters[i][[2;;]]]],
	Characters[i][[1]]=="x",
		x=StringSplit[StringJoin@Characters[i][[2;;]],"/"];
		{l[[ToExpression[x[[1]]]+1]],l[[ToExpression[x[[2]]]+1]]}=
		{l[[ToExpression[x[[2]]]+1]],l[[ToExpression[x[[1]]]+1]]},
	Characters[i][[1]]=="p",
		pos1=FirstPosition[l,Characters[i][[2]]][[1]];
		pos2=FirstPosition[l,Characters[i][[4]]][[1]];
		p=StringSplit[StringJoin@Characters[i][[2;;]],"/"];
		{l[[pos1]],l[[pos2]]}={p[[2]],p[[1]]};
];
,{i,input}];

StringJoin@l


(* ::Subsubsection:: *)
(*Part 2*)


AbsoluteTiming[
l=CharacterRange["a","p"];
acc={};
Do[
Do[
Which[
	Characters[i][[1]]=="s",l=RotateRight[l,ToExpression[StringJoin@Characters[i][[2;;]]]],
	Characters[i][[1]]=="x",
		x=StringSplit[StringJoin@Characters[i][[2;;]],"/"];
		{l[[ToExpression[x[[1]]]+1]],l[[ToExpression[x[[2]]]+1]]}=
		{l[[ToExpression[x[[2]]]+1]],l[[ToExpression[x[[1]]]+1]]},
	Characters[i][[1]]=="p",
		pos1=FirstPosition[l,Characters[i][[2]]][[1]];
		pos2=FirstPosition[l,Characters[i][[4]]][[1]];
		p=StringSplit[StringJoin@Characters[i][[2;;]],"/"];
		{l[[pos1]],l[[pos2]]}={p[[2]],p[[1]]};
];
,{i,input}];
If[l==CharacterRange["a","p"],
	l=acc[[Mod[10^9,j]]];
	Break[],
	AppendTo[acc,l]
	]
,{j,10^4}];
StringJoin@l]
