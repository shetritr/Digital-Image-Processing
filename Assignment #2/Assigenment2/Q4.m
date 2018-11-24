%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%% Q4 L*a*b
img = double(imread('starry_night.jpg'))/255;

%Q4.2
% Convert the image to L*a*b using MATLAB's 'rgb2lab()' function and
% display the separate channels.
img_lab = rgb2lab(img);
img_L_channel = img_lab(:,:,1);
img_a_channel = img_lab(:,:,2);
img_b_channel = img_lab(:,:,3);
figure; imshow(img_L_channel, []);
title ('Q4.2 : image L channel');
figure; imshow(img_b_channel, []);
title ('Q4.2 : image a channel');
figure; imshow(img_a_channel, []);
title ('Q4.2 : image b channel');

%% Q4.3
% Repeat step 6 from section 1. Display the results using the provided
% 'imshowLab()' function.
% Manipulation 1 : add a constant to L channel
img_L_channel_manipilation_1 = img_L_channel - 20;
img_a_channel_manipilation_1 = img_b_channel;
img_b_channel_manipilation_1 = img_a_channel;
figure;
imshowLab(img_L_channel_manipilation_1, img_a_channel_manipilation_1, img_b_channel_manipilation_1);
title ('Q4.3: add -20 to L channel');

% Manipulation 2 : switch beetwen channels - a & b
figure;
imshowLab(img_L_channel, img_b_channel, img_a_channel);
title ('Q4.3: switch between a and b channel');

% Manipulation 1 : mult L channel by 1.3 then add 5
img_b_channel_manipilation_3 = img_b_channel;
img_L_channel_manipilation_3 = img_L_channel*1.3 + 5; 
img_a_channel_manipilation_3 = img_a_channel;
figure;
imshowLab(img_L_channel_manipilation_3, img_a_channel_manipilation_3, img_b_channel_manipilation_3);
title ('Q4.3: mult L channel by 1.3 then add 5');
