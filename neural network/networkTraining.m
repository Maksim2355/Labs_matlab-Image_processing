function [net] = networkTraining(dsTrain, layers, options)
    modelDateTime = datestr(now,'dd-mmm-yyyy-HH-MM-SS');
    net = trainNetwork(dsTrain, layers ,options);
    save(['trainedVDSR-' modelDateTime '-Epoch-' num2str(maxEpochs*epochIntervals) '-ScaleFactors-' num2str(234) '.mat'],'net','options');
end

