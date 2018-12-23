function [edgeImg] = dip_roberts_edge(img,thresh)
Gx = 0.5*[1,0;0,-1];
Gy = 0.5*[0,1;-1,0];
edgeImgx = conv2(img,Gx,'same');
edgeImgy = conv2(img,Gy,'same');
edgeImg = sqrt(edgeImgx.^2 +edgeImgy.^2);
edgeImg = edgeImg > thresh;
end

