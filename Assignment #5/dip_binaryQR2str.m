%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function  id = dip_binaryQR2str(binary_vector)
% Q1.7 - Convert every 4 bits to an integer: e.g. 0110 -> 6, 1001->9.
% INPUTS - binary_vector - 6x6 binary row vector repreesnt a QR
% OUTPUTS - id - string ID extracted from the binary vector input

string_id = '';
for i = 0:8
    % Convert each 4 bits to an integer
    v = uint8(bin2dec(sprintf('%d',binary_vector(1,i*4+1:i*4+4))));
    % Concatenate strings horizontally
    string_id = strcat(string_id,num2str(v));
end
id = string_id;
end

