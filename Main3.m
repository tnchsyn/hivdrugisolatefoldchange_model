clc
clear

load('SUMMARY.mat');
Final=F;

for i=1:8
C{i}=Final(:,CP(i,1):CP(i,2));
end

N={'ATV','DRV','FPV','IDV','LPV','NFV','SQV','TPV'};
m=0;
z=0;
for i=1:8
    k=(i-1)*16;
    for j=1:8
        
        if i~=j
RDZ=C{j}';
RDZ2=C{i}';
W1=RDZ;W1(:,1)=[];
W2=RDZ2;W2(:,1)=[];
[a,b,c]=intersect(W1(:,1:498),W2(:,1:498),'rows');
RDZL=RDZ(b,:);
RDZR=RDZ2(c,:);

VERI(i,j)=length(b);

%for net
RDZLN=RDZ(b,2:end);
RDZRN=RDZ2(c,2:end);
%for net
S1=zeros(1,size(RDZLN,1));
S2=zeros(1,size(RDZRN,1));
for jj=1:100
net1=COL_BESTNET{i,jj};
net2=COL_BESTNET{j,jj};    
S1=S1+net1(RDZLN');
S2=S2+net2(RDZRN');
end
OUT1=S1/100;
OUT2=S2/100;
% 
V1=[RDZL(:,1),RDZR(:,1)];
V2=[OUT1',OUT2'];
H=abs(V1(:,1)-V1(:,2));
Q=H>log10(2);
QQ=find(Q==1);
Q1=V1(QQ,1)>V1(QQ,2);
Q2=V2(QQ,1)>V2(QQ,2);
% ACC(i,j)=length(find(Q1-Q2==0))/length(Q1);
% DTS(i,j)=length(Q1);
R = corr2(V1,V2);

z=z+1;
[Accuracy,Sensitivity,Specifity]=class_perform(Q2,Q1);

ACC(i,j)=Accuracy;
ACC_VEC(z)=Accuracy;

SENS(i,j)=Sensitivity;
SENS_VEC(z)=Sensitivity;

SPE(i,j)=Specifity;
SPE_VEC(z)=Specifity;

[Accuracy,Sensitivity,Specifity]=class_perform2(Q2,Q1);

ACC_C{i,j}=Accuracy;
SENS_C{i,j}=Sensitivity;
SPE_C{i,j}=Specifity;

m=m+1;
RVAL(i,j)=R;
A=[Q1,V2(QQ,1)-V2(QQ,2)];
B2=A(:,2);
ObsInt=A(:,1);
Obs={};
for ii=1:length(ObsInt)
Obs{ii}=num2str(ObsInt(ii));
end
[X,Y,T,AUC] = perfcurve(Obs,B2,'1');

AUCS(i,j)=AUC;
AUCS(z)=AUC;

subplot(8,8,m)
plot(X,Y,'LineWidth',1)
hold on
plot(X,X,'LineWidth',1)
set(gca,'FontAngle','italic','FontWeight','bold')
tit2=sprintf('AUC=%0.3f',AUC);
title(tit2);

        else
            m=m+1;
        end      
    end
end

for i=1:8
    TABLE(3*(i-1)+1:3*(i-1)+3,:)=[ACC(i,:);SENS(i,:);SPE(i,:)];
end
save('Result')
