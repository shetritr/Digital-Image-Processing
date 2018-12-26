%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%%
% Q1.1 - Insert your 9 digit ID to the function ID2QR(id) where ID is a string.
% Print the QR code on paper. The QR code is a matrix of 6x6 binary
% values.
id = '318550746';
image_org = ID2QR(id);
title('Q1.1 - QR code of ID=318550746');
% image_corners = ginput(4);
%%
% Q1.2 - Take three photos of the QR code from three different angles: easy, inter mediate, hard.
% The "hard" photo should be one that is on the limit where you can no
% longer properly interpret the QR code. (see example in gure 1 ).
% notation : 1 = easy to 3 = hard.
qr_angle1 = rgb2gray(double(imread('QR_angle1.png')));
figure;
imshow(qr_angle1, []);
title('Q1.2 - QR image 1')

qr_angle2 = rgb2gray(double(imread('QR_angle2.png')));
figure;
imshow(qr_angle2, []);
title('Q1.2 - QR image 2')

qr_angle3 = rgb2gray(double(imread('QR_angle3.png')));
figure;
imshow(qr_angle3, []);
title('Q1.2 - QR image 3')

%% Q1.3 - get images corners
% Q1.3 - Locate the points on the QR code in each image manually. You may use
% MATLAB's ginput(4).
% Load corners mat files
load('image_corners.mat');
load('image1_corners.mat');
load('image2_corners.mat');
load('image3_corners.mat');

% Creating corners mat files
% figure;
% imshow(qr_angle1, []);
% title('Q1.2 - angle 1 of QR code image');
% image1_corners = ginput(4);
% close;

% figure;
% imshow(qr_angle2, []);
% title('Q1.2 - angle 2 of QR code image');
% image2_corners = ginput(4);
% close;
% 
% figure;
% imshow(qr_angle3, []);
% title('Q1.2 - angle 3 of QR code image');
% image3_corners = ginput(4);
% close;

%% saving corners as .mat file
% save image_corners image_corners
% save image1_corners image1_corners
% save image2_corners image2_corners
% save image3_corners image3_corners

%% Q1.4,6,7
% Q1.4 - dip_recoverQR -  Transform the image such that the QR code is straightened
% Q1.6 - dip_QR2Binary_raw - Extract the binary values from the straightened QR.
% Q1.6 - dip_QR2Binary - Another method to Extract the binary values from the straightened QR.
% Q1.7 - dip_binaryQR2str  - Convert every 4 bits to an integer

% dip_imageQR2ID - the algorithm as a whole
% we can pass blank image as a reference - image_org = zeros(258,258);
% We are passing the orignal image for display purpose only
id_result_1 = dip_imageQR2ID(image_org, image_corners, qr_angle1, image1_corners);
id_result_2 = dip_imageQR2ID(image_org, image_corners, qr_angle2, image2_corners);
id_result_3 = dip_imageQR2ID(image_org, image_corners, qr_angle3, image3_corners);
if (strcmp(id,id_result_1)==1)
    display('Q1 is accurate for image 1');
end
if (strcmp(id,id_result_2)==1)
    display('Q1 is accurate for image 2');
end
if (strcmp(id,id_result_3)==1)
    display('Q1 is accurate for image 3');
end
