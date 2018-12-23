%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function [teta] = dip_straight(img1,img2,features1 ,features2, valid_corners1 ,valid_corners2)
% dip_straight - Q2.1.5, get 2 images and thier SURF properties and returns the angle
% differnece between this 2 images.
%   Inputs : img1 - grayscale image A
%            img2 - grayscale image B
%            features1 - first object returns from SURF on image A using
%            'detectSURFFeatures'
%            features2 - first object returns from SURF on image B using
%            'detectSURFFeatures' 
%            valid_corners1 - second object returns from SURF on image A using
%            'detectSURFFeatures'
%            valid_corners2 - second object returns from SURF on image B using
%            'detectSURFFeatures'
%   Outputs : teta - Angle diffrence between image A and B

% Get match features
indexPairs = matchFeatures(features1,features2) ;
matchedPoints1 = valid_corners1(indexPairs(:,1));
matchedPoints2 = valid_corners2(indexPairs(:,2));

% show matched features
figure; showMatchedFeatures(img1,img2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');
title('straight algorithem - matched points');

% get (x,y) location for each feature
a = matchedPoints1.Location;
b = matchedPoints2.Location;
array = zeros(size(a,1),1);

% compute the angle differnece between each common feature
for i = 1 : 12
    Ma = (a(i,2) - a(i+1,2))/(a(i,1) - a(i+1,1));
    Mb = (b(i,2) - b(i+1,2))/(b(i,1) - b(i+1,1));
    anMa = atan(Ma)*180/pi;
    anMb = atan(Mb)*180/pi;
    array(i) = (anMb - anMa);  
end
array = sort(array);

% output the median angle differnece of all common features, avoid error
% margins
teta = array(floor(size(array,1)/2));
end