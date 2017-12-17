(* ::Package:: *)

(* ::Text:: *)
(*Written December 17th, 2017.*)


(* ::Subsubsection:: *)
(*Part 1*)


Module[{input,l,p},
input=344;
l={0};
p=0;

Do[
l=Insert[l,i,Mod[input+p,i,1]+1];
p=Mod[input+p,i,1]+1;

,{i,2017}];

l[[FirstPosition[l,2017][[1]]+1]]]


Module[{p,new1},
p=0;new1=0;
Do[p=Mod[3+p,i,1]+1;If[p==2,new1=i;Print[new1]],{i,50*10^3}];
new1]


(* ::Subsubsection:: *)
(*Part 2*)


part2=Compile[{},
Module[{p,new1},
p=0;new1=0;
Do[p=Mod[344+p,i,1]+1;If[p==2,new1=i],{i,50*10^6}];
new1]
,CompilationTarget->"C"]


part2[]//AbsoluteTiming


(* ::Subsubsection:: *)
(*Upping The Ante*)


c=0;n=1;
Do[
i=Floor[(n-c)/344];
n+=(i+1);
c=Which[
	Mod[c+345*(i+1),n]==1,0,
	Mod[c+345*(i+1),n]==0,n,
	True,Mod[c+345*(i+1),n]];
If[c==2,Print[n]]
,{j,1000}]


c=2;n=246;
Do[
{f,i}={FractionalPart[#],IntegerPart[#]}&@((n-c)/344);
n+=(i+1);c=If[Mod[c+345*(i+1),n]==1,0,Mod[c+345*(i+1),n]];
If[c==2,Print[n]]
,{j,3000}]


p=0;
l=Table[If[Mod[47+p,i,1]==1,Print[{p,i}]];p=Mod[47+p,i,1]+1,{i,500000}];
Flatten[Position[l,2]]


AbsoluteTiming[
c=0;n=1;in=47;acc={1};
Do[
i=Floor[(n-c)/in];
n+=(i+1);
c=Which[
	Mod[c+(in+1)*(i+1),n]==1,0,
	Mod[c+(in+1)*(i+1),n]==0,n,
	True,Mod[c+(in+1)*(i+1),n]];
If[c==2,acc=AppendTo[acc,n];]
,{j,110000}]
]


AbsoluteTiming[
Module[{c,n,in,acc,i,j,count,temp},c=0;n=1;in=47;count=1;
j=1;
While[n<10^1000,
i=Floor[(n-c)/in];
n+=(i+1);
temp=Mod[c+(in+1)*(i+1),n];
c=Which[
	temp>1,temp,
	temp==0,n,
	temp==1,0];
If[c==2,count+=1];
j+=1;
];
{count}]]


Total[Select[acc,#<10^1000&]]


Length[Select[acc,#<10^1000&]]
