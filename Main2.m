clc
clear

load('SUMMARY.mat');
Final=F;

for i=1:8
C{i}=Final(:,CP(i,1):CP(i,2));
end

N={'ATV','DRV','FPV','IDV','LPV','NFV','SQV','TPV'};
m=0;
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
k=k+1;

subplot(8,16,k)
plot(RDZL(:,1),RDZR(:,1),'.');
hold on
plot([-1,2],[-1,2])
set(gca,'FontAngle','italic','FontWeight','bold')
% xlabel(N{j});
% ylabel(N{i});
axis square
title('DATA');

%[mean(RDZL(:,end)),mean(RDZR(:,end))]

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

figure (1)
k=k+1;
subplot(8,16,k)
plot(OUT1,OUT2,'.');
hold on
plot([-1,2],[-1,2])
set(gca,'FontAngle','italic','FontWeight','bold')
% xlabel(N{j});
% ylabel(N{i});
axis square
V1=[RDZL(:,1),RDZR(:,1)];
V2=[OUT1',OUT2'];
R = corr2(V1,V2);
tit2=sprintf('MODEL; R=%0.3f',R);
title(tit2);

% D=sprintf('FIGURE_%s_and_%s.png',N{i},N{j});
% E=sprintf('FIGURE_%s_and_%s.fig',N{i},N{j});
% 
% saveas(gca,D);
% saveas(gca,E);
% 
% clf
%[mean(OUT1),mean(OUT2)]

V1=[RDZL(:,1),RDZR(:,1)];
V2=[OUT1',OUT2'];
H=abs(V1(:,1)-V1(:,2));
Q=H>log10(2);
QQ=find(Q==1);
Q1=V1(QQ,1)>V1(QQ,2);
Q2=V2(QQ,1)>V2(QQ,2);

ACC(i,j)=length(find(Q1-Q2==0))/length(Q1);
DTS(i,j)=length(Q1);
R = corr2(V1,V2);
tit2=sprintf('MODEL; R=%0.3f',R);
title(tit2);
m=m+1;
RVAL(i,j)=R;
RVAL_VEC(m)=R;
% A=[Q1,V2(QQ,1)-V2(QQ,2)];
% B2=A(:,2);
% ObsInt=A(:,1);
% Obs={};
% for i=1:length(ObsInt)
% Obs{i}=num2str(ObsInt(i));
% end
% [X,Y,T,AUC] = perfcurve(Obs,B2,'1');
% figure (2)
% subplot(7,14,k)
% plot(X,Y)
% title(num2str(AUC))

        else
            k=k+2;
        end      
    end
end
