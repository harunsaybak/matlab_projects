ptt=imread('maze.jpg')

imshow(ptt);
%%

I=rgb2gray(ptt);

im=thresh(I);

cc = bwconncomp(im,8)
n= cc.NumObjects;

k= regionprops(im,'Area','Perimeter','MajorAxisLength','MinorAxisLength',);

area=zeros(n,1);
peri=zeros(n,1);
major=zeros(n,1);
minor=zeros(n,1);

for i=1:n
    grain = false(size(im));
    grain(cc.PixelIdxList{i}) = true;
    figure(i)
   imshow(grain);
    area(i)=k(i).Area;
    peri(i)=k(i).Perimeter;
    major(i)=k(i).MajorAxisLength;
    minor(i)=k(i).MinorAxisLength;
end
%imshow(im)


graindata(1,1)=mean(area);
graindata(2,1)=mean(peri);
graindata(3,1)=mean(major);
graindata(4,1)=mean(minor);