(* ::Package:: *)

(* ::Text:: *)
(*Written December 25th, 2017.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day25Input.txt"}],"Table"];


tape={0};
pos=1;
state="A";

Do[
If[pos==1\[Or]pos==Length[tape],pos+=1;tape=ArrayPad[tape,1]];

Which[
	state=="A",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos++;state="B",
			tape[[pos]]=0;pos--;state="C"],
	state=="B",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos--;state="A",
			tape[[pos]]=1;pos++;state="C"],
	state=="C",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos++;state="A",
			tape[[pos]]=0;pos--;state="D"],
	state=="D",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos--;state="E",
			tape[[pos]]=1;pos--;state="C"],
	state=="E",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos++;state="F",
			tape[[pos]]=1;pos++;state="A"],
	state=="F",
		If[tape[[pos]]==0,
			tape[[pos]]=1;pos++;state="A",
			tape[[pos]]=1;pos++;state="E"]
];
globalWatch=i;
,{i,12134527}];
Count[tape,1];


Dynamic[globalWatch,UpdateInterval->1]


Count[tape,1]
