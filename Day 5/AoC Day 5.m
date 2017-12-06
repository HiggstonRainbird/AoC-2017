(* ::Package:: *)

(* ::Text:: *)
(*Written December 5th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


Do[
	s[i]=input[[i]];
	,{i,Length@input}];
pos=1;
n=0;
While[pos>0\[And]pos<=Length[input],
	input[[pos]]++;
	pos+=input[[pos]]-1;
	n++;
]


(* ::Subsubsection:: *)
(*Part 2*)


(* Runs in 88.15 seconds.  Steps through the loop 28,675,390 times. *)


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
pos=1;
n=0;
l=Length[input];
While[0<pos<=l,
	tempPos=pos;
	in=input[[tempPos]];
	pos+=in;
	
	If[in<3,
		input[[tempPos]]++,
		input[[tempPos]]--
		];
	n++;
];
n]


(* Runs in 100.24 seconds.  Steps through the loop only 28,674,305 times. *)


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
pos=1;
n=0;
sol=0;
l=Length[input];
While[0<pos<=l,
	tempPos=pos;
	in=input[[tempPos]];
	
	Which[
		in==0,
			input[[tempPos]]=2;
			pos+=1;
			sol+=2;,
		in<3,
			input[[tempPos]]++;
			pos+=in;
			sol+=1;,
		in>=3,
			input[[tempPos]]--;
			pos+=in;
			sol+=1;
	];
	n++;
];
{n,sol}]


AbsoluteTiming[
input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
pos=1;
n=0;
sol=0;
l=Length[input[[;;500]]];
While[0<pos<=l,
	tempPos=pos;
	in=input[[tempPos]];
	
	Which[
		l-tempPos>=3\[And]input[[tempPos;;tempPos+3-1]]=={2,0,-1},
			input[[tempPos;;tempPos+3-1]]={3,2,2};
			pos+=3;
			sol+=6,
		in<3,
			input[[tempPos]]++;
			pos+=in;
			sol+=1;,
		in>=3,
			input[[tempPos]]--;
			pos+=in;
			sol+=1;
	];
	n++;
];
{n,sol}]


input[[1;;1+6]]


input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
inputShort=input[[1;;50]];
inputRecord=Table[{},{2000}];
pos=1;
n=0;
l=Length[inputShort];
inputRecord[[n+1]]={n+1,inputShort};
While[0<pos<=l\[And]n<2000,
	tempPos=pos;
	in=inputShort[[tempPos]];
	pos+=in;
	
	If[in<3,
		inputShort[[tempPos]]++,
		inputShort[[tempPos]]--
		];
	n++;
	inputRecord[[n+1]]={n+1,inputShort};
];


Manipulate[inputRecord[[i;;i+100,2]]//TableForm,{i,1,Length[inputRecord]-100,1}]


Manipulate[Row[{ArrayPlot[Mod[inputRecord[[i;;i+50,2,1;;25]],2],Mesh->All],inputRecord[[i;;i+50,2,26;;28]]//TableForm}],{i,1,Length[inputRecord]-50,1}]


Flatten@Mod[{
 {3, 3, 2, 2, 3, 3, 3, 2, 3, 3, 2, 2, 3, 3, 3, 3, 2, 3, 3, 2, 2, 2, 2}
},2]


ArrayPlot[Mod[inputRecord[[539;;539+6,2,1;;25]],2],Mesh->All]


Mod[inputRecord[[539,2,10;;25]],2]


Mod[inputRecord[[539+6,2,10;;25]],2]


input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"Table"][[;;-2]];
inputShort=Join[Table[2,10],{-10,-11,-12}];
inputRecord=Table[{},{2000}];
pos=1;
n=0;
l=Length[inputShort];
inputRecord[[n+1]]={n+1,inputShort};
While[0<pos<=l\[And]n<2000,
	tempPos=pos;
	in=inputShort[[tempPos]];
	pos+=in;
	
	If[in<3,
		inputShort[[tempPos]]++,
		inputShort[[tempPos]]--
		];
	n++;
	inputRecord[[n+1]]={n+1,inputShort};
];


n


Row[{ArrayPlot[Mod[inputRecord[[1;;109,2,;;-4]],2],Mesh->All],inputRecord[[1;;109,2,-3;;]]//TableForm}]
