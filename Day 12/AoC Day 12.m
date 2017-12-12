(* ::Package:: *)

(* ::Text:: *)
(*Written December 12th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


input=ToExpression[StringSplit[StringSplit[#," <->"],", "]]&/@Import[FileNameJoin[{NotebookDirectory[],"Day11Input.txt"}],"List"][[;;-2]]


g=Graph[Flatten[Thread[#[[1,1]]<->Flatten[#[[2]]]]&/@input],VertexLabels->"Name"]


(* ::Subsubsection:: *)
(*Part 1*)


Length@SelectFirst[ConnectedComponents[g],MemberQ[#,0]&]


(* ::Subsubsection:: *)
(*Part 2*)


Length@ConnectedComponents[g]
