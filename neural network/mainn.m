I = imread("maksimka.jpg");


fig = figure;
ax = axes;
img = imshow(I);
pixregionobj = impixelregionpanel(fig,img);

set(ax,'Units','normalized','Position',[0 .5 1 .5]);
set(pixregionobj,'Units','normalized','Position',[0 .04 1 .4]);