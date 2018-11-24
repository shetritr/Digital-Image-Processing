%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%% Q3 HSV
img = double(imread('starry_night.jpg'))/255; 
[img_h img_s img_v] = rgb2hsv(img);
figure;
imshowHSV(img_h, img_s, img_v);
title ('Q3.2 : MATLAB HSV to RGB');

% Q3.3 Convert the image to HSV and display the separate channels
[img_dip_h, img_dip_s, img_dip_v] = dip_rgb2hsv(img);
figure;
imshowHSV(img_dip_h,img_dip_s,img_dip_v);
title ('Q3.3 : convert HSV dip back to RGB to check the results');
figure; imshow(img_dip_h, [0 1]);
title ('Q3.3 : our function dip H channel');
figure; imshow(img_dip_s, [0 1]);
title ('Q3.3 : our function dip S channel');
figure; imshow(img_dip_s, [0 1]);
title ('Q3.3 : our function dip V channel');

% Q3.4 Compare your results to MATLAB's 'rgb2hsv()' function.
Q3_hsv_test_h = round(img_h - img_dip_h,10);
Q3_hsv_test_s = round(img_s - img_dip_s,10);
Q3_hsv_test_v= round(img_v - img_dip_v,10);
mean_h = mean(Q3_hsv_test_h,'all');
mean_s = mean(Q3_hsv_test_s,'all');
mean_v = mean(Q3_hsv_test_v,'all');
if (mean_h ==0 && mean_s ==0 && mean_v ==0)
    disp('Q3.4 : dip_rgb2hsv is accurate');
else
    disp('Q3.4 : dip_rgb2hsv is not accurate');
end

%% Q3.5
% Manipulation 1 : add a constant to H channel
img_dip_h_manipilation_1 = adjust_brightness(img_dip_h, 'add', -0.35);
img_dip_s_manipilation_1 = img_dip_s;
img_dip_v_manipilation_1 = img_dip_v;
figure;
imshowHSV(img_dip_h_manipilation_1, img_dip_s_manipilation_1, img_dip_v_manipilation_1);
title ('Q3.5: add -0.35 to H channel');

% Manipulation 2 : switch beetwen channels - s & v
figure;
imshowHSV(img_dip_h, img_dip_v, img_dip_s);
title ('Q3.5: switch between S and V channel');

% Manipulation 1 : mult S channel by 0.4 then add 0.2
img_dip_h_manipilation_3 = img_dip_h;
img_dip_s_manipilation_3 = adjust_brightness(img_dip_s, 'mul', 0.4);
img_dip_s_manipilation_3 = adjust_brightness(img_dip_s_manipilation_3, 'add', 0.2);
img_dip_v_manipilation_3 = img_dip_v;
figure;
imshowHSV(img_dip_h_manipilation_3, img_dip_s_manipilation_3, img_dip_v_manipilation_3);
title ('Q3.5: mult S channel by 0.4 then add 0.2');

%% Q3.6
% Switch the order of the RGB channels and then convert to HSV using
%'dip_rgb2hsv()'. Display the separate channels. Which channels changed?
img_switch(:,:,1)=img(:,:,1);
img_switch(:,:,2)=img(:,:,3);
img_switch(:,:,3)=img(:,:,2);
[img_switch_dip_h, img_switch_dip_s, img_switch_dip_v] = dip_rgb2hsv(img_switch);
figure;
imshowHSV(img_switch_dip_h, img_switch_dip_s, img_switch_dip_v);
title ('Q3.6 : HSV convertion from switching Blue & Green channels');
figure;
montage([img_switch_dip_h, img_dip_h]); colormap('hsv');
title ('Q3.6 : HSV convertion from switching Blue & Green channels vs Orginial - H channel, colormap "hsv"');
figure;
montage([img_switch_dip_s, img_dip_s]); colormap('hsv');
title ('Q3.6 : HSV convertion from switching Blue & Green channels vs Orginial- S channel, colormap "hsv"');
figure;
montage([img_switch_dip_v, img_dip_v]); colormap('hsv');
title ('Q3.6 : HSV convertion from switching Blue & Green channels vs Orginial - V channel, colormap "hsv"');
