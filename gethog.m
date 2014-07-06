function imhog = gethog(im)
    
    hog = vl_hog(single(im), 4, 'numOrientations', 2);
    imhog = vl_hog('render', hog, 'numOrientations', 2);
    
    imSize = size(im);
    
    imhog = imresize(imhog, [imSize(1), imSize(2)]);
