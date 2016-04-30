video=videoinput('macvideo',1,'YCbCr422_1280x720');
Fuente=getselectedsource(video);
c=1;
%preview(video)
while c==1
imaggen=getsnapshot(video);
s=ycbcr2rgb(imaggen);
gris=rgb2gray(s);
binari=im2bw(gris,0.5);
figure(1)
imshow(s)
figure(2)
imshow(binari)
end