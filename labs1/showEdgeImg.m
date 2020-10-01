function showEdgeImg(imgName)
    img = rgb2gray(imread(imgName));
    method = 'canny';
    imgEdge = edge(img, method);
    imshow(imgEdge);