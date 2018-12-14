%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function grey_scale_img = dip_rgb2gray(img)
% Converts the RGB image R,G,B to gray scale image like rgb2gray() function
%img - color img, value range = [0, 1] (normlized)
  redChannel = double(img(:, :, 1));
  greenChannel = double(img(:, :, 2));
  blueChannel = double(img(:, :, 3));
  grey_scale_img = double(0.2989*redChannel + 0.587*greenChannel + 0.114*blueChannel);
end