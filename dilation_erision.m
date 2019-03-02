function [orj_bnry,dilation,erision] = dilation_erision(konum)
%%dilation
%% binary'e cevir
%rgb=imread(konum);
rgb=konum;
orj_bnry=zeros(size(rgb,1),size(rgb,2));
for i=1:1:size(rgb,1)
    for j=1:1:size(rgb,2)
        
       if rgb(i,j,1)>0
          orj_bnry(i,j)=1;
       end
    end
end
%% dilation islemi
%{
         0 1 0
         1 1 1
         0 1 0
%}
dilation=ones(size(orj_bnry,1),size(orj_bnry,2));
for i=1:1:size(orj_bnry,1)
    for j=1:1:size(orj_bnry,2)
        if orj_bnry(i,j)==0
            if i==1 
                ust = 0;
                alt = 1;
            elseif i==size(orj_bnry,1)
                ust = 1;
                alt = 0;
            else
                ust = 1;
                alt = 1; 
            end
            if j==1
                sol = 0;
                sag = 1;
            elseif j== size(orj_bnry,2)
                sol = 1;
                sag = 0;
            else
                sol=1;
                sag=1;
            end
            dilation(i,j)=0;
            dilation(i-ust,j)=0;    %ust
            dilation(i+alt,j)=0;    %alt
            dilation(i,j-sol)=0;    %sol
            dilation(i,j+sag)=0;    %sag
            
        end
    end
end

%% erision

%  0 1 0
%  1 1 1
%  0 1 0
erision=ones(size(orj_bnry,1),size(orj_bnry,2));
for i=1:1:size(orj_bnry,1)
    for j=1:1:size(orj_bnry,2)
        if orj_bnry(i,j)==0 
            if i==1 
                ust = 0;
                alt = 1;
            elseif i==size(orj_bnry,1)
                ust = 1;
                alt = 0;
            else
                ust = 1;
                alt = 1; 
            end
            if j==1
                sol = 0;
                sag = 1;
            elseif j== size(orj_bnry,2)
                sol = 1;
                sag = 0;
            else
                sol=1;
                sag=1;
            end
            if (orj_bnry(i+alt,j) + orj_bnry(i-ust,j) + orj_bnry(i,j-sol) + orj_bnry(i,j+sag)) == 0
            erision(i,j)=0;
            end
        end
            
    end
end

%% print
subplot(1,3,1)
imshow(orj_bnry);
title ('orjinal_binary')
subplot(1,3,2)
imshow(dilation);
title ('dilation')
subplot(1,3,3)
imshow(erision);
title ('erision')


end

