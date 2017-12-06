(* ::Package:: *)

(* ::Text:: *)
(*Written December 6th, 2017.*)


(* ::Subsubsection:: *)
(*Import*)


(* ::Input:: *)
(*input=Flatten@Import[FileNameJoin[{NotebookDirectory[],"Day6Input.txt"}],"Table"][[;;-2]];*)


(* ::Subsubsection:: *)
(*Part 1*)


redistribute[oldL_List]:=
Block[{m},
	L=oldL;
	m=FirstPosition[L,Max[L]][[1]];
	max=Max[L];
	L[[m]]-=max;
	i=m+1;
	While[max>0,
		L[[Mod[i,Length[L],1]]]++;
		max--;
		i++;
	];
	L
];	


n=NestList[redistribute,input,100000];
i=1;
While[
	FirstPosition[n,n[[i]]][[1]]==i,
	i++
];
i-1


(* ::Subsubsection:: *)
(*Part 2*)


#[[2]]-#[[1]]&@Flatten[Position[n,n[[i+1]]]]
