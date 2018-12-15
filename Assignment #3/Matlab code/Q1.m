%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
clear all;
close all;
%%
% Q1 - 2D-Fourier Transform
% In this section we will exercise the 2D Fourier Transform on images and learn about
% some of its properties.
%%
% Q1.1.1 - Read the beatles.png image accompanied to this exercise, and convert it to grayscale. Make sure
% you also convert it into type double (if needed) and normalize it to [0; 1] values before proceeding.
beetle_image= double(imread('beatles.png'))/255; 
img_gray = dip_rgb2gray(beetle_image);
figure;
imshow(img_gray, []);
title('Q1.1 - beatles gray image');
%%
% Q1.1.4 - Compute the 2D-FFT of the image using your function, and dispaly the resulting image. Make
% sure you shift the output image before displaying it using dip_tshift(). Use imshow() and
% colorbar functions to display the results.
    % FFT
fft_matlab = fft2(img_gray);
fft_our = dip_fft2(img_gray);

    % shift
fft_shift_matlab  = fftshift(fft_matlab);
fft_shift_our = dip_fftshift(fft_our);

    %Display absolute log with jet colormap
dip_imagesc(fft_matlab);
title('Q1.1.4 - MATLAB shift fft -  using imagesc');
dip_imagesc(fft_our);
title('Q1.1.4 - OUR shift fft -  using iamgesec');
dip_imshowFFT(fft_shift_matlab);
title('Q1.1.4 - MATLAB shift fft - abs log - using imshow');
dip_imshowFFT(fft_shift_our);
title('Q1.1.4 - OUR shift fft - abs log - using imshow');
%%
%Q1.1.5 - Reconstruct the original image by using your inverse-FFT function. Is it identical to the original
% image? Note that the output of the iFFT are complex numbers - you should display only the
% real part of the image using real().

    % IFFT of regular fft
ifft_matlab = ifft2(fft_matlab);
ifft_our  = real(dip_ifft2(fft_our));

    % Checking
diff_ifft = abs(ifft_matlab - ifft_our);
    % Displaying
figure;
imshow(ifft_our, [])
title('Q1.1.5 - OUR ifft');
figure;
imshow(ifft_matlab, [])
title('Q1.1.5 - MATLAB ifft');
figure;
imshow(diff_ifft, [0 1]); colorbar;
title('Q1.1.5 - differnce between our result and MATLAB ifft - range [0 1]');
figure;
imshow(diff_ifft, []); colorbar;
title('Q1.1.5 - differnce between our result and MATLAB ifft - auto range');

%%
%Q1.2.1
%%
%Q1.2.1 - Linearity (Free Willy)
% (a) Load the freewilly.mat file accompanied to the exercise. Display it as an image using
% imshow(). don't normalize this file.
load('freewilly.mat');
[rows, cols] = size(freewilly);
figure;
imshow(freewilly, []);
title('Q1.2.1 (a) - freewilly image');

% (b) - As you can see, Willy the whale is imprisoned. Your job is to free Willy! To do that, you are
% told that the prison bars are made of a sinudoidal signal in the X axis that was added to
% the original image: where N is the number columns in the image. Given
% this image, nd the spatial frequency of the prison bars fx. Explain your answer! (Hint:
% how many bars are there in the image? You may also plot the rst row of the image if you
%find it helpful).
figure;
plot(freewilly(1,:));
title('Q1.2.1 (b) - plot 1 row of freewilly');

numOfPeaks = dip_peaksCounter(freewilly(1,:));

% (c)- Based on your answer in section (b), create the image of the prison bars and display it.
% MAKE SURE it has the same dimensions as frewilly.mat.
img_prison_bars = dip_create_prison(numOfPeaks, rows, cols);
figure;
imshow(img_prison_bars,[])
title('Q1.2.1 (c) - Prison bars image - space domain');

freewilly_SpaceDomain = freewilly - img_prison_bars;
figure;
imshow(freewilly_SpaceDomain, []);
title('Q1.2.1 (c) - trying free willy in Space Domain - failed !');

% (d) - Compute the 2D-FFT of the prison bars image, and display its amplitude (use the function
% abs()). Explain this result - give a mathematical proof that this is the Fourier transform
% that is expected here.
img_prison_bars_fft = dip_fft2(img_prison_bars);
dip_imagesc(img_prison_bars_fft);
title('Q1.2.1 (d) - Prison bars image - fourier domain - imagesc');
dip_imshowFFT(img_prison_bars_fft);
title('Q1.2.1 (d) - Prison bars image - fourier domain - imshow');

% (e) - Explain how can you free Willy (i.e. filter out the prison bars) through the Fourier domain.
% Based on your answer, write a function Free_Willy(Willy) that returns and displays Willy
% without the prison bars.
load('freewilly.mat');
x = Free_Willy(freewilly);
%%
%Q1.2.1.2 - Scaling, translation and seperability
% (a) - Initialize a 128128 all-zeros matrix. At the center of it, place a 4040 all-ones square (in
% pixels 44:83 in each dimension). Display the image and its 2D-FFT. Explain why it looks
% the way it does.
matrix = zeros(128, 128);
for i = 44:1:84
    for j = 44:1:84
        matrix(i,j) = 1;
    end
end
figure;
imshow(matrix, []);
title('Q1.2.1.2 (a) - matrix image')

matrix_fft = dip_fft2(matrix);

dip_imagesc(matrix_fft);
title('Q1.2.1.2 (a) - matrix fft amplitude');
dip_imagesc_phase(matrix_fft);
title('Q1.2.1.2 (a) - matrix fft phase');
%%
%(b) - Initialize a 128  128 all-zeros matrix. At rows 64:103 and columns 64:103, place a 40  40
% all-ones square. Display the new image and its 2D-FFT. Does the FFT looks the same as in
% section (a)?
matrix = zeros(128, 128);
for i = 64:1:104
    for j = 64:1:104
        matrix(i,j) = 1;
    end
end

figure;
imshow(matrix, []);
title('Q1.2.1.2 (b) - matrix image')

matrix_fft = dip_fft2(matrix);

dip_imagesc(matrix_fft);
title('Q1.2.1.2 (b) - matrix fft amplitude');
dip_imagesc_phase(matrix_fft);
title('Q1.2.1.2 (b) - matrix fft phase');
%%
%(c) - Initialize a 128128 all-zeros matrix. At the center of it, place a 8020 all-ones rectangle.
% Display the new image and its 2D-FFT.
matrix = zeros(128, 128);
for i = 24:1:104
    for j = 54:1:74
        matrix(i,j) = 1;
    end
end

figure;
imshow(matrix, []);
title('Q1.2.1.2 (c) - matrix image')

matrix_fft = dip_fft2(matrix);

dip_imagesc(matrix_fft);
title('Q1.2.1.2 (c) - matrix fft amplitude');
dip_imagesc_phase(matrix_fft);
title('Q1.2.1.2 (c) - matrix fft phase');
%%
%(d) - Can you represent the image from section (c) using two 1D vectors?
vector_col = zeros(128,1);
vector_row = zeros(1,128);
vector_row(54:74) = 1;
vector_col(24:104) = 1;
matrix = vector_col * vector_row;
figure;
imshow(matrix, []);
title('Q1.2.1.2 (d) - matrix using two 1D vectors');
%%
%(e) - Explain how can you compute the 2D-FFT of an image using 1D-FFTs if the image is
% separable into two 1D vectors. Write a function sep_fft2(v1,v2) that receives a pair of 1D
% vectors (of lengths N1 and N2 respectively), and returns the 2D-FFT (a N1*N2 matrix)
% based on the 1D-FFTs of the vectors (DO NOT use t2() here). Apply this function on the
% two vectors you described in section (d), and display the resulting 2D-FFT.
matrix_fft_sep = sep_fft2(vector_col, vector_row);

dip_imagesc(matrix_fft_sep);
title('Q1.2.1.2 (e) - matrix fft amplitude - using two 1D vectors');
dip_imagesc_phase(matrix_fft_sep);
title('Q1.2.1.2 (e) - matrix fft phase - using two 1D vectors');