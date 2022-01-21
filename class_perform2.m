function [ACC,SENS,SPE]=class_perform2(YP,YD)

PS=length(find(YD==1));
NS=length(find(YD==0));
TP=0;TN=0;
for i=1:length(YD)
   
    if YD(i)==1 && YP(i)==1
        TP=TP+1;
        
    elseif YD(i)==0 && YP(i)==0 
        TN=TN+1;
        
    end
    
end

ACC(1,1)=length(find(YP-YD==0));
ACC(1,2)=length(YD);

SENS(1,1)=TP;
SENS(1,2)=PS;

SPE(1,1)=TN;
SPE(1,2)=NS;

end

    