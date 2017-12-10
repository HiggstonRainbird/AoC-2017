(* ::Package:: *)

(* ::Text:: *)
(*Written December 10th, 2017.*)


(* ::Subsubsection:: *)
(*Part 1*)


input={130,126,1,11,140,2,255,207,18,254,246,164,29,104,0,224};
pos=0;
skipSize=0;
l=Range[0,255];

Do[
	l=RotateLeft[l,pos];
	l[[;;i]]=Reverse[l[[;;i]]];
	l=RotateRight[l,pos];
	pos=Mod[pos+i+skipSize,Length[l]];
	skipSize++
,{i,input}];

Print[l[[1]]*l[[2]]]


(* ::Subsubsection:: *)
(*Part 2*)


input=Join[ToCharacterCode["130,126,1,11,140,2,255,207,18,254,246,164,29,104,0,224","ASCII"],{17,31,73,47,23}];

pos=0;
skipSize=0;
l=Range[0,255];

Do[
	l=RotateLeft[l,pos];
	l[[;;i]]=Reverse[l[[;;i]]];
	l=RotateRight[l,pos];
	pos=Mod[pos+i+skipSize,Length[l]];
	skipSize++
,{j,64},{i,input}];

BaseForm[FromDigits[BitXor@@#&/@Partition[l,16],256],16]
