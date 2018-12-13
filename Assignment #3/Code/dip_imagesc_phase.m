%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function dip_imagesc_phase(FFT)
% Display FFT imagesc phase with our dip_fftshift
% FFT - input, the 2DFFT image
F = FFT;
F = log(abs(angle(dip_fftshift(F)))); % Get the magnitude
figure;
imagesc(F);colorbar;% Display the result
end
