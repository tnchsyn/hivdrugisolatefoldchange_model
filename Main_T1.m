clc
clear

load('SUMMARY.mat');
Final=F;

for i=1:8
D{i}=Final(:,CP(i,1):CP(i,2));
end

N={'ATV','DRV','FPV','IDV','LPV','NFV','SQV','TPV'};

for i=1:8

RDZ=D{i}';
%for net
YTEST=RDZ(:,1);
RDZLN=RDZ(:,2:end);

S=zeros(1,size(RDZLN,1));
for jj=1:100
net=COL_BESTNET{i,jj};
S=S+net(RDZLN');
end
OUT1=S./100;

T_MSE(i,1)=mse(YTEST,OUT1');
C=corrcoef(YTEST,OUT1');
T_R2(i,1) = C(1,2).^2;

S=zeros(1,size(Final,2));
FF=Final;
FF(1,:)=[];
for jj=1:100
net=COL_BESTNET{i,jj};  
S=S+net(FF);
end
OUT1=S./100;

W_MSE(i,1)=mse(OUT1,Final(1,:));
C=corrcoef(Final(1,:),OUT1);
W_R2(i,1) = C(1,2).^2;

end      

