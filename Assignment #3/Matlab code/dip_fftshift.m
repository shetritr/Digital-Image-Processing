%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function shift_fft = dip_fftshift(FFT)
% shift zero-frequency component to center of spectrum of an FFT image
% FFT - input, FFT image
% shift_fft - output, FFT with shifted zero-frequency component to center of spectrum
 shift_fft = circshift(FFT,floor(size(FFT)/2));
end

