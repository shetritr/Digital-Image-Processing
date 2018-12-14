%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function prison_bars = dip_create_prison(f_x, M, N)
% Create sinus image, size MxN
% f_x - input, frequency
% M - input, number of rows
% N - input, number of Cols
% prison_bars - output, sinus image, size MxN
    prison_bars = zeros(M,N);
    x = 1:1:N;
    y = 0.5 * sin(2*pi*(f_x)*x / N);
    prison_bars = prison_bars + y;
end
