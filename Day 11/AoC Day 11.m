(* ::Package:: *)

(* ::Text:: *)
(*Written December 11th, 2017.*)


(* ::Input:: *)
(*input=StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day11Input.txt"}],"List"][[1]],","];*)


x=0;y=0;m=0;
Do[
	Which[
		i=="n",y++,
		i=="ne",x++;y++,
		i=="se",x++;,
		i=="s",y--,
		i=="sw",x--;y--,
		i=="nw",x--;
	];
	m=If[Max[Abs/@{x,y,x-y}]>m,Max[Abs/@{x,y,x-y}],m];
,{i,input}];


(* ::Subsubsection:: *)
(*Part 1*)


(* ::InheritFromParent:: *)
(*Max[Abs/@{x,y,x-y}]*)


(* ::Subsubsection:: *)
(*Part 2*)


m
