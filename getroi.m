function imroi = getroi(im, back, th1, th2)
            
    imSize = size(im);

    backMinHist = min(min(back));
    backMaxHist = max(max(back));
        
    resPos = im2uint8(zeros(imSize(1), imSize(2), imSize(3)));
        
    for x=1:imSize(1)
        for y=1:imSize(2)

            if (((im(x,y,1) >= backMinHist(1)-th1) && (im(x,y,1) <= backMaxHist(1))+th2) && ((im(x,y,2) >= backMinHist(2)-th1) && (im(x,y,2) <= backMaxHist(2)+th2)) && ((im(x,y,3) >= backMinHist(3)-th1) && (im(x,y,3) <= backMaxHist(3)+th2)))
                resPos(x, y, 1) = 0;
                resPos(x, y, 2) = 0;
                resPos(x, y, 3) = 0;
            else
                resPos(x, y, 1) = im(x, y, 1);
                resPos(x, y, 2) = im(x, y, 2);
                resPos(x, y, 3) = im(x, y, 3);
            end;
        end;
    end;
        
    resPos = imopen(resPos, strel('disk',1));
    
    vMin = 0;
    hMin = 0;
    vMinSet = 0;
    hMinSet = 0;
        
    for v=1:imSize(1)

        if ((vMinSet == 0) && (sum(resPos(v,:)) >= 50))
            vMin = v;
            vMinSet = 1;
        end;
    end;
                
    for h=1:imSize(2)

        if ((hMinSet == 0) && (sum(resPos(:,h)) >= 50))
            hMin = h;
            hMinSet = 1;
        end;
    end;

    vMax = 0;
    hMax = 0;
    vMaxSet = 0;
    hMaxSet = 0;
    
    if vMin == 0
        vMin = 1;
    end;
    
    for v=imSize(1):-1:vMin

        if ((vMaxSet == 0) && (sum(resPos(v,:)) >= 50))
            vMax = v;
            vMaxSet = 1;
        end;
    end;
    
    if hMin == 0
        hMin = 1;
    end;
    
    for h=imSize(2):-1:hMin
        
        if ((hMaxSet == 0) && (sum(resPos(:,h)) >= 50))
            hMax = h;
            hMaxSet = 1;
        end;
    end;
        
    result = im2uint8(zeros(vMax-vMin+1, hMax-hMin+1, 3));
        
    result(:,:,1) = resPos(vMin:vMax,hMin:hMax,1);
    result(:,:,2) = resPos(vMin:vMax,hMin:hMax,2);
    result(:,:,3) = resPos(vMin:vMax,hMin:hMax,3);
    
    imroi = result;
