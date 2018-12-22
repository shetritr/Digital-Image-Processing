function [tata] = straight(img1,img2,features1 ,features2, valid_corners1 ,valid_corners2)
indexPairs = matchFeatures(features1,features2) ;
matchedPoints1 = valid_corners1(indexPairs(:,1));
matchedPoints2 = valid_corners2(indexPairs(:,2));

figure; showMatchedFeatures(img1,img2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

a = matchedPoints1.Location;
b = matchedPoints2.Location;
array = zeros(size(a,1),1);
for i = 1 : 12
    Ma = (a(i,2) - a(i+1,2))/(a(i,1) - a(i+1,1));
    Mb = (b(i,2) - b(i+1,2))/(b(i,1) - b(i+1,1));
    anMa = atan(Ma)*180/pi;
    anMb = atan(Mb)*180/pi;
    array(i) = (anMb - anMa);  
end
array = sort(array);
tata = array(floor(size(array,1)/2));



end

