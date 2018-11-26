%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%% Q1 RGB and GREYSCALE
% Q1.1 Read a color image in MATLAB using the 'imread()' function. Convert
% the image to "double" and normalize to the range [0,1].
img = double(imread('starry_night.jpg'))/255; 

%% Q1.2 Display the image using MATLAB's 'imshow()' function.
figure;
imshow(img, [0 1]);
title('Q1.2 Orginial normlized color image');

%% Q1.3 Extract the separate R, G and B channels from the image and display
% them.
redChannel_img = img(:,:,1); % Red channel
greenChannel_img = img(:,:,2); % Green channel
blueChannel_img = img(:,:,3); % Blue channel
figure;
montage([redChannel_img greenChannel_img blueChannel_img]);
title ('Q1.3 :  red channel                                                green channel                                           blue channel');

%% Q1.4 
% Write your own function that converts an RGB image to grayscale 'dip rgb2gray()'.
% (a) Gray = 0.2989 * R + 0.5870 * G + 0.1140 * B
gray_img = rgb2gray(img);
grey_scale_img =  dip_rgb2gray(img);
figure;
montage([gray_img grey_scale_img]);
title ('Q1.4 :  MATLAB rgb2gray image                                our dip rgb2gray image');

%Q1.5 
%test if Q1.4  - dip_rgb2gray is accurate
Q1_4_image_test = round(gray_img - grey_scale_img,3);
if (mean(Q1_4_image_test) == 0)
    disp('Q1.4 is accurate');
else
    disp('Q1.4 is not accurate');
end

%% Q1.6
% Manipulation 1 : add a constant
img_manipilation_1(:,:,1)=img(:,:,1);
img_manipilation_1(:,:,2)=img(:,:,2);
img_manipilation_1(:,:,3)=adjust_brightness(img(:,:,3), 'add', 0.2);
img_manipilation_1_gray = dip_rgb2gray(img_manipilation_1);
figure;
montage({img_manipilation_1 img_manipilation_1_gray});
title ('Q1.6: add 0.2 constant - image                                    rgb2gray image');

%Manipulation 2 : switch beetwen channels
img_manipilation_2(:,:,1)=img(:,:,1);
img_manipilation_2(:,:,2)=img(:,:,3);
img_manipilation_2(:,:,3)=img(:,:,2);
img_manipilation_2_gray = dip_rgb2gray(img_manipilation_2);
figure;
montage({img_manipilation_2 img_manipilation_2_gray});
title ('Q1.6: switch blue & green channels - image                                rgb2gray image');

%Manipulation 3 : multiply the green channel by 0.6 then subtract 0.1
img_manipilation_3(:,:,1)=img(:,:,1);
img_manipilation_3(:,:,2)=adjust_brightness(img(:,:,2), 'mul', 0.6);
img_manipilation_3(:,:,2)=adjust_brightness(img_manipilation_3(:,:,2), 'add', -0.1);
img_manipilation_3(:,:,3)=img(:,:,3);
img_manipilation_3_gray = dip_rgb2gray(img_manipilation_3);
figure;
montage({img_manipilation_3 img_manipilation_3_gray});
title ('Q1.6: multiply the green channel by 0.6 then subtract 0.1                                rgb2gray image');
