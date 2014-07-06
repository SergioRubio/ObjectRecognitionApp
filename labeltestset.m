function [labels, confmat] = labeltestset()

    run('VLFEATROOT/toolbox/vl_setup');
    
    back = imread('back.jpg');
    
    reallabels = [1,1,19,19,2,2,2,3,3,3,4,4,4,6,6,6,6,5,5,5,8,8,8,9,9,9,7,7,10,10,10,11,11,12,12,13,13,13,15,15,16,16,17,17,17,18,18,18,21,21,21,23,23,14,14,22,22];
    
    for pos=1:57
        im = imread(strcat('Test/Test (', num2str(pos), ').jpg'));
        
        label = labelim(im, back);
        labels(pos) = label;
    end;
    
    confmat = confusionmat(reallabels, labels);
