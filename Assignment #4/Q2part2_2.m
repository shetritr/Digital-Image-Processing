function [] = Q2part2_2(imgs)

img_mona =rgb2gray(imread("straight_mona.PNG"));
pointsMona = detectSURFFeatures(img_mona,'NumScaleLevels',8);
[featuresStraight, valid_straight] = extractFeatures(img_mona, pointsMona, 'Method','SURF');



for i = 1:size(imgs,2)
    name = imgs{i};
    img_check = rgb2gray(imread(imgs{i}));
    pointsMonaCheck = detectSURFFeatures(img_check,'NumScaleLevels',8);
    [featuresMonaCheck, valid_cornersMonaCheck] = extractFeatures(img_check, pointsMonaCheck, 'Method','SURF');
    indexPairs = matchFeatures(featuresStraight,featuresMonaCheck) ;
    matchedPoints1 = valid_straight(indexPairs(:,1));
    matchedPoints2 = valid_cornersMonaCheck(indexPairs(:,2));
    
    
    figure; showMatchedFeatures(img_mona,img_check,matchedPoints1,matchedPoints2,'montage');
    legend('matched points 1','matched points 2');   
    s = strcat('Q2 : ',name);
    title (s,'Interpreter','none');
end
end

