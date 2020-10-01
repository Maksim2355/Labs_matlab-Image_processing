function imprLowLightImg(imgPath)
    img = imread(imgPath);
    AInv = imcomplement(img);
    BInv = imreducehaze(AInv);
    imgInv = imcomplement(BInv);
    figure, montage({img, imgInv}); 