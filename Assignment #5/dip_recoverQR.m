%-==========================================-
% Students ID : Maor Assayag     318550746  |
%               Refael Shetrit   204654891  |
%-==========================================-
function straightened_QR = dip_recoverQR(reference_image, reference_image_corners, image2recover, image2recover_corners)
% Q1.4 Transform the image such that the QR code is straightened, For each
% image use all the transformations learned in class: Rigid (rotation, trans-
% lation and scale transformation), Affine (shearing added), Perspective.
% INPUTS : reference_image - binary 258x258 image represent QR size
%          reference_image_corners - 2x4 dobule array represent reference_image 4 cornsers
%          image2recover - grayscale image conatining the QR, unknown size
%          image2recover_corners  - 2x4 dobule array represent reference_image 4 cornsers
% OUTPUTS : straightened_QR - straightened QR code, size of reference_image grayscale image

% Check for Rigid transformation
% Use this transformation when shapes in the moving image are unchanged,
% but the image is distorted by some combination of translation, rotation, and scaling.
% Straight lines remain straight, and parallel lines are still parallel. 
tform_tryRigid = fitgeotrans(image2recover_corners,reference_image_corners,'nonreflectivesimilarity');
TF_Rigid = isRigid(tform_tryRigid);
if (TF_Rigid == 0)
    % Check for Affine transformation
    % Use this transformation when shapes in the moving image exhibit shearing.
    % Straight lines remain straight, and parallel lines remain parallel, 
    % but rectangles become parallelograms.
    tform_tryAffine = fitgeotrans(image2recover_corners,reference_image_corners,'affine'); 
    TF_Affine = isTranslation(tform_tryAffine);
    if (TF_Affine == 0)
        % Check for projective transformation
        % Use this transformation when the scene appears tilted.
        % Straight lines remain straight, but parallel lines converge toward
        % a vanishing point.
        tform_tryPerspective = fitgeotrans(image2recover_corners,reference_image_corners,'affine'); 
        tform = tform_tryPerspective;
    else
        tform = tform_tryAffine;
    end
else
    tform = tform_tryRigid;
end

% Compute additional infomation
if (TF_Rigid)
    translation_type = 'Rigid';
elseif (TF_Affine)
    translation_type = 'Affine';   
else 
    translation_type = 'Perspective'; 
end

% Compute invese transform
tformInv = invert(tform);
Tinv = tformInv.T;
ss = Tinv(2,1);
sc = Tinv(1,1);

% Transform the image
Roriginal = imref2d(size(reference_image));
straightened_QR = imwarp(image2recover,tform,'OutputView',Roriginal);

%Display results
figure;
subplot(2,2,1), imshow(reference_image, [])
subplot(2,2,2), imshow(straightened_QR, [])
subplot(2,2,3), imshow(image2recover, [])
title(['Q1 - recoverd image after translation type : ',translation_type])
end