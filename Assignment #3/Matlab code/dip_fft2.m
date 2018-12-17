%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function F = dip_fft2(I)
% Compute 2D FFT of an 2D image acording to the 2D-fourier formulas
% I - input, Gray normalized image
% F - output, 2D FFT of image I
[M, N] = size(I);
DFT_1 = zeros(M, M);
DFT_2 = zeros(N, N);
for u = 0 : (M - 1)
    for x = 0 : (M - 1)
        DFT_1(u+1, x+1) = exp(-2 * pi * 1i / M * x * u);
    end    
end

for v = 0 : (N - 1)
    for y = 0 : (N - 1)
        DFT_2(y+1, v+1) = exp(-2 * pi * 1i / N * y * v);
    end    
end

F = DFT_1 * I * DFT_2;
end

