video=videoinput('macvideo',1,'YCbCr422_1280x720');
Fuente=getselectedsource(video);
c=1;
%preview(video)
%while c==1
imaggen=getsnapshot(video);
s=ycbcr2rgb(imaggen);
gris=rgb2gray(s);
imshow(gris)
binari=im2bw(gris,0.02);
binari=fliplr(binari);
rellena=imfill(binari,'holes');



[L Ne]=bwlabel(double(rellena));
prop=regionprops(L,'Area','BoundingBox');
imshow(rellena);hold on

for n=1:size(prop,1) %For 1 to Total number of coins
    cent=prop(n).BoundingBox;
    X=cent(1);Y=cent(2);
    
  
    if prop(n).Area>10000
        text(X,Y,'5 C','Color','red')
        %text(x1,y1,'3 y 4','Color','red')
        
  
    end
end



