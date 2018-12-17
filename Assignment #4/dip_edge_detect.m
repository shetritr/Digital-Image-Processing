function [vector,edge_image] = dip_edge_detect(img)
gray_img = rgb2gray(img);
img_Canny = edge(gray_img,'Canny'); 
figure;
imshow(img_Canny,[])
title ('Q1 :  img_Canny edge')
B = bwboundaries(img_Canny , 'noholes');
polyin = polyshape(B{length(B)});
[xlim,ylim] = boundingbox(polyin);
edge_image = img_Canny;
vector = uint16 ([ylim(1);xlim(2);abs(ylim(2)-ylim(1));abs(xlim(2)-xlim(1))]);
end

