function [i1,i2,i3,i4] = divideimage(i)

    i1 = i(1:floor(size(i,1)/2), 1:floor(size(i,2)/2), :);
    i2 = i(1:floor(size(i,1)/2), floor(size(i,2)/2)+1:size(i,2), :);
    i3 = i(floor(size(i,1)/2)+1:size(i,1), 1:floor(size(i,2)/2), :);
    i4 = i(floor(size(i,1)/2)+1:size(i,1), floor(size(i1,2)/2)+1:size(i,2), :);
    
    
