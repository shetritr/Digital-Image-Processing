%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refahel Shetrit  204654891  |
%-==========================================-
% aid function
% Write your own function named adjust_brightness(img,action,parameter)
% in which 'action' could get either 'mul' for multiplication or 'add' for
% addition. Adjust the brightness of 'img' using the 'parameter'. The output
% of the function will be the modied image.
function adjusted_img = adjust_brightness(img, action, parameter)
if (strcmp(action,'add')==1)
    adjusted_img = img + parameter;
    adjusted_img(adjusted_img>1) = 1; % limit the image to be in the range of [0, 1]
    adjusted_img(adjusted_img<0) = 0; % limit the image to be in the range of [0, 1], if the user enter a negeative number
elseif (strcmp(action,'mul')==1)
    adjusted_img = img * parameter;
    adjusted_img(adjusted_img>1) = 1; % limit the image to be in the range of [0, 1]
    adjusted_img(adjusted_img<0) = 0; % limit the image to be in the range of [0, 1]
else
    adjusted_img = img;
    disp ('Q1_3 : unknow operation. "action" could get either "mul" for multiplication or "add" for addition');
end
end