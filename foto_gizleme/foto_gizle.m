function [crypt_img] = foto_gizle(ana_foto,gizli_foto,k)
%% gomulecek fotoyu binary yap
% ana_rgb nin boytu gizli_foto dan buyuk olamalidir
% bu kod istege bagli olarak r,g ve b nin LSB bitine saklamaktadır
% k=1 icin --> red
% k=2 icin --> green
% k=3 icin --> blue
ana_rgb=imread(ana_foto);
%imshow(ana_rgb);

gizli_rgb=imread(gizli_foto);

gizli_bnr=zeros(size(gizli_rgb,1),size(gizli_rgb,2));
for i=1:1:size(gizli_rgb,1)
    for j=1:1:size(gizli_rgb,2)
        
       if gizli_rgb(i,j,1)>127
          gizli_bnr(i,j)=1;
       end
    end
end

%% fotoyu sakla
crypt_img=ana_rgb;
bas_i=round((size(crypt_img,1)-size(gizli_bnr,1))/2); % ortaya saklamak icin
bas_j=round((size(crypt_img,2)-size(gizli_bnr,2))/2);  
for i=bas_i:1:(size(gizli_bnr,1)+size(crypt_img,1))/2 -1  %  -1 ---> dizi boyutu asmamasi icin
    for j=bas_j:1:(size(gizli_bnr,2)+size(crypt_img,2))/2 -1 
         if mod(gizli_bnr(i-bas_i+1,j-bas_j+1),2)~= mod(crypt_img(i,j,k),2)
        crypt_img(i,j,k)=crypt_img(i,j,k)+1;
         end
    end
end
%imshow(crypt_img);


%% 
%imwrite(crypt_img,'crypto.png');


end

