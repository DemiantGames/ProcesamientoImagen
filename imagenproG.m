video=videoinput('macvideo',1,'YCbCr422_1280x720');
Fuente=getselectedsource(video);
preview(video)
imaggen=getsnapshot(video);
s=ycbcr2rgb(imaggen);
gris=rgb2gray(s);
figure(1)
imshow(s)
figure(2)
imshow(gris)
