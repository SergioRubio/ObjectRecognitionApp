function gettraininghogs()
    
    for pos=1:23
        im = imread(strcat('Training/TrainingROI (', num2str(pos), ').jpg'));
        imhog = gethog(im);
        dlmwrite(strcat('Training/TrainingHOG (', num2str(pos), ').txt'), imhog);
        imwrite(imhog, strcat('Training/TrainingHOG (', num2str(pos), ').jpg'));
    end;
