function [upsampledDirName, residualDirName] = initData(trainImagesDir)
    upsampledDirName = [trainImagesDir filesep 'upsampledImages'];
    residualDirName = [trainImagesDir filesep 'residualImages'];
    