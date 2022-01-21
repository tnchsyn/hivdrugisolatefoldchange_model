clc
clear

load('SUMMARY.mat');
Final=F;

for i=1:8
C{i}=Final(:,CP(i,1):CP(i,2));
end

N={'ATV','DRV','FPV','IDV','LPV','NFV','SQV','TPV'};

for i=1:8

RDZ=C{i}';
%for net
YTEST=RDZ(:,1);
RDZLN=RDZ(:,2:end);

S=zeros(1,size(RDZLN,1));
for jj=1:100
net=COL_BESTNET{i,jj};
S=S+net(RDZLN');
end
OUT1=S/100;

subplot(2,4,i)
plot(YTEST,OUT1','.');
hold on
plot(YTEST,YTEST,'LineWidth',2);
xlabel('Data');
ylabel('Prediction');
grid on
% axis square

R = corrcoef(YTEST,OUT1');
tit2=sprintf('%s; R^2=%0.3f',N{i},R(1,2).^2);
title(tit2);
% D=sprintf('FIGURE_%s.png',N{i});
% saveas(gca,D);
% clf
%[mean(OUT1),mean(OUT2)]

end      

