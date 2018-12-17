%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function dip_imshowFFT(FFT)
% Display FFT amplitude with imshow
% FFT - input, the 2DFFT image
F = FFT;
F = abs(F); % Get the magnitude
F = log(F+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
figure;
imshow(F,[]); colorbar; % Display the result
end

