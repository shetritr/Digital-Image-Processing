%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function F = dip_ifft2(I_fft)
% Compute 2D IFFT of an 2D-FFT image acording to the 2D-fourier formulas
% I_fft - input, FFT image
% F - output, 2D-IFFT of 2D-FFT image
[M, N] = size(I_fft);
wM        = zeros(M, M);
wN        = zeros(N, N);
 
for x = 0 : (M - 1)
    for u = 0 : (M - 1)
        wM(x+1,u+1) = exp(2 * pi * 1i / M * x * u);
    end    
end
 
for y = 0 : (N - 1)
    for v = 0 : (N - 1)
        wN( v+1,y+1) = exp(2 * pi * 1i / N * y * v);
    end    
end

F_tmp = (wM * double(I_fft) * wN);
max_val = abs(max(F_tmp(:)));
F= double(F_tmp / max_val);
end
