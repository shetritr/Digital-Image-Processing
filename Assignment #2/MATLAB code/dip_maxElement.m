%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function element = dip_maxElement(a, b, c)
% Find the maximum element of 3 numbers
% element = max(a,b,c)
    element = a;
    if (b > element)
        element = b;
    end
    if (c > element)
        element = c;
    end
end