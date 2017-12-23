(* ::Package:: *)

(* ::Text:: *)
(*Written December 23rd, 2017.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day23Input.txt"}],"Table"];


input


(* ::Subsubsection:: *)
(*Part 1*)


i=1;count=0;
Table[registers[i]=0,{i,CharacterRange["a","h"]}];
While[i<=Length[input],
	arg2=input[[i,2]];
	If[
	Length[input[[i]]]==3,
	arg3=If[IntegerQ[input[[i,3]]],input[[i,3]],registers[input[[i,3]]]]
	];
	Which[
		input[[i,1]]=="set",registers[input[[i,2]]]=arg3,
		input[[i,1]]=="sub",registers[input[[i,2]]]-=arg3,
		input[[i,1]]=="mul",registers[input[[i,2]]]*=arg3;count+=1,
		input[[i,1]]=="jnz",
		Which[
				IntegerQ[arg2],If[arg2!=0,i+=arg3-1],
				True,If[registers[arg2]!=0,i+=arg3-1]]
	];
	i++;
];
count


Dynamic[count,UpdateInterval->1]


(* ::Subsubsection:: *)
(*Part 2*)


i=1;j=1;count=0;
Table[registers[i]=0,{i,CharacterRange["a","h"]}];
registers["a"]=1;
t=Table[0,{i,10^6}];
While[i<=Length[input]\[And]j<=10^6,
	arg2=input[[i,2]];
	If[
	Length[input[[i]]]==3,
	arg3=If[IntegerQ[input[[i,3]]],input[[i,3]],registers[input[[i,3]]]]
	];
	Which[
		input[[i,1]]=="set",registers[input[[i,2]]]=arg3,
		input[[i,1]]=="sub",registers[input[[i,2]]]-=arg3,
		input[[i,1]]=="mul",registers[input[[i,2]]]*=arg3;count+=1,
		input[[i,1]]=="jnz",
		Which[
				IntegerQ[arg2],If[arg2!=0,i+=arg3-1],
				True,If[registers[arg2]!=0,i+=arg3-1]]
	];
	i++;
	t[[j]]={i,j,Table[registers[k],{k,CharacterRange["a","h"]}]};j++
];
registers["h"]


(* ::Text:: *)
(*This isn't going to run in time.  Time for a better approach.*)
(**)
(*If the program has exited, g had a value of 0 at line 29.*)
(*	g==0 at line 29 when b==c.*)
(*	If g!=0 at line 29, b increments by 17.*)
(*	Thus, lines 25 through 31 will run 1000 times, on incremental values of b, before the program finishes.*)
(*If f==0 at line 25, h will increment by 1.*)
(*	This can happen once and only once for any given value of b.*)
(*	f==0 if g==0 at line 15.*)
(*	g==0 at line 15 if d*e==b.*)
(*	Since both d and e increment by 1 each in a loop, this will check every possible value of d and e less than b.*)
(*	Therefore, if b has any prime factors other than itself, f will be set to 1 at line 25.*)
(*	Thus, this code is an obfuscated composite number checker.*)


Count[Table[108100+17k,{k,0,1000}],_?(!PrimeQ[#]&)]


124998*10799*1000
