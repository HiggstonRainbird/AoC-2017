(* ::Package:: *)

(* ::Text:: *)
(*Written December 18th, 2017.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day18Input.txt"}],"Table"][[;;-2]];


(* ::Subsubsection:: *)
(*Part 1*)


i=1;snd=0;
Table[registers[i]=0,{i,DeleteDuplicates[input[[;;,2]]]}];
While[i<=Length[input],
	If[
	Length[input[[i]]]==3,
	arg3=If[IntegerQ[input[[i,3]]],input[[i,3]],registers[input[[i,3]]]]
	];
	Which[
		input[[i,1]]=="snd",snd=registers[input[[i,2]]],
		input[[i,1]]=="set",registers[input[[i,2]]]=arg3,
		input[[i,1]]=="add",registers[input[[i,2]]]+=arg3,
		input[[i,1]]=="mul",registers[input[[i,2]]]*=arg3,
		input[[i,1]]=="mod",registers[input[[i,2]]]=Mod[registers[input[[i,2]]],arg3],
		input[[i,1]]=="rcv",If[registers[input[[i,2]]]!=0,Print[snd];Break[]],
		input[[i,1]]=="jgz",If[registers[input[[i,2]]]>0,i+=input[[i,3]]-1]
	];
	i++
]


(* ::Subsubsection:: *)
(*Part 2*)


i=1;j=1;
next0=True;next1=True;
queue0={};queue1={};
count=0;
ClearAll@registers;

Table[registers[0][i]=0,{i,Select[DeleteDuplicates[input[[;;,2]]],!IntegerQ[#]&]}];
Table[registers[1][i]=0,{i,Select[DeleteDuplicates[input[[;;,2]]],!IntegerQ[#]&]}];
registers[0]["p"]=0;registers[1]["p"]=1;
While[!(next0==False\[And]next1==False),
	arg1=input[[i,1]];
	arg2=input[[i,2]];
	If[
		Length[input[[i]]]==3,
		arg3=If[IntegerQ[input[[i,3]]],input[[i,3]],registers[0][input[[i,3]]]]
	];
	Which[
		arg1=="snd",AppendTo[queue1,registers[0][arg2]],
		arg1=="set",registers[0][arg2]=arg3,
		arg1=="add",registers[0][arg2]+=arg3,
		arg1=="mul",registers[0][arg2]*=arg3,
		arg1=="mod",registers[0][arg2]=Mod[registers[0][arg2],arg3],
		arg1=="rcv",If[Length[queue0]>0,
				registers[0][arg2]=queue0[[1]];queue0=Drop[queue0,1];next0=True,
				i--;next1=False],
		arg1=="jgz",
			Which[
				IntegerQ[arg2],If[arg2>0,i+=arg3-1],
				True,If[registers[0][arg2]>0,i+=arg3-1]]
	];
	i++;
	
	arg1=input[[j,1]];
	arg2=input[[j,2]];
	If[
		Length[input[[j]]]==3,
		arg3=If[IntegerQ[input[[j,3]]],input[[j,3]],registers[1][input[[j,3]]]]
	];
	Which[
		arg1=="snd",AppendTo[queue0,registers[1][arg2]];count++,
		arg1=="set",registers[1][arg2]=arg3,
		arg1=="add",registers[1][arg2]+=arg3,
		arg1=="mul",registers[1][arg2]*=arg3,
		arg1=="mod",registers[1][arg2]=Mod[registers[1][arg2],arg3],
		arg1=="rcv",
			If[Length[queue1]>0,
				registers[1][arg2]=queue1[[1]];queue1=Drop[queue1,1];next1=True,
				j--;next1=False],
		arg1=="jgz",
			Which[
			IntegerQ[arg2],If[arg2>0,j+=arg3-1],
			True,If[registers[1][arg2]>0,j+=arg3-1]]
	];
	j++
];
count


Dynamic[Column@{count,i,j,next0,next1,
"",
Table[{0,i,registers[0][i]},{i,{"i","a","p","b","f"}}]//TableForm,
"",
Table[{1,i,registers[1][i]},{i,{"i","a","p","b","f"}}]//TableForm
},UpdateInterval->1]
