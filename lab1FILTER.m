close all; clear all; clc;
format compact;
peppers = imread('peppers.tif');
[pepperRows, pepperCols] = size(peppers);
%% Original
figure(1)
subplot(2,2,1)
imshow(peppers)
title('Original')
%% Average Filter
subplot(2,2,2)
avgMask5 = ones(5)/25;
peppersAvg5 = filter2(avgMask5, peppers);
imshow(uint8(peppersAvg5))
title('Avg 5');

%% Noise
noisevar = 128;
peppersnoise = uint8( double(peppers)+sqrt(noisevar)*randn(pepperRows, pepperCols));
subplot(2,2,3);
imshow(peppersnoise)
title('Noise');
%% Denoiseing
subplot(2,2,4);
avgMask3= ones(3)/9;
peppersAvg3= filter2(avgMask3,peppersnoise);
imshow(uint8(peppersAvg3))
title('Denoise');

%% Median Filter
figure(2)
subplot(1,3,1)
imshow(peppers)
title('Original')

subplot(1,3,2)
peppersMed3= medfilt2(peppersnoise,[3 3]);
imshow(peppersMed3)
title('Median Filter')

%% Sobel Filter
% Sobel filter for row direction
SobelX =  [ 1 0 -1
            2 0 -2
            1 0 -1 ];

% Sobel filter for column directon
SobelY= SobelX.';
% calculate the gradient in each cardinal direction
Gx= filter2(SobelX,peppers); % x-direction
Gy= filter2(SobelY,peppers); % y-direction

% calculate the magnitude of the gradient
gradMag= (Gx.^2 + Gy.^2).^.5;

% show the magnitude of the image's gradient
subplot(1,3,3)
imshow(uint8(gradMag))
title('Sobel Filter')
