clc
clear

load('Data')
load('Red_Morgan.mat');
Final=[];

MutZ=DATAATV';
RDZ=Morgan(1,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(1,1)=1;
CP(1,2)=size(RDZ,1);

MutZ=DATADRV';
RDZ=Morgan(2,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(2,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(2,2)=size(Final,1);


MutZ=DATAFPV';
RDZ=Morgan(3,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(3,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(3,2)=size(Final,1);


MutZ=DATAIDV';
RDZ=Morgan(4,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(4,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(4,2)=size(Final,1);

MutZ=DATALPV';
RDZ=Morgan(5,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(5,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(5,2)=size(Final,1);


MutZ=DATANFV';
RDZ=Morgan(6,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(6,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(6,2)=size(Final,1);


MutZ=DATASQV';
RDZ=Morgan(7,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(7,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(7,2)=size(Final,1);


MutZ=DATATPV';
RDZ=Morgan(8,:);
RDZ=repmat(RDZ,size(MutZ,1),1);
RDZ=[MutZ,RDZ];
CP(8,1)=size(Final,1)+1;
Final=cat(1,Final,RDZ);
Final(sum(isinf(Final),2)>0,:)=[];
CP(8,2)=size(Final,1);
