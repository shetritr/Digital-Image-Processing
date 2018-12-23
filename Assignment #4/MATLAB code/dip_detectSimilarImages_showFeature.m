%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function [] = dip_detectSimilarImages_showFeature(imgs)
% dip_detectSimilarImages_showFeature - Q2.2.4, get a set of images, compute thier SURF properties
% and display the images with the matched features
%   Inputs : imgs - an object conatins all the images for similarity checking
%   Outputs : none, display the results 'on the go'

% Get the original imgae features using SURF
img_mona =rgb2gray(imread("straight_mona.PNG"));
pointsMona = detectSURFFeatures(img_mona,'NumScaleLevels',8);
[featuresStraight, valid_straight] = extractFeatures(img_mona, pointsMona, 'Method','SURF');

% For each image in imgs set object
for i = 1:size(imgs,2)
    name = imgs{i};
    img_check = rgb2gray(imread(imgs{i}));
    
    % Get the imgae features using SURF 
    pointsMonaCheck = detectSURFFeatures(img_check,'NumScaleLevels',8);
    [featuresMonaCheck, valid_cornersMonaCheck] = extractFeatures(img_check, pointsMonaCheck, 'Method','SURF');
   
    % find common features
    indexPairs = matchFeatures(featuresStraight,featuresMonaCheck) ;
    
    % find common features locations (x,y)
    matchedPoints1 = valid_straight(indexPairs(:,1));
    matchedPoints2 = valid_cornersMonaCheck(indexPairs(:,2));    
    
    figure; showMatchedFeatures(img_mona,img_check,matchedPoints1,matchedPoints2,'montage');
    legend('matched points 1','matched points 2');   
    s = strcat('Q2 : ',name);
    title (s,'Interpreter','none');
end
end