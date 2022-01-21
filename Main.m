clc
clear

load('ALLDATA.mat');

T=ALLDATA;

z=0;
for i=1:1958
    
   S= T.CompMutList(i);
   S=convertStringsToChars(S);
   [V]=str_char_improved(S);
   
   for k=1:length(V)
   z=z+1;    
       W{z}=V{k};
       
   end
   
end

W=unique(W);
d=0;
for i=1:1958

if T.FPV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_FPV(j,d)=1;
end
end
end
OUT_FPV(d,1)=log10(T.FPV(i));
end    
 
end
 
d=0;
for i=1:1958
if T.ATV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_ATV(j,d)=1;
end
end
end
OUT_ATV(d,1)=log10(T.ATV(i));
end
end

d=0;
for i=1:1958
if T.IDV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_IDV(j,d)=1;
end
end
end
OUT_IDV(d,1)=log10(T.IDV(i));
end
end

d=0;
for i=1:1958
if T.LPV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_LPV(j,d)=1;
end
end
end
OUT_LPV(d,1)=log10(T.LPV(i));
end
end

d=0;
for i=1:1958
if T.NFV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_NFV(j,d)=1;
end
end
end
OUT_NFV(d,1)=log10(T.NFV(i));
end
end

d=0;
for i=1:1958
if T.SQV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_SQV(j,d)=1;
end
end
end
OUT_SQV(d,1)=log10(T.SQV(i));
end
end

d=0;
for i=1:1958
if T.TPV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_TPV(j,d)=1;
end
end
end
OUT_TPV(d,1)=log10(T.TPV(i));
end
end

d=0;
for i=1:1958
if T.DRV(i)~=0
d=d+1; 
S= T.CompMutList(i);
S=convertStringsToChars(S);
[V]=str_char_improved(S);
for k=1:length(V)
z=z+1;
for j=1:498
if convertCharsToStrings(W{j})==convertCharsToStrings(V{k})           
INP_DRV(j,d)=1;
end
end
end
OUT_DRV(d,1)=log10(T.DRV(i));
end

end
m=size(INP,2);

DATAATV=[OUT_ATV;INP_ATV];
DATADRV=[OUT_DRV;INP_DRV];
DATAFPV=[OUT_FPV;INP_FPV];
DATAIDV=[OUT_IDV;INP_IDV];
DATALPV=[OUT_LPV;INP_LPV];
DATANFV=[OUT_NFV;INP_NFV];
DATASQV=[OUT_SQV;INP_SQV];
DATATPV=[OUT_TPV;INP_TPV];

save('Data','DATAATV','DATADRV','DATAFPV','DATAIDV','DATALPV','DATANFV','DATASQV','DATATPV');
