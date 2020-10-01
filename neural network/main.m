[trainImagesDir, pristineImages] = downloadImg();

[upsampledDirName, residualDirName] = initData(trainImagesDir);

[dsTrain] = createProcessingPipeline(upsampledDirName, residualDirName);

layers = configurationVdsrLayer();

maxEpochs = 100;
epochIntervals = 1;
initLearningRate = 0.1;
learningRateFactor = 0.1;
l2reg = 0.0001;
miniBatchSize = 64;
options = trainingOptions('sgdm', ...
    'Momentum',0.9, ...
    'InitialLearnRate',initLearningRate, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',10, ...
    'LearnRateDropFactor',learningRateFactor, ...
    'L2Regularization',l2reg, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThresholdMethod','l2norm', ...
    'GradientThreshold',0.01, ...
    'Plots','training-progress', ...
    'Verbose',false);

[net] = netwrokTraining(dsTrain, layers, options);

Ireference = readimage('maksimka.jpg');
Ireference = im2double(Ireference);

scaleFactor = 0.25;
Ilowres = imresize(Ireference,scaleFactor,'bicubic');

Iycbcr = rgb2ycbcr(Ilowres);
Iy = Iycbcr(:,:,1);
Icb = Iycbcr(:,:,2);
Icr = Iycbcr(:,:,3);

Iy_bicubic = imresize(Iy,[nrows ncols],'bicubic');
Icb_bicubic = imresize(Icb,[nrows ncols],'bicubic');
Icr_bicubic = imresize(Icr,[nrows ncols],'bicubic');

Iresidual = activations(net,Iy_bicubic,41);
Iresidual = double(Iresidual);

Isr = Iy_bicubic + Iresidual;

Ivdsr = ycbcr2rgb(cat(3,Isr,Icb_bicubic,Icr_bicubic));
imshow(Ivdsr)
title('High-Resolution Image Obtained Using VDSR')


