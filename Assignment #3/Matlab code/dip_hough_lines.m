function [Hough_matrix] = dip_hough_lines(BW)
% DIP_HOUGH_LINES function that calculates the Hough Matrix for finding
% lines.e
N = size(BW,1);
M = size(BW,2);
NforH = ceil(2*sqrt(N^2 + M^2) + 1);
Hough_matrix = zeros(NforH,181);
for i = 1:N
    for j = 1:M
        if BW(i,j) == 1
            for tata = -90:90
                t = tata*pi/180;
                r = j*cos(t) + i*sin(t);
                Hough_matrix(ceil(r + NforH/2),tata + 91) = Hough_matrix(ceil(r + NforH/2),tata + 91) + 1;
            end
        end
    end
end
    
end

