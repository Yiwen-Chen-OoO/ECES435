%% Sobel Filter
SobelX =  [ -1 0 1
            -2 0 2
            -1 0 1 ];
SobelY = SobelX';
figure(2)
peppers = imread('peppers.tif');
subplot(3,2,1)
imshow(peppers)
title('Original');
subplot(3,2,2)
Gx= filter2(SobelX,peppers); 
Gy= filter2(SobelY,peppers); 
gradMag= (Gx.^2 + Gy.^2).^.5;
imshow(uint8(gradMag))
title('Sobel Filter')

peppersnoise1 =  imread('peppersNoise1.tiff');
subplot(3,2,3)
imshow(peppersnoise1)
title('Noise1')


% show the magnitude of the image's gradient
subplot(3,2,4)
% calculate the gradient in each cardinal direction
Gx1= filter2(SobelX,peppersnoise1); % x-direction
Gy1= filter2(SobelY,peppersnoise1); % y-direction
gradMag1= (Gx1.^2 + Gy1.^2).^.5;
imshow(uint8(gradMag1))


subplot(3,2,5)
peppersnoise2 =  imread('peppersNoise2.tiff');
imshow(peppersnoise2)
title('Noise2')
subplot(3,2,6)
Gx2= filter2(SobelX,peppersnoise2); % x-direction
Gy2= filter2(SobelY,peppersnoise2); % y-direction
gradMag2= (Gx2.^2 + Gy2.^2).^.5;
imshow(uint8(gradMag2))