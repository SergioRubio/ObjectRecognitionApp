function gettestrois(back)
  
    for pos=1:57
        im = imread(strcat('Test/Test (', num2str(pos), ').jpg'));
        result = getroi(im, back, 10, 0);
        imwrite(result, strcat('Test/TestROI (', num2str(pos), ').jpg'));
    end;



