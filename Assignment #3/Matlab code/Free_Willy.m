%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
function freed_willy = Free_Willy(Willy)
% Filter an image with a noise in spiecif frequency in Fourier domain.
% Willy - input, the image
% freed_willy - output, the image without the noise
    freewilly = Willy;
    [rows, cols] = size(freewilly);
    %Find the spatial frequency of the prison bars fx.
    numOfPeaks = dip_peaksCounter(freewilly(1,:));

    %Create the image of the prison bars.
    img_prison_bars = dip_create_prison(numOfPeaks, rows, cols);

    %Compute the 2D-FFT of the prison bars image
    img_prison_bars_fft = dip_fft2(img_prison_bars);
    
    %Compute the 2D-FFT of freewilly image
    frequencyImage = dip_fft2(freewilly);
    dip_imagesc(frequencyImage);
    title('Q1.2.1.1 (e) - willy prisoned image - before filter');
    
    %Create binary map of the noise frequency
    brightSpikes = abs(frequencyImage) < abs(img_prison_bars_fft); % Binary image.
    frequencyImage(brightSpikes) = 0;
    dip_imagesc(frequencyImage);
    title('Q1.2.1.1 (e) - willy freed image - after filter');

    %Compute the 2D-IFFT of the filterd fourier domain
    filteredImage = real(dip_ifft2(frequencyImage));
    
    %Display the results
    figure;
    imshow(filteredImage, []);
    title('Q1.2.1.1 (e) - willy freed image - success !');
    freed_willy = filteredImage;
end
