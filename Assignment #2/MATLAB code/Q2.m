%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%% Q2 Additive vs Subtractive Color space
img = double(imread('starry_night.jpg'))/255; 
% Q2.1 Briefly explain about the CYMK color space.
% Q2.2 Create the CYMK channels from the RGB channels and display each separately:
redChannel_img = img(:,:,1); % Red channel
greenChannel_img = img(:,:,2); % Green channel
blueChannel_img = img(:,:,3); % Blue channel
[i j] = size(blueChannel_img);
% (a) Black = minimum(1-Red,1-Green,1-Blue)
for x = 1:i
    for y = 1:j
        CYMK_img_black(x,y) = dip_minElement(1-redChannel_img(x,y),1-greenChannel_img(x,y), 1-blueChannel_img(x,y));
    end
end
figure;
imshow(CYMK_img_black, [0 1]);
title('Q2.2 CYMK - Black channel of img');

% (b) Cyan = (1-Red-Black)/(1-Black)
tmp = 1;
for x = 1:i
    for y = 1:j
        tmp = 1 - CYMK_img_black(x,y);
        CYMK_img_cyan(x,y) = (tmp - redChannel_img(x,y)/ tmp);
    end
end
figure;
imshow(CYMK_img_cyan, [0 1]);
title('Q2.2 CYMK - Cyan channel of img');

% (c) Magenta = (1-Green-Black)/(1-Black)
tmp = 1;
for x = 1:i
    for y = 1:j
        tmp = 1 - CYMK_img_black(x,y);
        CYMK_img_Magenta(x,y) = (tmp - greenChannel_img(x,y)/ tmp);
    end
end
figure;
imshow(CYMK_img_Magenta, [0 1]);
title('Q2.2 CYMK - Magenta channel of img');

% (d) Yellow = (1-Blue-Black)/(1-Black)
tmp = 1;
for x = 1:i
    for y = 1:j
        tmp = 1 - CYMK_img_black(x,y);
        CYMK_img_Yellow(x,y) = (tmp - blueChannel_img(x,y)/ tmp);
    end
end
figure;
imshow(CYMK_img_Yellow, [0 1]);
title('Q2.2 CYMK - Yellow channel of img');
%% Q2.3
displayCYMK(CYMK_img_cyan,CYMK_img_Yellow,CYMK_img_Magenta,CYMK_img_black);
title ('B, Q2.3 : CYMK color space');
%% Q2.4
% Manipulation 1 : add a constant to magenta channel
CYMK_img_cyan_manipilation_1 = CYMK_img_cyan;
CYMK_img_Yellow_manipilation_1 = CYMK_img_Yellow;
CYMK_img_Magenta_manipilation_1 = adjust_brightness(CYMK_img_Magenta, 'add', 0.5);
CYMK_img_black_manipilation_1 = CYMK_img_black;
figure;
imshowCYMK(CYMK_img_cyan_manipilation_1,CYMK_img_Yellow_manipilation_1,CYMK_img_Magenta_manipilation_1,CYMK_img_black_manipilation_1);
title ('Q2.4: add 0.5 to magenta channel');

% Manipulation 2 : switch beetwen channels
figure;
imshowCYMK(CYMK_img_cyan,CYMK_img_Magenta,CYMK_img_Yellow,CYMK_img_black);
title ('Q2.4: switch between magenta and yellow channel');

% Manipulation 1 : mult yellow channel by 0.4 then add 0.2
CYMK_img_cyan_manipilation_3 = CYMK_img_cyan;
CYMK_img_Yellow_manipilation_3 = adjust_brightness(CYMK_img_Yellow, 'mul', 0.4);
CYMK_img_Yellow_manipilation_3 = adjust_brightness(CYMK_img_Yellow_manipilation_3, 'add', 0.2);
CYMK_img_Magenta_manipilation_3 = CYMK_img_Magenta;
CYMK_img_black_manipilation_3 = CYMK_img_black;
figure;
imshowCYMK(CYMK_img_cyan_manipilation_3,CYMK_img_Yellow_manipilation_3,CYMK_img_Magenta_manipilation_3,CYMK_img_black_manipilation_3);
title ('Q2.4: mult yellow channel by 0.4 then add 0.2');