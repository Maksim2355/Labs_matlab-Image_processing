function changePositionAndScale(imgPath, scale, theta)
    img = imread(imgPath);
    
    movingPoints = [151.52  164.79; 131.40 79.04];
    fixedPoints = [135.26  200.15; 170.30 79.30];
    tform = fitgeotrans(movingPoints, fixedPoints,'nonreflectivesimilarity');
    
    sc = scale * cos(theta);
    ss  =  scale * sin(theta);
    Tinv = invert(tform);
    
    tformInv = invert(tform);
    Tinv = tformInv.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scale_recovered = sqrt(ss*ss + sc*sc);
    
    theta_recovered = atan2(ss,sc)*180/pi;

    distorted = imresize(img, scale);
    distorted = imrotate(distorted, angle); 
    
    Roriginal = imref2d(size(img));
    recovered = imwarp(distorted, tform,'OutputView', Roriginal);
    
    montage({original,recovered});
    