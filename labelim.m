function label = labelim(imroi, imh, back)
    
    d = Inf;
    label = -1;
    
    for pos=1:23
        trainingroi = imread(strcat('Training/TrainingROI (', num2str(pos), ').jpg'));
        trainingh = imread(strcat('Training/TrainingHOG (', num2str(pos), ').jpg'));

        hogDist = gethogsdistance(imh, trainingh);
        colorDist = getcolordistance(imroi, trainingroi);

        dist = 0.9*hogDist + 0.1*colorDist;
        
        if dist < d
            d = dist;
            label = pos;
        end;
    end;
