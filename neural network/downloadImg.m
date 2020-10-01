function [trainImagesDir, trainImages] = downloadImg()
    imagesDir = 'tempDir';
    exts = {'.jpg','.bmp','.png'};
    
    trainImagesDir = fullfile(imagesDir,'images','02');
    trainImages = imageDatastore(trainImagesDir,'FileExtensions',exts);