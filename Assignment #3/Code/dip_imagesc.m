%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function dip_imagesc(FFT)
% Display FFT imagesc amplitude
% FFT - input, the 2DFFT image
F = FFT;
F = log(abs(dip_fftshift(F))+1); % Get the magnitude
figure;
imagesc(F);colorbar;% Display the result
end
