%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit  204654891  |
%-==========================================-
clear all;
close all;

%% Q5.1 Object circling
%% Q5.1.1 
% 5.1.1	Read the 'cap1/2.png' images 
% in MATLAB using the 'imread()' function and normalize them to [0 , 1].
cap1 = double(imread('cap1.png'))/255; 
cap2 = double(imread('cap2.png'))/255;
%% Q5.1.2 
%5.1.2	Find the blue cap of the soda bottle in the 
%images and circle it in each image. 
imghsv=rgb2hsv(cap2);
imgh=imghsv(:,:,1);
imgs=imghsv(:,:,2);
imgv=imghsv(:,:,3);
bluepixels = imgh >= 0.6 & imgh <= 0.7 & imgs >= 0.3 & imgs <= 1 & imgv >= 0 & imgv <= 0.17;
m = ones(8,20);
I1 = 0;
J1 = 0;
check = 1;
for i = 1:492 
    for j = 1:980 
        b = bluepixels(i:i+7,j:j+19);
        if eq(b,m)
            I1 = i + 4 ;
            J1 = j + 10;
            break
        end
    end
end
radio = 30;
imshow(cap2,[0 1]);
hold on
t=0:0.1:2.1*pi;
x = J1 + radio*sin(t);
y = I1 + radio*cos(t);
plot(x,y,'r','LineWidth',4);
hold off
