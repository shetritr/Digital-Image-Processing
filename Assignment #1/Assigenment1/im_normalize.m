function img_normalized = im_normalize(img)
% Normalize an image in the range 0 to 1
    img_normalized=double((img-min(img(:)))/(max(img(:))-min(img(:))));
end