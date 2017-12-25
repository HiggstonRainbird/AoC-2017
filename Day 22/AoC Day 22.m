(* ::Package:: *)

(* ::Text:: *)
(*Written December 22nd, 2017.*)
(**)
(*4715 is NOT correct.  5418 is NOT correct.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day22Input.txt"}],"Table"];


(* ::Subsubsection:: *)
(*Part 1*)


startingMatrix=Flatten[(Characters/@input)/.{"#"->1,"."->0},1];
(*startingMatrix={{0,0,1},{1,0,0},{0,0,0}};*)
matrix=startingMatrix;

d={"up","right","down","left"};
moves={{1,0},{0,1},{-1,0},{0,-1}};

pos={(Length[startingMatrix]+1)/2,(Length[startingMatrix]+1)/2};
count=0;

Do[

If[matrix[[pos[[1]],pos[[2]]]]==1,
	d=RotateLeft[d],
	d=RotateRight[d]];
If[matrix[[pos[[1]],pos[[2]]]]==1,
	matrix[[pos[[1]],pos[[2]]]]=0,
	matrix[[pos[[1]],pos[[2]]]]=1;count++];

If[Min[pos]==1\[Or]Max[pos]==Length@matrix,
	pos+={1,1};
	matrix=ArrayPad[matrix,1];
	startingMatrix=ArrayPad[startingMatrix,1];
];
pos+=d[[1]]/.Thread[{"up","right","down","left"}->{{-1,0},{0,1},{1,0},{0,-1}}];
,{i,10000}];
count


(* ::Subsubsection:: *)
(*Part 2*)


(* ::Text:: *)
(*Code:*)
(*	0 -> Clean node.*)
(*	1/2 -> Weakened node. *)
(*	1 -> Infected node.*)
(*	3/2 -> Flagged node.*)
(*	*)


startingMatrix=Flatten[(Characters/@input)/.{"#"->1,"."->0},1];
(*startingMatrix={{0,0,1},{1,0,0},{0,0,0}};*)
matrix=startingMatrix;

d={"up","right","down","left"};
moves={{1,0},{0,1},{-1,0},{0,-1}};

pos={(Length[startingMatrix]+1)/2,(Length[startingMatrix]+1)/2};
count=0;

Do[
m=matrix[[pos[[1]],pos[[2]]]];
Which[
	m==1,d=RotateLeft[d],
	m==0,d=RotateRight[d],
	m==3/2,d=RotateRight[d,2]
	];

Which[
	m==0,matrix[[pos[[1]],pos[[2]]]]=1/2,
	m==1/2,matrix[[pos[[1]],pos[[2]]]]=1;count++,
	m==1,matrix[[pos[[1]],pos[[2]]]]=3/2,
	m==3/2,matrix[[pos[[1]],pos[[2]]]]=0]

If[Min[pos]==1\[Or]Max[pos]==Length@matrix,
	pos+={1,1};
	matrix=ArrayPad[matrix,1];
	startingMatrix=ArrayPad[startingMatrix,1];
];
pos+=d[[1]]/.Thread[{"up","right","down","left"}->{{-1,0},{0,1},{1,0},{0,-1}}];
,{i,10000000}];
count


Dynamic[count,UpdateInterval->1]
