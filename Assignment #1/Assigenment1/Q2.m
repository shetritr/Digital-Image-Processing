clear;

%% Q2_1
% Read the image named dog.jpg.
img = imread('dog.jpg');
greyScale_img = double(rgb2gray(img));
greyScale_normalize_img = im_normalize(greyScale_img);
imshow(greyScale_img, [0 255])
title('Original image')

%% Q2_2
% 1
%Write a function named mean_filter(img) that will apply a mean of size
%3x3 on the image 'img'. Make sure that the size of the output image is
%the same as the input image. Find a method to deal with the boundaries.
img2_2_1 = mean_filter(greyScale_img,3);
figure;
imshow(img2_2_1,[0 255]);
title('Mean filter')

% 2 
img2_2_2 = median_filter(greyScale_img,3);
figure;
imshow(img2_2_2,[0 255]);
title('Median filter')
    
%% Q2_3
img2_3_1 = dip_gaussian_filter(greyScale_img,3);
figure;
imshow(img2_3_1,[]);
title('Gaussian filter')

img2_3_3 = greyScale_img - img2_3_1;
figure;
imshow(img2_3_3,[]);
title('Subtract image')



%% Q2_4
% The attached anisodiff2D.m function performs conventional anisotropic
% diffusion (Perona & Malik) upon a gray scale image. The filter aiming at
% reducing image noise without removing signicant parts of the image
% content.

img = anisodiff2D(greyScale_img , 2 ,1/7 , 10 ,1);
img2 = anisodiff2D(greyScale_img , 8 ,1/7 , 10 ,1);
img3 = anisodiff2D(greyScale_img , 16 ,1/7 , 10 ,1);
img4 = anisodiff2D(greyScale_img , 2 ,1/7 , 10 ,2);
img5 = anisodiff2D(greyScale_img , 8 ,1/7 , 10 ,2);
img6 = anisodiff2D(greyScale_img , 16 ,1/7 , 10 ,2);

imagesArrayQ1_3 = [img, img2, img3;img4, img5, img6];
montage(imagesArrayQ1_3 , 'DisplayRange', [0 255]);
title ('Q2_4 (k=10) : t = 2                                                                                                              t = 8                                                                                                       t = 16');
figure;
img = anisodiff2D(greyScale_img , 2 ,1/7 , 30 ,1);
img2 = anisodiff2D(greyScale_img , 8 ,1/7 , 30 ,1);
img3 = anisodiff2D(greyScale_img , 16 ,1/7 , 30 ,1);
img4 = anisodiff2D(greyScale_img , 2 ,1/7 , 30 ,2);
img5 = anisodiff2D(greyScale_img , 8 ,1/7 , 30 ,2);
img6 = anisodiff2D(greyScale_img , 16 ,1/7 , 30 ,2);

imagesArrayQ1_3 = [img, img2, img3;img4, img5, img6];
montage(imagesArrayQ1_3 , 'DisplayRange', [0 255]);
title ('Q2_4 (k=30) : t = 2                                                                                                              t = 8                                                                                                       t = 16');

%% Q2_5
% Create 3 new images by adding 3 dierent kinds of noises to the original
% image using imnoise() function. The noises are: 'salt & pepper', 'gaussian'
% and 'speckle'.

img_salt_pepper = imnoise(greyScale_normalize_img,'salt & pepper');
img_gaussian =  imnoise(greyScale_normalize_img,'gaussian');
img_speckle =  imnoise(greyScale_normalize_img,'speckle');


% Apply the implemented filters (and the anisotropic diffusion filter) on each
% of the noisy images.

img_salt_pepper1 = mean_filter(img_salt_pepper,3);
img_salt_pepper2 = median_filter(img_salt_pepper,3);
img_salt_pepper3 = dip_gaussian_filter(img_salt_pepper,3);
img_salt_pepper4 = anisodiff2D(img_salt_pepper , 8 ,1/7 , 10 ,1);

img_gaussian1 = mean_filter(img_gaussian,3);
img_gaussian2 = median_filter(img_gaussian,3);
img_gaussian3 = dip_gaussian_filter(img_gaussian,3);
img_gaussian4 = anisodiff2D(img_gaussian , 8 ,1/7 , 10 ,1);

img_speckle1 = mean_filter(img_speckle,3);
img_speckle2 = median_filter(img_speckle,3);
img_speckle3 = dip_gaussian_filter(img_speckle,3);
img_speckle4 = anisodiff2D(img_speckle , 8 ,1/7 , 10 ,1);

% Display the noisy and the filtered.

figure('Name','Salt & Pepper');
imagesArray_salt_pepper = [img_salt_pepper, img_salt_pepper1,img_salt_pepper2, img_salt_pepper3, img_salt_pepper4];
montage(imagesArray_salt_pepper , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')

figure('Name','Gaussian');
imagesArray_gaussian = [img_gaussian, img_gaussian1, img_gaussian2 , img_gaussian3, img_gaussian4];
montage(imagesArray_gaussian , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')

figure('Name','Speckle');
imagesArray_speckle = [img_speckle, img_speckle1, img_speckle2, img_speckle3, img_speckle4];
montage(imagesArray_speckle , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')


%% Q2_6
% Repeat sections 2.2, 2.3 and 2.5. With filter size of 9x9. Explain the dierence.

%   Q2_2
img2_6_2_1 = mean_filter(greyScale_img,9);
figure;
imshow(img2_6_2_1,[0 255]);
title('Mean filter')

img2_6_2_2 = median_filter(greyScale_img,9);
figure;
imshow(img2_6_2_2,[0 255]);
title('Median filter')

%   Q2_3

img2_6_3_1 = dip_gaussian_filter(greyScale_img,9);
figure;
imshow(img2_6_3_1,[]);
title('Gaussian filter')

img2_6_3_3 = greyScale_img - img2_6_3_1;
figure;
imshow(img2_6_3_3,[]);
title('Subtract image')

% Q2_5

img_salt_pepper = imnoise(greyScale_normalize_img,'salt & pepper');
img_gaussian =  imnoise(greyScale_normalize_img,'gaussian');
img_speckle =  imnoise(greyScale_normalize_img,'speckle');


% Apply the implemented filters (and the anisotropic diffusion filter) on each
% of the noisy images.

img_salt_pepper1 = mean_filter(img_salt_pepper,9);
img_salt_pepper2 = median_filter(img_salt_pepper,9);
img_salt_pepper3 = dip_gaussian_filter(img_salt_pepper,9);
img_salt_pepper4 = anisodiff2D(img_salt_pepper , 8 ,1/7 , 10 ,1);

img_gaussian1 = mean_filter(img_gaussian,9);
img_gaussian2 = median_filter(img_gaussian,9);
img_gaussian3 = dip_gaussian_filter(img_gaussian,9);
img_gaussian4 = anisodiff2D(img_gaussian , 8 ,1/7 , 10 ,1);

img_speckle1 = mean_filter(img_speckle,9);
img_speckle2 = median_filter(img_speckle,9);
img_speckle3 = dip_gaussian_filter(img_speckle,9);
img_speckle4 = anisodiff2D(img_speckle , 8 ,1/7 , 10 ,1);

% Display the noisy and the filtered.

figure('Name','Salt & Pepper');
imagesArray_salt_pepper = [img_salt_pepper, img_salt_pepper1,img_salt_pepper2, img_salt_pepper3, img_salt_pepper4];
montage(imagesArray_salt_pepper , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')

figure('Name','Gaussian');
imagesArray_gaussian = [img_gaussian, img_gaussian1, img_gaussian2 , img_gaussian3, img_gaussian4];
montage(imagesArray_gaussian , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')

figure('Name','Speckle');
imagesArray_speckle = [img_speckle, img_speckle1, img_speckle2, img_speckle3, img_speckle4];
montage(imagesArray_speckle , 'DisplayRange', [0 1]);
title(' Original                                       mean filter                                       median filter                                       gaussian filter                                       anisotropic  filter')



%% functions

% Q2_2_1 aid function
function Filtered_image = mean_filter(img,Thesize)
    var = 0;
    if Thesize == 3
        var = 1;
    elseif Thesize == 9
        var = 4;
    end
    [rows, columns] = size(img);
    Filtered_image = zeros(rows,columns);
    paddedImage = padarray(img,[var var]);% deal with the boundaries padding with zeroes
    for n = 1:rows
        for m = 1:columns
            sum = 0;
            for i = -var:var
                for j = -var:var
                    sum  = sum + paddedImage(n+i+var,m+j+var);
                end 
            end
            Filtered_image(n,m) = sum/(Thesize*Thesize);
        end
    end
    
end

% Q2_2_2 aid function
function Filtered_image = median_filter(img,Thesize)
    var = 0;
    mid = 0;
    if Thesize == 3
        var = 1;
        mid = 5;
    elseif Thesize == 9
        var = 4;
        mid = 41;
    end
    [rows, columns] = size(img);
    Filtered_image = zeros(rows,columns);
    paddedImage = padarray(img,[var var]);% deal with the boundaries padding with zeroes
    for n = 1:rows
        for m = 1:columns
            sum = zeros(Thesize*Thesize);
            k = 1;
            for i = -var:var
                for j = -var:var
                    sum(k) =  paddedImage(n+i+var,m+j+var);
                    k = k+1;
                end 
            end
            sum = sort(sum);
            Filtered_image(n,m) = sum(mid);
        end
    end
    
end


% Q2_3
function Filtered_image = dip_gaussian_filter(img,Thesize)
    var = 0;
    if Thesize == 3
        var = 1;
    elseif Thesize == 9
        var = 4;
    end
    [rows, columns] = size(img);
    Filtered_image = zeros(rows,columns);
    paddedImage = padarray(img,[var var]);% deal with the boundaries padding with zeroes
    sigma2 = double(0.3);
    [X Y] = meshgrid(-var:var, -var:var);
    G = exp(-(X.^2 + Y.^2) / (2*sigma2));
    G = G / (2*pi*sigma2);
    for n = 1:rows
        for m = 1:columns
            sum2 = 0;
            for i = -var:var
                for j = -var:var
                    sum2 = sum2 + paddedImage(n+i+var,m+j+var)*G(i+var+1,j+var+1);
                end 
            end
            Filtered_image(n,m) = sum2/sum(G(:));
        end
    end
    
end