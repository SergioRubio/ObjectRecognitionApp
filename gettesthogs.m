function gettesthogs()
    
    for pos=1:57
        im = imread(strcat('Test/TestROI (', num2str(pos), ').jpg'));
        imhog = gethog(im);
        dlmwrite(strcat('Test/TestHOG (', num2str(pos), ').txt'), imhog);
        imwrite(imhog, strcat('Test/TestHOG (', num2str(pos), ').jpg'));
    end;
