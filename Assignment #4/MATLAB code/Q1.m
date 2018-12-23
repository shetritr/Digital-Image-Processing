%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q1 Edge Detection
% Q1.1
% Read the image named tire.tif. Normalize the image between [0; 1]. This image is built-in into MAT-
% LAB, you can simply read it by writing the line imread('tire.tif '). For those of you who will not be
% able to do it, the image is added to the exercise file.
img = double(imread('tire.tif'))/256;
figure;
imshow(img,[0 1])
title ('Q1.1:  MATLAB tire image')

%% Q1.2 Roberts Edge Detector

I1 = dip_roberts_edge(img,0.05);
figure;
imshow(I1,[0 1])
title ('Q1.2 : Roberts Edge Detector, threshold = 0.05')

I2 = dip_roberts_edge(img,0.08);
figure;
imshow(I2,[0 1])
title ('Q1.2 : Roberts Edge Detector, threshold = 0.08')

I3 = dip_roberts_edge(img,0.1);
figure;
imshow(I3,[0 1])
title ('Q1.2 : Roberts Edge Detector, threshold = 0.1')

%% Q1.3.2 Prewitt Edge Detector

I1 = dip_prewitt_edge(img,0.05);
figure;
imshow(I1,[])
title ('Q1.3.2 : Prewitt Edge Detector, threshold = 0.05')

I2 = dip_prewitt_edge(img,0.1);
figure;
imshow(I2,[])
title ('Q1.3.2 : Prewitt Edge Detector, threshold = 0.1')

%% Q1.3.4 
img_noise = imnoise(img,'gaussian');
figure;
imshow(img_noise,[0 1])
title ('Q1.3.4 : gaussian noised tire image')

%% Q1.3.5

Iprewitt = dip_prewitt_edge(img_noise,0.1);
figure;
imshow(Iprewitt,[])
title ('Q1.3.5 : Prewitt Edge Detector, threshold = 0.1, noise = gaussian')

Iroberts = dip_roberts_edge(img_noise,0.1);
figure;
imshow(Iroberts,[])
title ('Q1.3.5 : Roberts Edge Detector, threshold = 0.1, noise = gaussian')

%% Q1.4 Modified Prewitt Edge Detector
Iprewitt = dip_prewitt_edge(img_noise,0.1);
figure;
imshow(Iprewitt,[])
title ('Q1.4.2 : : Prewitt Edge Detector, threshold = 0.1, noise = gaussian')

Iroberts = dip_prewitt_edge_mod(img_noise,0.1);
figure;
imshow(Iroberts,[])
title ('Q1.4.2 :  modified Prewitt Edge Detector, threshold = 0.1, noise = gaussian')

%% Q1.5 Canny Edge Detector

img_Canny = edge(img,'Canny'); 
figure;
imshow(img_Canny,[])
title ('Q1.5 : Canny Edge Detector using edge function')


img_Prewitt = edge(img,'Prewitt');
figure;
imshow(img_Prewitt,[])
title ('Q1.5 : Prewitt Edge Detector using edge function')

%% Q1.6
imgD = double(imread("diamond.png"))/256; 
imshow(imgD, []);
title ('Q1.6 : Original image of diamond')

[vector,edge_image] = dip_edge_detect(imgD);

figure
imshow(imgD,[]);
rectangle('Position',[vector(1) vector(2)-vector(4) vector(3) vector(4)]);
title ('Q1.6 : Algorithm results')