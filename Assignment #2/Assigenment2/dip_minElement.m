%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-

function element = dip_minElement(a, b, c)
% Find the minimum element
% element = min(a,b,c)
    element = a;
    if (b < element)
        element = b;
    end
    if (c < element)
        element = c;
    end
end