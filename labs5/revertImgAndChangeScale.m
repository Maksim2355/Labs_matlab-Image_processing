function revertImgAndChangeScale(imgPath, scale, angle)
    img = imread(imgPath);
    distorted = imresize(img, scale);
    distorted = imrotate(distorted, angle); 
    figure, imshow(distorted);