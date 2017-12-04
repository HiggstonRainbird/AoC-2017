(* ::Package:: *)

(* ::Text:: *)
(*Written December 4th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Import[FileNameJoin[{NotebookDirectory[],"Day4Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


Count[{Length[DeleteDuplicates[#]],Length[#]}&/@input,_?(#[[1]]==#[[2]]&)]


(* ::Subsubsection:: *)
(*Part 2*)


Count[{Length[DeleteDuplicates[Sort[Characters[#]]&/@#]],Length[Sort[Characters[#]]&/@#]}&/@input,_?(#[[1]]==#[[2]]&)]
