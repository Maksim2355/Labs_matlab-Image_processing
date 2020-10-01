function algoritmSobel(imgName)
    img = rgb2gray(imread(imgName));
    %%noisyImage = imnoise(img, 'poisson');
    smoothImage = imgaussfilt(img, 3);
    smoothGradient = imgradient(smoothImage,'CentralDifference');
    imshow(smoothGradient, []);