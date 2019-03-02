%% toplu foto cekme

%I=imread(sprintf('C:/Users/kumar.vaibhav/Documents/MATLAB/Visually Similar Images%d.jpeg',i));
anafile=dir('../nesne tanıma');

file = dir(anafile(3).name);
NF = length(file);
images = cell(NF-3,1);
array= [];

for i=3:1:length(anafile)-2
  
file = dir(anafile(i).name);

NF = length(file);


for k = 1 : NF-3
  
    images{k} = imread(fullfile(anafile(i).name,file(k+3).name));
  
end
   array = [array images];
end

%%
area=cell(1,3);
x=length(array);

for i=1:1:3
    for j=1:1:x
    resim=array{j,i};
    gr=xdegerrr(resim);
    area{i}=[area{i} gr];
    end 
end

%% grfik ciz
tt=1:1:x;

figure
grid on
grid minor

scatter3(area{1}(1,:),area{1}(2,:),area{1}(3,:),'rx')

hold on

grid on
grid minor

scatter3(area{2}(1,:),area{2}(2,:),area{2}(3,:),'go')



grid on
grid minor

scatter3(area{3}(1,:),area{3}(2,:),area{3}(3,:),'bv')

%%
figure
subplot(3,1,1)
plot(tt,area{1}(1,:),'-bx')
title('area')

subplot(3,1,2)
plot(tt,area{2}(1,:),'-gv')
subplot(3,1,3)
plot(tt,area{3}(1,:),'-ro')

figure
subplot(3,1,1)
plot(tt,area{1}(2,:),'-bx')
title('perimeter')

subplot(3,1,2)
plot(tt,area{2}(2,:),'-gv')

subplot(3,1,3)
plot(tt,area{3}(2,:),'-ro')

figure

subplot(3,1,1)
plot(tt,area{1}(3,:),'-bx')
title('major')

subplot(3,1,2)
plot(tt,area{2}(3,:),'-gv')
subplot(3,1,3)
plot(tt,area{3}(3,:),'-ro')


%% siniflandirma

gir=imread('foto');

ortAreaBike=round(mean(area{1}(1,:)));
ortPeriBike=round(mean(area{1}(2,:)));
ortMjBike=round(mean(area{1}(3,:)));
ortMnBike=round(mean(area{1}(4,:)));

bike=[ortAreaBike ortPeriBike ortMjBike ortMnBike]

ortAreaCar=round(mean(area{2}(1,:)));
ortPeriCar=round(mean(area{2}(2,:)));
ortMjCar=round(mean(area{2}(3,:)));
ortMnCar=round(mean(area{2}(4,:)));

car=[ortAreaCar ortPeriCar ortMjCar ortMnCar]
ortAreaPr=round(mean(area{3}(1,:)));
ortPeriPr=round(mean(area{3}(2,:)));
ortMjPr=round(mean(area{3}(3,:)));
ortMnPr=round(mean(area{3}(4,:)));

prs=[ortAreaPr ortPeriPr ortMjPr ortMnPr]


%%
res=array{1,3};

resGr=xdegerrr(res);

resGr=resGr/10;
resGr(1)=resGr(1)/10;


denklem=power(power(car(1)-resGr(1),2)+power(car(2)-resGr(2),2)+power(car(3)-resGr(3),2)+power(car(4)-resGr(4),2),0.5);
denklem2=power(power(bike(1)-resGr(1),2)+power(bike(2)-resGr(2),2)+power(bike(3)-resGr(3),2)+power(bike(4)-resGr(4),2),0.5);
denklem3=power(power(prs(1)-resGr(1),2)+power(prs(2)-resGr(2),2)+power(prs(3)-resGr(3),2)+power(prs(4)-resGr(4),2),0.5);

tm=[denklem denklem2 denklem3]

imshow(res)



%%
te=fopen('veri.txt','w');

fprintf(te,'%d',area{1});

fclose(te);