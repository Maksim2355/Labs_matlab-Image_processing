function snowGranul(imgPath)
    I = rgb2gray(imread(imgPath));
    claheI = adapthisteq(I,'NumTiles',[10 10]);
    claheI = imadjust(claheI);
    radius_range = 0:22;
    intensity_area = zeros(size(radius_range));
    for counter = radius_range
        remain = imopen(claheI, strel('disk', counter));
        intensity_area(counter + 1) = sum(remain(:));  
    end
    figure
    plot(intensity_area, 'm - *')
    grid on
    title('Sum of pixel values in opened image versus radius')
    xlabel('radius of opening (pixels)')
    ylabel('pixel value sum of opened objects (intensity)')

    intensity_area_prime = diff(intensity_area);
    plot(intensity_area_prime, 'm - *')
    grid on
    title('Granulometry (Size Distribution) of Snowflakes')
    ax = gca;
    ax.XTick = [0 2 4 6 8 10 12 14 16 18 20 22];
    xlabel('radius of snowflakes (pixels)')
    ylabel('Sum of pixel values in snowflakes as a function of radius')

    open5 = imopen(claheI,strel('disk', 2));
    open6 = imopen(claheI,strel('disk', 4));
    rad5 = imsubtract(open5,open6);
    imshow(rad5,[])




   
