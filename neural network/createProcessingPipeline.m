function [dsTrain] = createProcessingPipeline(upsampledDirName,residualDirName)
    
    upsampledImages = imageDatastore(upsampledDirName,'FileExtensions','.mat','ReadFcn', @matReader);
    residualImages = imageDatastore(residualDirName,'FileExtensions','.mat','ReadFcn', @matReader);
    
    augmenter = imageDataAugmenter( ...
    'RandRotation',@()randi([0,1],1)*90, ...
    'RandXReflection',true);

    patchSize = [41 41];
    patchesPerImage = 64;
    dsTrain = randomPatchExtractionDatastore(upsampledImages,residualImages,patchSize, ...
    "DataAugmentation",augmenter,"PatchesPerImage",patchesPerImage);
end

