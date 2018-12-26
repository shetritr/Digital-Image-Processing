%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function ID = dip_imageQR2ID(reference_image, reference_image_corners, image2recover, image2recover_corners)
% Transform the image such that the QR code is straightened
image_straighted = dip_recoverQR(reference_image, reference_image_corners, image2recover, image2recover_corners);

% Extract the binary values from the straightened QR
binary_matrix = dip_QR2Binary_raw(image_straighted);

% Another option for computing the binary matrix - more simple
% binary_matrix = dip_QR2Binary(image_straighted);

% Extract the id string from the binary matrix
ID = dip_binaryQR2str(binary_matrix);
end

