img = imread('picasso.jpg'); 
greyScale_img = double(rgb2gray(img));
greyScale_normalize_img = im_normalize(greyScale_img);
figure;
imshow(greyScale_normalize_img, [0 1])