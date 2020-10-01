function toNegative(img)
    imgRgb = rgb2gray(imread(img));
    imgNegative = uint8(255 - double(imgRgb));
    imshow(imgNegative), title('Negative img');