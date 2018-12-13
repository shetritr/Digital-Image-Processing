%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function numOfPeaks = dip_peaksCounter(row)
% Compute the number of local extreme points - white pixels
% row - input, a vector of values represent gray pixels value of a row
% numOfPeaks - output, number of local extreme points
arrayOfPeaks = findpeaks(row);
numOfPeaks = 0;
[m, n] = size(arrayOfPeaks);
for j = 1: n
    if (arrayOfPeaks(j) >= 1)
        numOfPeaks = numOfPeaks + 1;
    end
end
end
