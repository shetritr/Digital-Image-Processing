%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function image_normalized = dip_rgb_normalize(img)
% aid function - Normalize img from [min max] values to [0 1]
redChannel_img = img(:,:,1); % Red channel
greenChannel_img = img(:,:,2); % Green channel
blueChannel_img = img(:,:,3); % Blue channel

val_max_red = max(redChannel_img(:));
val_min_red = min(redChannel_img(:));
range_red = val_max_red - val_min_red;
image_normalized_red = (redChannel_img - val_min_red) ./ range_red;

val_max_blue = max(blueChannel_img(:));
val_min_blue = min(blueChannel_img(:));
range_blue = val_max_blue - val_min_blue;
image_normalized_blue = (blueChannel_img - val_min_blue) ./ range_blue;

val_max_green = max(greenChannel_img(:));
val_min_green = min(greenChannel_img(:));
range_green = val_max_green - val_min_green;
image_normalized_green = (greenChannel_img - val_min_green) ./ range_green;

image_normalized = cat(3, image_normalized_red, image_normalized_green, image_normalized_blue);
end