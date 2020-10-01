function defRoundObj(imgPath)
    img = rgb2gray(imread(imgPath));
    bw = imbinarize(img);
    bw = bwareaopen(bw,10);

    bw = imfill(bw, 'holes');
    
    [B,L] = bwboundaries(bw, 'noholes');
    
    imshow(label2rgb(L, @jet, [.5 .5 .5]))
    hold on
    
    imshow(bw);
    