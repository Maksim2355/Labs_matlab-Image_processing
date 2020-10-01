function blurForDelSmallLine(imgPath)
    I = imread(imgPath);
    background = imopen(I, strel('disk', 15));
    I2 = imsubtract(I,background);
    level = graythresh(I2);
    BW1 = im2bw(I2,level);
    SE = strel('arbitrary',eye(7));
    BW2 = imerode(BW1,SE);
    figure;
    subplot(1,2,1)
    imshow(BW1)
    subplot(1,2,2)
    imshow(BW2);



