%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function binary_vector = dip_QR2Binary_raw(straightened_QR)
% Q1.5  - dip_binaryQR2str - Extract the binary values from the straightened QR. 
% The matrix is row major meaning that the correct order is 
% (1,1), (2,1), ..., (6,1), (1,2), (2,2),... (6,6).
% INPUTS - straightened_QR - 258x258 grayscale image represent straightened
%           recoverd QR
% OUTPTUS - binary_vector - 6x6 binary row vector repreesnt a QR

% Crop intial 2-pixel-wide frame 
current_QR = straightened_QR(2:end-1,2:end-1);

scale = 256/6;
QR_binary = zeros(6,6);
for (i = 0:5)
    for (j = 0:5)
        % The output pixel value is a weighted average of pixels in the
        % scale-by-scale neighborhood 
        mean_area = sum(current_QR(i*scale +1 : i*scale +scale, j*scale +1 : j*scale +scale),'all')/(scale^2);
       
        % Round to make a binary represtion
        QR_binary(i+1,j+1) = round(mean_area);
    end
end
% Reshape the binary matrix to a row according to instrcution
binary_vector = reshape(QR_binary,1,[]);
end

