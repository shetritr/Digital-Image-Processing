%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q2.1 2D wavelet tools
% Q2.1.1
% Read the beetle.jpg image (enclosed to this exercise), convert it into grayscale image and
% normalize to [0; 1].
img = double(imread('beetle.jpg'))/255; 
gray_img = rgb2gray(img);
figure;
imshow(gray_img,[0 1])
title ('Q2 :  MATLAB rgb2gray image')
% Q2.1.2
% Extract the wavelet decomposition using MATLAB's wavedec2() function: use the 'haar'
% wavelet, you may choose any level of decomposition between 3-5.
[C3,S3] = wavedec2(gray_img,3,'haar');
[C4,S4] = wavedec2(gray_img,4,'haar');
[C5,S5] = wavedec2(gray_img,5,'haar');


% Q2.1.3
% Use Matlab's detcoef2 and appcoef2 functions to find the detail and
% approximation coefficients each level.
[H3,V3,D3]  = detcoef2('all',C3,S3,3);
A3 = appcoef2(C3,S3,'haar',3);

[H4,V4,D4]  = detcoef2('all',C4,S4,4);
A4 = appcoef2(C4,S4,'haar',4);

[H5,V5,D5]  = detcoef2('all',C5,S5,5);
A5 = appcoef2(C5,S5,'haar',5);

figure;
subplot(2,2,1);
imagesc(A3);
colormap pink(255);
title('Approximation Coef. of Level 3');

subplot(2,2,2);
imagesc(D3);
title('Diagonal of Level 3');

subplot(2,2,3);
imagesc(V3);
title('Vertical of Level 3');

subplot(2,2,4);
imagesc(H3);
title('Horizontal of Level 3');
figure;

subplot(2,2,1);
imagesc(A4);
colormap pink(255);
title('Approximation Coef. of Level 4');

subplot(2,2,2);
imagesc(D4);
title('Diagonal of Level 4');

subplot(2,2,3);
imagesc(V4);
title('Vertical of Level 4');

subplot(2,2,4);
imagesc(H4);
title('Horizontal of Level 4');
figure;

subplot(2,2,1);

imagesc(A5);
colormap pink(255);
title('Approximation Coef. of Level 5');

subplot(2,2,2);
imagesc(D5);
title('Diagonal of Level 5');

subplot(2,2,3);
imagesc(V5);
title('Vertical of Level 5');

subplot(2,2,4);
imagesc(H5);
title('Horizontal of Level 5');

%% Q2.2 Denoising
% Q2.2.1
% Read the beetle.jpg image, convert it to grayscale and normalize to [0; 1].
img = double(imread('beetle.jpg'))/255; 
gray_img = rgb2gray(img);
figure;
imshow(gray_img,[0 1])
title ('Q2 :image')

% Q2.2.2
% Create noisy image by adding gaussian noise to the original image using imnoise() function.
img_noise = imnoise(gray_img,'gaussian');
figure;
imshow(img_noise,[0 1])
title ('Q2 : noised image')


% Q2.2.3
% Remove the noise- use the functions wthrmngr() and wdencmp() with the wavelet decom-
% position as input, you may choose the other parameters.
[C,S] = wavedec2(img_noise,3,'haar');

THR = wthrmngr('dw2ddenoLVL','sqrtbal_sn',C,S);

[XC,CXC,LXC,PERF0,PERFL2] = wdencmp('gbl',img_noise,'haar',3,THR(1,1),'h',2);

figure;
imshow(XC);
title ('Q2 : De-noising image')



