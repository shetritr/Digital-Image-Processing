%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function [h,s,v] = dip_rgb2hsv(img)
% Converts the RGB image R,G,B to the equivalent HSV image H,S,V.
%h - an NxM matrix of type double of the Hue channel in the range [0,1]
%s - an NxM matrix of type double of the Saturation channel in the range [0,1]
%v - an NxM matrix of type double of the Value channel in the range [0,1]
%img - color img, value range = [0, 1] (normlized)
  % Extract red, green & blue channels
  red = double(img(:, :, 1));
  green = double(img(:, :, 2));
  blue = double(img(:, :, 3));
  [i,j] = size(blue);
  % local parameters
  h = zeros(i,j);
  s = zeros(i,j);
  v = zeros(i,j);
  min = 1;
  max = 0;
  tmp_min = 1;
  tmp_max = 0;
  tmp_delta = 1;
  for x = 1:i
      for y = 1:j
          tmp_min = dip_minElement(red(x,y),blue(x,y),green(x,y)); % find the min(R,G,B)
          % update global min value
          if (tmp_min < min)
              min = tmp_min;
          end
          tmp_max = dip_maxElement(red(x,y),blue(x,y),green(x,y)); %find the max(R,G,B)
          v(x,y) = tmp_max; % update v(x,y) = max (R(x,y),G(x,y),B(x,y))
          tmp_delta = tmp_max - tmp_min; % update current delta
          % update h(x,y)
          if (tmp_delta ~= 0)
              if (tmp_max == red(x,y))
                  h(x,y) = double(0 + (green(x,y) - blue(x,y)) / tmp_delta);
              elseif (tmp_max == green(x,y))
                  h(x,y) = double(2 + (blue(x,y) - red(x,y)) / tmp_delta);
              else
                  h(x,y) = double(4 + (red(x,y) - green(x,y)) / tmp_delta);
              end
          end
          if (h(x,y) <0)
              h(x,y) = h(x,y) +6;
          end
          %update global max value
          if (tmp_max > max)
              max = tmp_max;
          end
          % update s(x,y) = delta(max(x,y),min(x,y)) / max(x,y) 
          if (tmp_max ~= 0)
              s(x,y) = double((tmp_max - tmp_min) / tmp_max);
              %else s(x,y) = 0, default value
          end
      end
   end
  % Normalize to range [0,1]
  h = h / 6;  
end
