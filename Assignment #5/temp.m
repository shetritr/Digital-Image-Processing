%%
image = image1_corners;
LU_x = image(1,1);
LU_y = image(1,2);
RU_x = image(2,1);
RU_y = image(2,2);
RD_x = image(3,1);
RD_y = image(3,2);
LD_x = image(4,1);
LD_y = image(4,2);

% Rigid transformation
v1 = [LU_x,LU_y] - [RU_x,RU_y];
v2 = [RU_x,RU_y] - [RD_x,RD_y];
a1 = mod(atan2( det([v1;v2;]) , dot(v1,v2) ), 2*pi );
angle = (abs((a1>pi/2)*pi-a1)/pi) * 180;
teta_UU = atan2(LU_y-RU_y,LU_x-RU_x)*180/pi + 180;

% Check for scaling - is the lines orthogonal?
if (abs(angle - 90)>1.5)
    
    display('error')
end
rotated_image = imrotate(qr_angle1,teta_UU);
figure;
imshow(rotated_image);

LU = [LU_x; LU_y];
RU = [RU_x; RU_y];
dU = norm(LU - RU);

RU = [RU_x; RU_y];
RD = [RD_x; RD_y];
dR = norm(RU - RD);
 
if(abs(dR - dU) > 2)
 % need scaling correction   
end
