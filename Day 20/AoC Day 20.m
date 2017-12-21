(* ::Package:: *)

(* ::Text:: *)
(*Written December 20th, 2017.*)


(* ::Text:: *)
(*377 is too high.  355 is too low?  *)


input=Import[FileNameJoin[{NotebookDirectory[],"Day20Input.txt"}],"List"];


(* ::Subsubsection:: *)
(*Part 1*)


Table[particle[i]=ToExpression["{"~~#~~"}"]&/@StringCases[input[[i]],"p=<"~~p:__~~">, v=<"~~v:__~~">, a=<"~~a:__~~">"->{p,v,a}][[1]],{i,Length@input}];

Do[
Module[{x,v,a},
Do[
	{x,v,a}=particle[i];
	v+=particle[i][[3]];
	x+=v;
	
	particle[i]={x,v,a};

,{i,Length@input}];
globalWatch={j,Ordering[particle[#][[1]]&/@Range[Length[input]],All,Total[Abs[#1]]<Total[Abs[#2]]&][[1]]-1}
],
{j,1000}];

Ordering[particle[#][[1]]&/@Range[Length[input]],All,Total[Abs[#1]]<Total[Abs[#2]]&][[1]]-1


particleList=Table[ToExpression["{"~~#~~"}"]&/@StringCases[input[[i]],"p=<"~~p:__~~">, v=<"~~v:__~~">, a=<"~~a:__~~">"->{p,v,a}][[1]],{i,Length@input}];


(* ::Subsubsection:: *)
(*Part 2*)


particleList=Table[ToExpression["{"~~#~~"}"]&/@StringCases[input[[i]],"p=<"~~p:__~~">, v=<"~~v:__~~">, a=<"~~a:__~~">"->{p,v,a}][[1]],{i,Length@input}];

Do[
Module[{x,v,a,tally},
Do[
	{x,v,a}=particleList[[i]];
	v+=particleList[[i]][[3]];
	x+=v;
	
	particleList[[i]]={x,v,a};

,{i,Length@particleList}];

tally=Tally[particleList[[;;,1]]];
If[Max[tally[[;;,2]]]>1,
	Do[particleList=DeleteCases[particleList,_?(#[[1]]==dup&),{1}],{dup,Select[tally,#[[2]]!=1&][[;;,1]]}]
];
globalWatch={j,Length[particleList],DeleteDuplicates[Tally[particleList[[;;,1]]][[;;,2]]]}
],
{j,2000}];

Length[particleList]


Dynamic[globalWatch,UpdateInterval->1]
