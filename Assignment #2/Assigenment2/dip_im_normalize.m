%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function image_normalized = dip_im_normalize(img)
% aid function - Normalize img from [min max] values to [0 1]
val_max = max(img(:));
val_min = min(img(:));
range = val_max - val_min;
image_normalized = (img - val_min) ./ range;
end

