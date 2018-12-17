function [edgeImg] = dip_prewitt_edge(img,thresh)
Gx = [-1 0 1; -1 0 1; -1 0 1]/6;
Gy = [-1 -1 -1;0 0 0;1 1 1]/6;
edgeImgx = abs(conv2(img,Gx,'same'));
edgeImgy = abs(conv2(img,Gy,'same'));
edgeImg = sqrt(edgeImgx.^2 +edgeImgy.^2);
edgeImg = edgeImg > thresh;
end

