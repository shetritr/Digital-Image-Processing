%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q3 Hough Transform
% Q3.1
% Read the circuit.tif image and mormalize it to [0; 1]. This is a Matlab built-in image that you
% don't need to download (read it directly using imread('circuit.tif )).
img = double(imread('circuit.tif'))/255;
figure;
imshow(img,[0 1]);
title ('Q3 :  circuit image');


% Q3.2
% Extract the edges using MATLAB's BW=edge(I) and rotate it
% by 15 degrees using BW=imrotate(BW,15).
BW=edge(img);
figure;
imshow(BW,[0 1]);
title ('Q3 :  edge image');

BW=imrotate(BW,15);
figure;
imshow(BW,[0 1]);
title ('Q3 :  edge rotate image');

% Q3.3
