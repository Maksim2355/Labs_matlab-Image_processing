function [firstLayer, middleLayers, finalLayers] = configurationVdsrLayer()
    
    networkDepth = 20;
    firstLayer = imageInputLayer([41 41 1],'Name','InputLayer','Normalization','none');
    
    convLayer = convolution2dLayer(3,64,'Padding',1, ...
         'WeightsInitializer','he','BiasInitializer','zeros','Name','Conv1');
     
    relLayer = reluLayer('Name','ReLU1');
     
    middleLayers = [convLayer relLayer];
    for layerNumber = 2:networkDepth-1
        convLayer = convolution2dLayer(3,64,'Padding',[1 -11], ...
            'WeightsInitializer','he','BiasInitializer','zeros', ...
            'Name',['Conv' num2str(layerNumber)]);

        relLayer = reluLayer('Name',['ReLU' num2str(layerNumber)]);
        middleLayers = [middleLayers, convLayer, relLayer];    
    end
    
    convLayer = convolution2dLayer(3,1,'Padding',[1 1], ...
    'WeightsInitializer','he','BiasInitializer','zeros', ...
    'NumChannels',64,'Name',['Conv' num2str(networkDepth)]);

    finalLayers = [convLayer regressionLayer('Name','FinalRegressionLayer')];

end

