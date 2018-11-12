%% Q1_1
% Read the image named picasso.jpg and transform it into a gray scale image of
% type double using double(rgb2gray()) function. Normalize the image between
% [0; 1].
img = imread('picasso.jpg'); 
greyScale_img = double(rgb2gray(img));
greyScale_normalize_img = im_normalize(greyScale_img);
figure;
imshow(greyScale_normalize_img, [0 1])

%% Q1_2
% Write your own function named dip_histogram(img,nbins) that will return
% the histogram of the image 'img' using 'nbins' bins.
binsArray = [4 32 128 256];
for m=1:4
    nbins = binsArray(1,m);
    hist = norm_histogram(greyScale_normalize_img, nbins);
    bins = (1:256/nbins:256)/256;
    figure;
    bar(bins, hist);
    title(['Q1_2 histogram with ', num2str(nbins), ' bins']);
end
% Accuracy test
[counts, binLocations] = imhist(greyScale_normalize_img, 256);
tf = isequal(counts,hist(:));
if (tf ==1)
    disp ('Accuracy test : Q1_2 is correct');
else
    disp ('Accuracy test Q1_2 is incorrect');
end

%% Q1_3
% Display the original gray scale image together with the adjusted images
% of increased and decreased brightness.
adjusted_img1 = adjust_brightness(greyScale_normalize_img, 'mul',0.4);
adjusted_img2 = adjust_brightness(greyScale_normalize_img, 'add',0.4);
imagesArrayQ1_3 = [greyScale_normalize_img, adjusted_img1, adjusted_img2];
montage(imagesArrayQ1_3);
title ('Q1_3 : Original image                                                   Brightness is increased by the multiplication of 0.4                    Brightness is increased by the addition of 0.4');

%% Q1_4
low_range_array = [0.3 0.45];
high_range_array = [0.8 0.55];
for m=(1:2)
    adjusted_img3 = adjust_contrast(greyScale_normalize_img, low_range_array(1,m), high_range_array(1,m));
    check_img = imadjust(greyScale_normalize_img,[low_range_array(1,m) high_range_array(1,m)],[0 1]);
    figure;
    montage([greyScale_normalize_img, check_img, adjusted_img3]);
    title (['Q1_4  dynamic range : [',num2str(low_range_array(1,m)),',',num2str(high_range_array(1,m)),'],  Original image                                            build-in contrast adjust                    Our contrast adjust function']);
end
% checking dynamic range [1,0]
% low_range > high_range
adjusted_img3 = adjust_contrast(greyScale_normalize_img, 1, 0);
check_img = imadjust(greyScale_normalize_img,[0 1], [1,0]); % <- thats why we separated this dynamic range
figure;
montage([greyScale_normalize_img, check_img, adjusted_img3]);
title (['Q1_4 dynamic range : [',num2str(1),',',num2str(0),'] Original image                                            build-in contrast adjust                    Our contrast adjust function']);


%%
% Q1_2 aid function
function histogramArray = norm_histogram(img, nbins)
    % img - an Normalize image in the range 0 to 1
    % nbins - number of histogram bins
    [rows, columns] = size(img);
    histogramArray = zeros(1, nbins); % Conatin the count for each bin
    binWidth = 1 / nbins; 
    indexValue = 0;
    for n = 1:rows
        for m = 1:columns
            indexValue = img(n,m);
            if (indexValue == 1)
                histogramArray(1, nbins) = histogramArray(1,nbins) + 1;
            else
                histogramArray(1,floor(indexValue/binWidth)+1) = histogramArray(1,floor(indexValue/binWidth)+1)+1; % Add 1 into the corresponding bin
            end
        end
    end
end

% Q1_3 aid function
% Write your own function named adjust_brightness(img,action,parameter)
% in which 'action' could get either 'mul' for multiplication or 'add' for
% addition. Adjust the brightness of 'img' using the 'parameter'. The output
% of the function will be the modied image.
function adjusted_img = adjust_brightness(img, action, parameter)
if (strcmp(action,'add')==1)
    adjusted_img = img + parameter;
    adjusted_img(adjusted_img>1) = 1; % limit the image to be in the range of [0, 1]
    adjusted_img(adjusted_img<0) = 0; % limit the image to be in the range of [0, 1], if the user enter a negeative number
elseif (strcmp(action,'mul')==1)
    adjusted_img = img * parameter;
    adjusted_img(adjusted_img>1) = 1; % limit the image to be in the range of [0, 1]
    adjusted_img(adjusted_img<0) = 0; % limit the image to be in the range of [0, 1]
else
    adjusted_img = img;
    disp ('Q1_3 : unknow operation. "action" could get either "mul" for multiplication or "add" for addition');
end
end

% Q1_4 aid function
% Write your own function named adjust_contrast(img,range_low,range_high)
% that will change the contrast of the image 'img' and in which the range_low,range_high
% parameters will determine the new dynamic range of modifed image. The
% output of the function will be the modied image.
function adjusted_img = adjust_contrast(img, range_low, range_high)
    % formula developed from [y = ax + b] linear transformation;
    if (range_low~=0)
        b = 1 / (1 - (range_high / range_low));
        a = -b / range_low;
        adjusted_img = img * a + b;
        adjusted_img(adjusted_img>1) = 1; % limit the image to be in the range of [0, 1]
        adjusted_img(adjusted_img<0) = 0; % limit the image to be in the range of [0, 1], if the user enter a negeative number
    else
        % avoid division by 0
        a = 1 / range_high;
        adjusted_img = adjust_brightness(img,'mul',a);
    end
end