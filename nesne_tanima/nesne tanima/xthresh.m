function im = xthresh(I)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(I);

im=zeros(r,c);

for i=1:1:r
    for j=1:1:c
        if I(i,j)>105
            
            im(i,j)=1;
        
        end
     end
end

im = bwareaopen(im,5);
im = imfill(im,'holes');

end

