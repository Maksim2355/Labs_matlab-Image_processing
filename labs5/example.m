function example(imgPath, scale, theta)
    original = imread(imgPath);
    distorted = imresize(original,scale); % Try varying the scale factor.
    distorted = imrotate(distorted,theta); % Try varying the angle,
    
    movingPoints = [151.52 164.79; 131.40 79.04];
    fixedPoints = [135.26 200.15; 170.30 79.30];
    cpselect(distorted,original,movingPoints,fixedPoints);
    tform = fitgeotrans(movingPoints,fixedPoints,'nonreflectivesimilarity');
    
    sc = scale * cos(theta);
    ss = scale * sin(theta);
    
    tformInv = invert(tform);
    Tinv = tformInv.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scale_recovered = sqrt(ss*ss + sc*sc)
    theta_recovered = atan2(ss,sc)*180/pi

    Roriginal = imref2d(size(original));
    recovered = imwarp(distorted,tform,'OutputView',Roriginal);
    
    montage({original,recovered})
