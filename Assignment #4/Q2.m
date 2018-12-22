%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q2.3
img_mona = imread('mona_org.jpg');
img_crooked = imread('crooked_mona.jpg');

figure;
imshow(img_mona)
title ('Q2 :  mona image')

figure;
imshow(img_crooked)
title ('Q2 :  crooked mona image')


%% Q2.4
pointsMona = detectSURFFeatures(rgb2gray(img_mona));
pointsMonaCrooked = detectSURFFeatures(img_crooked);
[featuresMona, valid_cornersMona] = extractFeatures(rgb2gray(img_mona), pointsMona, 'Method','SURF');
[featuresMonaCrooked, valid_cornersMonaCrooked] = extractFeatures(img_crooked, pointsMonaCrooked, 'Method','SURF');



figure;
imshow(img_mona);hold on;
plot(valid_cornersMona.selectStrongest(10));
title ('Q2 :  mona image')

figure;
imshow(img_crooked);hold on;
plot(valid_cornersMonaCrooked.selectStrongest(10));
title ('Q2 :  crooked mona image')

%% Q2.5

[tata] = straight(img_mona,img_crooked,featuresMona ,featuresMonaCrooked, valid_cornersMona ,valid_cornersMonaCrooked);
Rimg = imrotate(img_crooked,tata);

figure;
imshow(Rimg);hold on;
title ('Q2 :  crooked mona image')




%% Q2 part 2
%% 1
imgs = unzip("Monas");

Q2part2(imgs);

%% 2

Q2part2_2(imgs)


