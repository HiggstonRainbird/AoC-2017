(* ::Package:: *)

(* ::Text:: *)
(*Written December 1st, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Import[FileNameJoin[{NotebookDirectory[],"Day1Input.txt"}]];*)
(*s=ToExpression/@Characters[input];*)


(* ::Subsubsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Total[Table[If[s[[i]]==RotateRight[s,1][[i]],s[[i]],0],{i,Length[s]-1}]]*)


(* ::Subsubsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Total[Table[If[s[[i]]==RotateRight[s,Length[s]/2][[i]],s[[i]],0],{i,Length[s]}]]*)
