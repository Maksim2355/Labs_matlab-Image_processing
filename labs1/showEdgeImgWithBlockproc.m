function showEdgeImgWithBlockproc(imgName)
    img = rgb2gray(imread(imgName));
    edgeFun = @(block_struct) edge(block_struct.data); 
    block_size = [40 40]; 
    border_size = [140 140]; 
    block_edges = blockproc(img, block_size ,edgeFun, 'BorderSize', border_size);
    imshow(block_edges) 