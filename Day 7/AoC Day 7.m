(* ::Package:: *)

(* ::Text:: *)
(*Written December 7th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=StringTrim/@(StringSplit[#,{",","(",")","->"}]&/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day7Input.txt"}]],"\n"]);*)


(* ::Subsubsection:: *)
(*Part 1*)


tree=DeleteCases[Flatten[If[Length[#]>2,Thread[#[[1]]->#[[4;;]]]]&/@input],Null];
SelectFirst[VertexList[tree],VertexInDegree[tree,#]==0&]


(* ::Subsubsection:: *)
(*Part 2*)


ClearAll@weight;
weight[s_String]:=
	weight[s]=
	Block[{pos},
		pos=SelectFirst[input,#[[1]]==s&];
		If[Length[pos]>2,
			Interpreter["Number"][pos[[2]]]+Total[weight/@pos[[4;;]]],
			Interpreter["Number"][pos[[2]]]
		]
	];
g=TreeGraph[tree,VertexWeight->Table[i[[1]]->weight[i[[1]]],{i,tree}]];


NestList[Function[node,Select[Tally[{#[[2]],weight[#[[2]]]}&/@EdgeList[g,node[[1]]\[DirectedEdge]__],#1[[2]]==#2[[2]]&],#[[-1]]==1&][[1,1]]],{"hlqnsbe",weight["hlqnsbe"]},4]//TableForm


{#[[2]],weight[#[[2]]]}&/@EdgeList[g,"aurik"\[DirectedEdge]__]


ToExpression[SelectFirst[input,#[[1]]=="jriph"&][[2]]]-(2102-2097)
