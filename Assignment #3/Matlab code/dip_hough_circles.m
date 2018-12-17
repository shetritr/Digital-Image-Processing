function [Hough_matrix] = dip_hough_circles(BW)
%DIP_HOUGH_CIRCLES Summary of this function goes here
%   Detailed explanation goes here
    N = size(BW,1);
    M = size(BW,2); 
    Hough_matrix = zeros(N,M,21);
    for i = 1:N
        for j = 1:M
            if BW(i,j) == 1
                for r = 15:35
                    for tata = 0:360
                        t = tata*pi/180;
                        a = ceil(i - r*cos(t));
                        b = ceil(j - r*sin(t));
                        if( 0<a && a<247 && 0<b && b<301 )
                            Hough_matrix(a,b,r-14) = Hough_matrix(a,b,r-14) + 1 ;
                        end
                    end  
                end
            end
        end
    end
end

