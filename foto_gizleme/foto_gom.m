
%% foto gizleme
[crypto]= foto_gizle('sahmeran.jpg','zarok.jpg',1); % 1 --> red'e  sakla

imshow(crypto);
%imwrite(crypto,'sakli.png');
%% foto cozme
%crypto=imread('sakli.png');
for i=1:1:size(crypto,1)
    for j=1:1:size(crypto,2)
         if mod(crypto(i,j,1),2) > 0
          sakli(i,j)=1;
         else
             sakli(i,j)=0;
         end
        
    end
end
imshow(sakli);


