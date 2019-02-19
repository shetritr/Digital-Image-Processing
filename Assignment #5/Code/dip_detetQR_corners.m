%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function corners = dip_detetQR_corners(image_org)
%% Q2 - edge detection algorithm
% dip_detecCorners detect the corners of the QR image.
% Function inputs :
% 	Image_org – any RGB image (need rgb for displaying result only)
% Function outputs :
% 	corners – detected QR object corners in the image, starting clockwise from upper left corner.

%% Step 1 - Preparation  for boundaries
% image_org = imread('image3.jpeg');
figure;
imshow(image_org, []);
title('Q2 - Original image');

% Grayscale image
img_grayscale = im2bw(image_org,0.65);
figure;
imshow(img_grayscale, [0 1]);
title('Q2 - Gray scale image');

% Canny's edge detector
img_canny = edge(img_grayscale,'canny');
figure;
imshow(img_canny, [0 1]);
title('Q2 - Cannys edge image');

% Entropy filter
img_entropy = entropyfilt(img_canny);
figure;
imshow(img_entropy, [0 1]);
title('Q2 - Entropy filter image');

% Fill holes in the binary image
filledImage = imfill(img_entropy, 'holes');
figure;
imshow(filledImage, [0 1]);
title('Q2 - Filled holes binary image');

%% Step 2 - find the Boundaries of all objects in the binary image
% In this step we used the function minboundparallelogram (attached) written by :
% https://www.mathworks.com/matlabcentral/fileexchange/34767-a-suite-of-minimal-bounding-objects?focused=3820654&tab=function
% Also, to classify each object we used the following implemention :
% https://www.mathworks.com/matlabcentral/answers/116793-how-to-classify-shapes-of-this-image-as-square-rectangle-triangle-and-circle

% Boundaries - get outlines of each object in the image
[B,L,cols] = bwboundaries(filledImage, 'noholes');

% Stats - get the stats of each object
stats=  regionprops(L, 'Centroid', 'Area', 'Perimeter');
Perimeter = cat(1,stats.Perimeter);
Area = cat(1,stats.Area);
CircleMetric = (Perimeter.^2)./(4*pi*Area);  %circularity metric
SquareMetric = NaN(cols,1);
TriangleMetric = NaN(cols,1);

%for each boundary, fit to bounding box, and calculate some parameters
for k=1:cols
   boundary = B{k};
   [rx,ry,boxArea] = minboundparallelogram( boundary(:,2), boundary(:,1));  %x and y are flipped in images
   %get width and height of bounding box
   width = sqrt( sum( (rx(2)-rx(1)).^2 + (ry(2)-ry(1)).^2));
   height = sqrt( sum( (rx(2)-rx(3)).^2+ (ry(2)-ry(3)).^2));
   aspectRatio = width/height;
   if aspectRatio > 1 
       aspectRatio = height/width;  %make aspect ratio less than unity
   end
   SquareMetric(k) = aspectRatio;    %aspect ratio of box sides
   TriangleMetric(k) = Area(k)/boxArea;  %filled area vs box area
end

%define some thresholds for each metric
%do in order of circle, triangle, square, rectangle to avoid assigning the
%same shape to multiple objects
isCircle =   (CircleMetric < 1.1);
isTriangle = ~isCircle & (TriangleMetric < 0.6);
isSquare =   ~isCircle & ~isTriangle & (SquareMetric > 0.9);
isRectangle= ~isCircle & ~isTriangle & ~isSquare;  %rectangle isn't any of these

figure;
imshow(image_org);
hold on
visboundaries(B);
title('Q2 - Boundaries of objects in the image');

%% Step 3 - find the parallelogram (the QR) boundary
% find max square/rectangle/parallelogram
[value,index_max] = max(Area.*(isSquare + isRectangle));

% Get the QR boundary
boundary = B{index_max};
figure;
imshow(image_org);
hold on
plot(boundary(:,2), boundary(:,1), 'y', 'LineWidth', 2);
title('Q2 - QR boundary');

%% Step 4 - create a binary mask of the QR boundary
% Binary mask of the QR code
image_size = size(image_org);
binaryImage = false(image_size(1), image_size(2));
x = boundary(:,2);
y = boundary(:,1);
thisMask = poly2mask(x, y, image_size(1), image_size(2));
binaryImage = binaryImage | thisMask;

figure;
imshow(binaryImage,[]);
title('Q2 - QR binary mask');

%% Step 5 - Find hough lines of the QR
% Canny filter on the binary image
binaryImage = edge(binaryImage,'canny');
[H,T,R] = hough(binaryImage); 

% Find 4 peaks of the hough matrix
Peaks  = houghpeaks(H,4,'threshold',ceil(0.1*max(H(:))));
[rows cols] = size(binaryImage);

% Normalize from R = x*cos(T) + y*sin(T). 
theta = Peaks(:,2) - 91;
rho = Peaks(:,1) - sqrt(rows^2 + cols^2);
x = 1:rows;

% Lines equation matrix
lines_matrix = zeros(2,length(rho)); 
figure;
imshow(image_org);
hold on;
for i = 1:size(rho)
    y = (rho(i)-x*cos(pi*theta(i)/180))/sin(pi*theta(i)/180);
    plot(x , y,'LineWidth',2,'Color','y');
    % y(x) = m * x + b
    lines_matrix(:,i) = polyfit(x,y,1);  
end
title('Q2 - 4 peaks lines of Hough matrix');

%% Step 6 - Find intersections of those lines - the corners
% Find intersections - 6 options
intersection = zeros(6,2);
for i = 1:3
    intersection(i,1) = (lines_matrix(2,1)-lines_matrix(2,1+i))/(lines_matrix(1,1+i)-lines_matrix(1,1));
    intersection(i,2) = lines_matrix(1,1) * intersection(i,1) + lines_matrix(2,1);
end
for i = 4:5
    intersection(i,1) = (lines_matrix(2,2)-lines_matrix(2,i-1))/(lines_matrix(1,i-1)-lines_matrix(1,2));
    intersection(i,2) = lines_matrix(1,2) * intersection(i,1) + lines_matrix(2,2);
end
intersection(6,1) = (lines_matrix(2,3)-lines_matrix(2,4))/(lines_matrix(1,4)-lines_matrix(1,3));
intersection(6,2) = lines_matrix(1,3) * intersection(6,1) + lines_matrix(2,3);

% Remove intersection points that out of the image
intersection = round(intersection);
index = 1;
for i = 1:6
    if intersection(i,1)>0 && intersection(i,1)<=rows && intersection(i,2)>0 && intersection(i,2)<=cols
        points(index,:) = [intersection(i,1) intersection(i,2)];
        index = index + 1;
    end
end

figure;
imshow(image_org);
hold on;
plot(points(:,1),points(:,2),'*','linewidth',5);
title('Q2 - detected 4 corners of the QR');

corners = points;
end