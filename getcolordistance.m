function colorDist = getcolordistance(img1, img2)

    [m1, n1, k] = size(img1);
    [m2, n2, k] = size(img2);

    imgR1 = img1(:, :, 1);
    imgG1 = img1(:, :, 2);
    imgB1 = img1(:, :, 3);

    imgR2 = img2(:, :, 1);
    imgG2 = img2(:, :, 2);
    imgB2 = img2(:, :, 3);

    imgR1 = im2double(imgR1);
    imgG1 = im2double(imgG1);
    imgB1 = im2double(imgB1);

    imgR2 = im2double(imgR2);
    imgG2 = im2double(imgG2);
    imgB2 = im2double(imgB2);

    numZR1 = imgR1(imgR1==0);
    numZG1 = imgG1(imgG1==0);
    numZB1 = imgB1(imgB1==0);

    numZR2 = imgR2(imgR2==0);
    numZG2 = imgG2(imgG2==0);
    numZB2 = imgB2(imgB2==0);

    numZR1 = size(numZR1);
    numZR1 = numZR1(1);
    numZG1 = size(numZG1);
    numZG1 = numZG1(1);
    numZB1 = size(numZB1);
    numZB1 = numZB1(1);

    numZR2 = size(numZR2);
    numZR2 = numZR2(1);
    numZG2 = size(numZG2);
    numZG2 = numZG2(1);
    numZB2 = size(numZB2);
    numZB2 = numZB2(1);

    Rmean1 = (sum(sum(imgR1)))/(m1*n1-numZR1);
    Gmean1 = (sum(sum(imgG1)))/(m1*n1-numZG1);
    Bmean1 = (sum(sum(imgB1)))/(m1*n1-numZB1);

    Rmean2 = (sum(sum(imgR2)))/(m2*n2-numZR2);
    Gmean2 = (sum(sum(imgG2)))/(m2*n2-numZG2);
    Bmean2 = (sum(sum(imgB2)))/(m2*n2-numZB2);

    colorDist = sqrt((Rmean1-Rmean2)^2 + (Gmean1-Gmean2)^2 + (Bmean1-Bmean2)^2);
