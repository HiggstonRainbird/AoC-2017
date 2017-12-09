(* ::Package:: *)

(* ::Text:: *)
(*Written December 9th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Characters[Import[FileNameJoin[{NotebookDirectory[],"Day9Input.txt"}]]];*)


groupScore=0;
groupDepth=0;
garbageCount=0;
isGarbage=False;
negateNextCommand=False;

Do[
	Which[
		negateNextCommand==True,
		negateNextCommand=False,
		
		isGarbage==True,
		Which[
			i=="!",negateNextCommand=True,
			i==">",isGarbage=False,
			True,garbageCount+=1;
		],
		
		i=="{",groupDepth+=1,
		i=="}",groupScore+=groupDepth;groupDepth-=1,
		i=="<",isGarbage=True,
		i=="!",negateNextCommand=True
	]
,{i,input}];


(* ::Subsubsection:: *)
(*Part 1*)


groupScore


(* ::Subsubsection:: *)
(*Part 2*)


garbageCount
