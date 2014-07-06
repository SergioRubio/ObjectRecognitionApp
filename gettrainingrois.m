function gettrainingrois(back)
  
    for pos=1:23
        im = imread(strcat('Training/Training (', num2str(pos), ').jpg'));
        result = getroi(im, back, 10, 0);
        imwrite(result, strcat('Training/TrainingROI (', num2str(pos), ').jpg'));
    end;
