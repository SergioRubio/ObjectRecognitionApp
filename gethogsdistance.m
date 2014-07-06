function minDtotal = gethogsdistance(im1, im2)
    
    [i11,i12,i13,i14] = divideimage(im1);
    [i21,i22,i23,i24] = divideimage(im2);
    
    i1 = {i11,i12,i13,i14};
    i2 = {i21,i22,i23,i24};
        
    minDtotal = 0;
    
    for x=1:4
        minDx = Inf;
        [c1,n] = imhist(i1{x});
        c1 = c1/size(i1{x},1)/size(i1{x},2);
        
        for y=1:4
            [c2,n2] = imhist(i2{y});
            c2 = c2/size(i2{y},1)/size(i2{y},2);

            d = pdist2(c1',c2');
            
            if d < minDx
                minDx = d;
            end;
        end;
        
        minDtotal = minDtotal + minDx;
    end;


