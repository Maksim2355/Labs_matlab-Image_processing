function editContrastAndShowImg(imgName)
    img = imread(imgName);
    editImg = histeq(img);
    imshow(editImg);
    