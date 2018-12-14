%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function fft = sep_fft2(v1,v2)
% Q1.2.2 (e) - compute matrix 2D FFT from 2 1D vectors
% v1 - input, row vector
% v2 - input, col vector
% fft - 2D computed FFT
fft_v1  = dip_fft2(v1);
fft_v2  = dip_fft2(v2);
fft = fft_v1 * fft_v2;
end
