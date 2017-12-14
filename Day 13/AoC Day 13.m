(* ::Package:: *)

(* ::Text:: *)
(*Written December 13th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


input={ToExpression@StringSplit[#[[1]],":"][[1]],#[[2]]}&/@Import[FileNameJoin[{NotebookDirectory[],"Day13Input.txt"}],"Table"][[;;-2]];


(* ::Subsubsection:: *)
(*Part 1*)


Total@Table[
If[
Min[
	Mod[input[[i,1]],2*(input[[i,2]]-1)],
	Mod[-input[[i,1]],2*(input[[i,2]]-1)]]==0,
input[[i,1]]*input[[i,2]],0],

{i,Length@input}]


(* ::Subsubsection:: *)
(*Part 2*)


part2=Compile[{},Module[{newInput=input,j=0},
	While[j<10^7,
	If[
	Total@Table[
	If[Min[
		Mod[newInput[[i,1]]+j,2*(newInput[[i,2]]-1)],
		Mod[-(newInput[[i,1]]+j),2*(newInput[[i,2]]-1)]]==0,1,0],
	{i,Length@newInput}]==0,Break[]];
	j++;	
	
	];
	j
],CompilationTarget->"C"];

part2[]//AbsoluteTiming


input


ChineseRemainder[]


?ChineseRemainder


Module[{newInput=input,j=0},
	While[j<10^7,
	If[
	Total@Table[
	If[Min[
		Mod[newInput[[i,1]]+j,2*(newInput[[i,2]]-1)],
		Mod[-(newInput[[i,1]]+j),2*(newInput[[i,2]]-1)]]==0,1,0],
	{i,3}]==0,Break[]];
	j++;	
	
	];
	j
]


Table[Min[
		Mod[input[[i,1]]+j,2*(input[[i,2]]-1)],
		Mod[-(input[[i,1]]+j),2*(input[[i,2]]-1)]],{i,{1}},{j,input[[i,2]]*2}]


Table[
Table[
	Min[
		Mod[input[[i,1]]+j,2*(input[[i,2]]-1)],
		Mod[-(input[[i,1]]+j),2*(input[[i,2]]-1)]],
	{i,Length[input]}],
	{j,Max[input[[;;,2]]]*2}]//TableForm


Reduce[Mod[x,6]!=5\[And]Mod[x,2]!=0\[And]Mod[x,4]!=1\[And]x<10^7,Integers]


{Max[#]*2,FirstPosition[#,0][[1]]-1}&/@(Table[
	Min[
		Mod[input[[i,1]]+j,2*(input[[i,2]]-1)],
		Mod[-(input[[i,1]]+j),2*(input[[i,2]]-1)]],
	{j,Max[input[[;;,2]]]*2},{i,Length[input]}]\[Transpose])


{#[[1]],Complement[Range[0,#[[1]]-1],#[[;;,2]]]}&@{{6,5}


t=SortBy[{#[[1,1]],Complement[Range[0,#[[1,1]]-1],#[[;;,2]]]}&/@GatherBy[{Max[#]*2,FirstPosition[#,0][[1]]-1}&/@(Table[
	Min[
		Mod[input[[i,1]]+j,2*(input[[i,2]]-1)],
		Mod[-(input[[i,1]]+j),2*(input[[i,2]]-1)]],
	{j,Max[input[[;;,2]]]*2},{i,Length[input]}]\[Transpose]),First],First]
