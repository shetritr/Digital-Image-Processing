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

%% Q3.3
Hough_matrix = dip_hough_lines(BW);
figure;
imshow(Hough_matrix,[]);
title ('Q3 :  Hough matrix for lines');


%% Q3.5
% Find the 5 most significant lines in the rotated BW image, and plot them on the grayscale circuit
% image (you will need to rotate it by 15 degrees as well). Use MATLAB?s houghpeaks function to
% find the peaks of your Hough matrix.

peaks = houghpeaks(Hough_matrix,5);
imgR=imrotate(img,15);
figure;
imshow(imgR,[0 1]);
n = size(peaks,1);
x = 1:335;
k = size(Hough_matrix,1)/2;
for i = 1:n
    r = peaks(i,1) - k;
    tata = (peaks(i,2)-90)*pi/180;
    y =ceil( - cot(tata)*x + r/sin(tata));
    line(x , y , 'LineWidth' , 3);
end
title ('Q3 :  5 most signicant lines');

%% Q3.6
% Read Matlab's built-in coins.png image and normalize it to [0; 1]. Write your own dip_hough_circles(BW)
% function that calculates the Hough Matrix for finding circles. Repeat steps 1-5, but this time
% find and plot the 5 most significant circles in the image. Note: This time your Hough matrix is
% 3D, so you can display one slice (2D image).
% Hint: you should bound your search for radius values 15<R<35.

img = double(imread('coins.png'))/255;
figure;
imshow(img,[0 1]);
title ('Q3 :  Coins image');


BW=edge(img);
figure;
imshow(BW,[0 1]);
title ('Q3 : Coins edge image');


Hough_matrix = dip_hough_circles(BW);


figure;
imshow(Hough_matrix(:,:,1),[]);
title ('Q3 : Coins Hough R = 15 ');


figure;
imshow(Hough_matrix(:,:,21),[]);
title ('Q3 : Coins Hough R = 35 ');

peaks = peaks3D(Hough_matrix);

circleFind = insertShape(img,'circle',peaks,'LineWidth',5);
figure;
imshow(circleFind,[]);
title ('Q3 : significant circles in the Coins image ');

%% function
function peaks = peaks3D(Hough_matrix)
    peaks = zeros( 7 , 3 );
    for i = 1 : 7
        [ val , idx ] = max(Hough_matrix( : ) ) ;
        [ idx1 , idx2 , idx3 ]=ind2sub( size(Hough_matrix),idx);
        peaks ( i , : ) = [ idx2 , idx1 , idx3 + 14 ] ;
        Hough_matrix(idx1,idx2,idx3)=0;
    end
end