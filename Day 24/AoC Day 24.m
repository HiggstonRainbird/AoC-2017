(* ::Package:: *)

(* ::Text:: *)
(*Written December 24th, 2017.*)


input=Import[FileNameJoin[{NotebookDirectory[],"Day24Input.txt"}],"List"];


ports=Sort[ToExpression[StringSplit[#,"/"]]]&/@input;


l=Flatten[Function[x,Join[{x},{If[#[[1]]==x[[-1]],#,Reverse[#]]}]&/@
Select[
	Complement[ports,{x}],
	MemberQ[#,Complement[x,{0}][[1]]]&]
	]/@Select[ports,#[[1]]==0&],1];

m=Max[Flatten[Map[Total[Flatten[#]]&,l,{2}]]];
Do[
globalWatch=i;
l=Flatten[Function[x,Join[x,{If[#[[1]]==x[[-1,2]],#,Reverse[#]]}]&/@
	Select[Complement[ports,Sort/@x],MemberQ[#,x[[-1,2]]]&]]/@l,1];
If[l==={},Break[],newm=Max[Flatten[Map[Total[Flatten[#]]&,l,{1}]]]];
m=newm;
Print[m]

,{i,Length[input]}];
m



