%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function binary_vector = dip_QR2Binary(straightened_QR)
% Q1.5  - dip_binaryQR2str - Extract the binary values from the straightened QR. 
% The matrix is row major meaning that the correct order is 
% (1,1), (2,1), ..., (6,1), (1,2), (2,2),... (6,6).
% Simplier way than dip_QR2Binary_raw
% INPUTS - straightened_QR - 258x258 grayscale image represent straightened
%           recoverd QR
% OUTPTUS - binary_vector - 6x6 binary row vector repreesnt a QR

% imresize - default Bicubic interpolation; 
% the output pixel value is a weighted average of pixels in the nearest
% 4-by-4 neighborhood
current_QR = imresize(straightened_QR,[6 6]);

% Round to make a binary represtion
current_QR_binary = round(abs(current_test));

% Reshape the binary matrix to a row according to instrcution
binary_vector = reshape(QR_binary,1,[]);
end

