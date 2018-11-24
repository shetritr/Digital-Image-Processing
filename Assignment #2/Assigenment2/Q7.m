%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%% Q7 - Bonus
img = double(imread('wolf.jpg'))/255; 
figure;
imshow(img, []);
title('Q7 Bonus - Original image');

% Just for making 1 channel
grey_scale_img =  dip_rgb2gray(img);
figure;
imshow(grey_scale_img,[0 1]);
title('Q7 Bonus - gray scale image');

% Make binary map of the white areas
[i,j] = size(grey_scale_img);
img_binaryMap = zeros(i,j);
for x = 1:i
    for y = 1:j
        if (grey_scale_img(x,y) < 0.5) %Subject to change according to the image
            img_binaryMap(x,y) = 1;
        else
            img_binaryMap(x,y) = 0;
        end
    end
end
figure;
imshow(img_binaryMap,[0 1]);
title('Q7 Bonus - Binary map');

% HSV Manipulation
img_binaryMap = img_binaryMap * 0.25; 
img_tst(:,:,1) = grey_scale_img;
img_tst(:,:,2) = grey_scale_img;
img_tst(:,:,3) = grey_scale_img;
[img_dip_h, img_dip_s, img_dip_v] = dip_rgb2hsv(img_tst);
[img_dip_h_1, img_dip_s_1, img_dip_v_1] = dip_rgb2hsv(img);
img_dip_s_1 = img_binaryMap .* img_dip_s_1 * 3;

figure;
imshowHSV(img_dip_h, img_dip_s_1, img_dip_v);
title('Q7 Bonus - Original data without any manipulation that we use for reconstruction');
figure;
imshowHSV(img_dip_h + img_binaryMap, img_dip_s_1, img_dip_v);
title('Q7 Bonus - Recreating the image with colorful nature background');