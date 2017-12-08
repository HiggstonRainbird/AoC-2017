(* ::Package:: *)

(* ::Text:: *)
(*Written December 8th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Import[FileNameJoin[{NotebookDirectory[],"Day8Input.txt"}],"Table"][[;;-2]];*)


val=Association[(#->0)&/@DeleteDuplicates[input[[;;,1]]]];
m=0;
compOperator[s_]:=
	Which[
		s==">",Greater,
		s=="<",Less,
		s==">=",GreaterEqual,
		s=="<=",LessEqual,
		s=="==",Equal,
		s=="!=",Unequal];
		
incOperator[s_]:=
	Which[
		s=="inc",AddTo,
		s=="dec",SubtractFrom
	]

Do[
	If[compOperator[i[[6]]][val[i[[5]]],i[[7]]],
		incOperator[i[[2]]][val[i[[1]]],i[[3]]];
		];
	If[Max[val/@DeleteDuplicates[input[[;;,1]]]]>m,m=Max[val/@DeleteDuplicates[input[[;;,1]]]]]
	
,{i,input}]


(* ::Subsubsection:: *)
(*Part 1*)


Max[val/@DeleteDuplicates[input[[;;,1]]]]


(* ::Subsubsection:: *)
(*Part 2*)


m
