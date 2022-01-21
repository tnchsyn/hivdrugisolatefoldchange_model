clc
clear

load('Final.mat');
Final=Final'; 
load('CP.mat');
F=Final;    

for i=1:8
    
Final=F;    
Test=Final(:,CP(i,1):CP(i,2));
Final(:,CP(i,1):CP(i,2))=[];

Xtrain=Final(2:end,:);
Ytrain=Final(1,:);

Xtest=Test(2:end,:);
Ytest=Test(1,:);
N=5;
    
       for m=1:100
           BESTPER=10^5;
   for s=1:50

x = Xtrain;
t = Ytrain;

trainFcn = 'trainscg';  
hiddenLayerSize = N;
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'mapminmax'};
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;
net.trainParam.min_grad=10^-10;
net.trainParam.epochs=1000;

%If there is no available GPU, please use only [net,tr] = train(net,x,t) to
%train on CPU.
[net,tr] = train(net,x,t,'useGPU','yes');

y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
% 
% % Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
% 
OutTestTargets=net(Xtest);
trainPerformance = perform(net,trainTargets,y);
valPerformance = perform(net,valTargets,y);
testPerformance = perform(net,testTargets,y);
OuttestPerformance(i,m,s) = perform(net,OutTestTargets,Ytest);
CC1=corrcoef(OutTestTargets,Ytest);
TR2(i,m,s)=CC1(1,2).^2;
ALL_X=F(2:end,:);
ALL_Y=F(1,:);
CCALL=corrcoef(net(ALL_X),ALL_Y);
WR2(i,m,s)=CCALL(1,2).^2;
Wper(i,m,s)=mse(net(ALL_X),ALL_Y);

if OuttestPerformance(i,m,s)<BESTPER
BESTPER=OuttestPerformance(i,m,s);
BESTN=N;
BESTNET=net;
BEST_TEST_R2=TR2(i,m,s);
BEST_WHOLE_R2=WR2(i,m,s);
BESTPERWHOLE=Wper(i,m,s);
end   
COL_BESTPER(i,m)=BESTPER;
COL_WBESTPER(i,m)=BESTPERWHOLE;
COL_BESTN(i,m)=BESTN;
COL_BESTNET{i,m}=BESTNET;
COL_BESTR2(i,m,1)=BEST_TEST_R2;
COL_BESTR2(i,m,2)=BEST_WHOLE_R2;
   end

       end
end
save('SUMMARY')