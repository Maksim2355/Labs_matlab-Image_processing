function findGradientAndDirection(imgPath)
    img = rgb2gray(imread(imgPath));
    [Gx,Gy] = imgradientxy(img);
    imshow(Gdir);
