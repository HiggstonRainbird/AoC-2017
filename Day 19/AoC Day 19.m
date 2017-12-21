(* ::Package:: *)

(* ::Text:: *)
(*Written December 20th, 2017.*)


input=Characters/@Import[FileNameJoin[{NotebookDirectory[],"Day19Input.txt"}],"List"];


(* ::Subsubsection:: *)
(*Maze*)


x=114;y=1;d="south";c=0;s=Table["",{i,20000}];

nextStep[x_,y_,d_]:=
	Which[
	input[[y,x]]!="+",
		d/.Thread[{"south","north","east","west"}->{{x,y+1,d},{x,y-1,d},{x+1,y,d},{x-1,y,d}}],
	input[[y,x]]=="+",
		Which[
			d=="south"\[Or]d=="north",If[input[[y,x+1]]=="-",{x+1,y,"east"},{x-1,y,"west"}],
			d=="east"\[Or]d=="west",If[input[[y+1,x]]=="|",{x,y+1,"south"},{x,y-1,"north"}]
		]
	];
	
Do[
s[[i]]=input[[y,x]];
{x,y,d}=nextStep[x,y,d];
c+=1;
,{i,16500}];


(* ::Subsubsection:: *)
(*Part 1*)


StringJoin@Select[s,!MemberQ[{"|","-","+"},#]&]


(* ::Subsubsection:: *)
(*Part 2*)


FirstPosition[s,Alternatives[" ","S"]][[1]]
