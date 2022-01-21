clear
load('Morgan.mat');
% Morgan=MorganYeni;
p=0;
for i=1:512
    A=Morgan(1,i);
    k=0;
    for j=2:8
        
        if Morgan(j,i)==A
            k=k+1;
        end
        
    end
if k~=7
    p=p+1;
        map(p)=i;

   MM(:,p)= Morgan(:,i);
end
end
        