(* ::Package:: *)

(* ::Text:: *)
(*Written December 14th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


input="nbysizxe";


(* ::Subsubsection:: *)
(*Part 1*)


knotHash[in_String,n_Integer]:=
Module[{l,newIn,pos,skipSize},
newIn=Join[ToCharacterCode[in<>"-"<>ToString[n]],{17,31,73,47,23}];
pos=0;skipSize=0;l=Range[0,255];

Do[
	l=RotateLeft[l,pos];
	l[[;;i]]=Reverse[l[[;;i]]];
	l=RotateRight[l,pos];
	pos=Mod[pos+i+skipSize,Length[l]];
	skipSize++
,{j,64},{i,newIn}];

IntegerDigits[FromDigits[BitXor@@#&/@Partition[l,16],256],2]

];


Total@Table[Count[knotHash[input,j],1],{j,0,127}]


(* ::Subsubsection:: *)
(*Part 2*)


ArrayPlot[
		Map[If[#==0,1,0]&,PadLeft[Table[knotHash["flqrgnkx",j],{j,0,127}],{128,128}],{2}],
		PlotRangePadding->0]


MorphologicalComponents[
	PadLeft[Table[knotHash["flqrgnkx",j],{j,0,127}],{128,128}],
	CornerNeighbors->False
]//Colorize


Max[MorphologicalComponents[
	PadLeft[Table[knotHash[input,j],{j,0,127}],{128,128}],
	CornerNeighbors->False
]]
