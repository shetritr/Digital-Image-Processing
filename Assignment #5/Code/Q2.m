%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
clear all;
close all;
%% Q2.2 - Results – feeding the Q1 algorithm
id = '318550746';
image_org = ID2QR(id);
load('image_corners.mat'); % just generic corners of a regular 256x256 window

%%
% Image 1
close all;
image_to_detect_1 = imread('image1.jpeg');
qr_angle1 = rgb2gray(image_to_detect_1)/255;
corners = dip_detetQR_corners(image_to_detect_1);

% Adjust the points in clockwise from upper left - we have no rotation
% indication  !
points = corners;
corners(1,:) = points(1,:);
corners(2,:) = points(2,:);
corners(3,:) = points(4,:);
corners(4,:) = points(3,:);

id_result_1 = dip_imageQR2ID(image_org, image_corners, qr_angle1, corners);

%%
% Image 2
close all;
image_to_detect_2 = imread('image2.jpeg');
qr_angle2 = rgb2gray(image_to_detect_2)/255;
corners = dip_detetQR_corners(image_to_detect_2);

% Adjust the points in clockwise from upper left - we have no rotation
% indication  !
points = corners;
corners(1,:) = points(3,:);
corners(2,:) = points(1,:);
corners(3,:) = points(2,:);
corners(4,:) = points(4,:);

id_result_2 = dip_imageQR2ID(image_org, image_corners, qr_angle2, corners);

%%
% Image 3
close all;
image_to_detect_3 = imread('image3.jpeg');
qr_angle3 = rgb2gray(image_to_detect_3)/255;
corners = dip_detetQR_corners(image_to_detect_3);

% Adjust the points in clockwise from upper left - we have no rotation
% indication !
points = corners;
corners(1,:) = points(1,:);
corners(2,:) = points(3,:);
corners(3,:) = points(4,:);
corners(4,:) = points(2,:);

id_result_3 = dip_imageQR2ID(image_org, image_corners, qr_angle3, corners);

%% Display results

if (strcmp(id,id_result_1)==1)
    fprintf('Q2 is accurate for image 1, the result ID for %s is %s \n',id, id_result_1);
else
    fprintf('Q2 is not accurate for image 1, the result ID for %s is %s \n',id, id_result_1);
end

if (strcmp(id,id_result_2)==1)
    fprintf('Q2 is accurate for image 2, the result ID for %s is %s \n',id, id_result_2);
else
    fprintf('Q2 is not accurate for image 2, the result ID for %s is %s\n',id, id_result_2);
end

if (strcmp(id,id_result_3)==1)
    fprintf('Q2 is accurate for image 3, the result ID for %s is %s \n',id, id_result_3);
else
    fprintf('Q2 is not accurate for image 3, the result ID for %s is %s\n',id, id_result_3);
end