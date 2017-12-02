(* ::Package:: *)

(* ::Text:: *)
(*Written December 2nd, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Import[FileNameJoin[{NotebookDirectory[],"Day2Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Total[Max[#]-Min[#]&/@Import[FileNameJoin[{NotebookDirectory[],"Day2Input.txt"}],"Table"][[;;-2]]]*)


(* ::Subsubsection:: *)
(*Part 2*)


Total[Flatten[Table[Select[Flatten[input[[i]]/#&/@input[[i]]],IntegerQ[#]\[And]#!=1&],{i,16}]]]
