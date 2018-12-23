%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q2.1.3

% Read the images
img_mona = imread('mona_org.jpg');
img_crooked = imread('crooked_mona.jpg');

% Show the images
figure;
imshow(img_mona)
title ('Q2.1.3 : mona orginal image')

figure;
imshow(img_crooked)
title ('Q2.1.3 : crooked mona image')

%% Q2.1.4

% Get the imgae features using SURF
pointsMona = detectSURFFeatures(rgb2gray(img_mona));
pointsMonaCrooked = detectSURFFeatures(img_crooked);

% Extract top features
[featuresMona, valid_cornersMona] = extractFeatures(rgb2gray(img_mona), pointsMona, 'Method','SURF');
[featuresMonaCrooked, valid_cornersMonaCrooked] = extractFeatures(img_crooked, pointsMonaCrooked, 'Method','SURF');

% Plot strongest features
figure;
imshow(img_mona);hold on;
plot(valid_cornersMona.selectStrongest(10));
title ('Q2.1.4 : 10 strongest feaures extracted using SURF - mona image')

figure;
imshow(img_crooked);hold on;
plot(valid_cornersMonaCrooked.selectStrongest(10));
title ('Q2.1.4 : 10 strongest feaures extracted using SURF - crooked mona image')

%% Q2.1.5
% Get the diffrence angle
[teta] = dip_straight(img_mona,img_crooked,featuresMona ,featuresMonaCrooked, valid_cornersMona ,valid_cornersMonaCrooked);

% Rotate the crooked image by teta
Rimg = imrotate(img_crooked,teta);

figure;
imshow(Rimg);hold on;
title ('Q2.1.5 : straighten crooked mona image')
%% 2.2.3
imgs = unzip("Monas");
dip_detectSimilarImages(imgs);
%% 2.2.4
dip_detectSimilarImages_showFeature(imgs)

%% 2.2.5 - analysis
img_mona =rgb2gray(imread("Mona4_Y.jpg"));
pointsMona = detectSURFFeatures(img_mona);
[featuresMona, valid_cornersMona] = extractFeatures(img_mona, pointsMona, 'Method','SURF');

figure;
imshow(img_mona);hold on;
plot(valid_cornersMona.selectStrongest(10));
title ('Q2.2.5 : 10 strongest feaures extracted using SURF - mona 4 image - analysis')

img_mona =rgb2gray(imread("straight_mona.png"));
pointsMona = detectSURFFeatures(img_mona);
[featuresMona, valid_cornersMona] = extractFeatures(img_mona, pointsMona, 'Method','SURF');

figure;
imshow(img_mona);hold on;
plot(valid_cornersMona.selectStrongest(10));
title ('Q2.2.5 : 10 strongest feaures extracted using SURF - original mona image - analysis')