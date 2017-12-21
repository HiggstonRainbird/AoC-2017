(* ::Package:: *)

(* ::Text:: *)
(*Written December 21th, 2017.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day21Input.txt"}],"Table"];


patterns=Flatten[Table[{#,Reverse[#,{2}]\[Transpose],Reverse[#\[Transpose],{2}],Reverse[#,{1,2}],Reverse[#],Map[Reverse,#]}&@(Characters/@StringSplit[input[[i,1]],"/"]),{i,Length[input]}],1];
outputs=Flatten[Table[Characters/@StringSplit[input[[i,3]],"/"],{i,Length@input},{j,6}],1];


(* ::Subsubsection:: *)
(*Part 1*)


canvas={{".","#","."},{".",".","#"},{"#","#","#"}};
Do[
size=Length[canvas];
fragments=If[Divisible[size,2],Partition[canvas,{2,2}],Partition[canvas,{3,3}]];
canvas=ArrayFlatten@Table[outputs[[FirstPosition[patterns,Alternatives@@
	{#,Reverse[#,{2}]\[Transpose],Reverse[#\[Transpose],{2}],Reverse[#,{1,2}],Reverse[#],Map[Reverse,#]}&@fragments[[i,j]]
][[1]]]],{i,Length@fragments},{j,Length@fragments}];

,{k,5}];


Count[Flatten[canvas],"#"]


(* ::Subsubsection:: *)
(*Part 2*)


canvas={{".","#","."},{".",".","#"},{"#","#","#"}};
Do[
size=Length[canvas];
fragments=If[Divisible[size,2],Partition[canvas,{2,2}],Partition[canvas,{3,3}]];
canvas=ArrayFlatten@Table[outputs[[FirstPosition[patterns,Alternatives@@
	{#,Reverse[#,{2}]\[Transpose],Reverse[#\[Transpose],{2}],Reverse[#,{1,2}],Reverse[#],Map[Reverse,#]}&@fragments[[i,j]]
][[1]]]],{i,Length@fragments},{j,Length@fragments}];

,{k,18}];


Count[Flatten[canvas],"#"]
