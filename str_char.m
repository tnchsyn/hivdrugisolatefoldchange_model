function [V]=str_char(H)

m=find(H==',');
p=find(H=='*');
H(p)=[];
z=0;
if m>=1
    
for i=1:length(m)+1
    
    if i==1
        R=H(1:m(i)-1);
        s=double(R);
        ss=find(s>=65 & s<=90);
        if length(ss)>2
            for q=1:length(ss)-1
             z=z+1;
             W=R;
             h=length(R);
             t=h-(length(ss)-1)+1:h;
             W(setdiff(t,h-q+1))=[];
             V{z}=W;   
            end
            
        else
 z=z+1;
 V{z}=R;
        end
    elseif i>1 && i<length(m)+1
                R=H(m(i-1)+1:m(i)-1);
        s=double(R);
        ss=find(s>=65 & s<=90);
        if length(ss)>2
            for q=1:length(ss)-1
             z=z+1;
             W=R;
             h=length(R);
             t=h-(length(ss)-1)+1:h;
             W(setdiff(t,h-q+1))=[];
             V{z}=W;   
            end
                    else
                           z=z+1;
 V{z}=R;
        end
        
    else 
        R=H(m(end)+1:end);
        s=double(R);
        ss=find(s>=65 & s<=90);
        if length(ss)>2
            for q=1:length(ss)-1
             z=z+1;
             W=R;
             h=length(R);
             t=h-(length(ss)-1)+1:h;
             W(setdiff(t,h-q+1))=[];
             V{z}=W;   
            end
                    else
                           z=z+1;
 V{z}=R;
        end       
        
    end

end

else
        R=H;
        s=double(R);
        ss=find(s>=65 & s<=90);
        if length(ss)>2
            for q=1:length(ss)-1
             z=z+1;
             W=R;
             h=length(R);
             t=h-(length(ss)-1)+1:h;
             W(setdiff(t,h-q+1))=[];
             V{z}=W;   
            end
                    else
                           z=z+1;
 V{z}=R;
        end     
end

for i=1:z
   A=V{i};
   A(find(A==',' | A==' '))=[];
   V{i}=A;
end

end