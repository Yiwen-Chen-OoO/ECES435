
close all; clear all; clc;
format compact;
%% Part 1 Gamma Correction
img = imread('pout.tif');
type GammaCorrection
figure(1);
subplot(1,4,1);
imshow(img);
title("Original");
% Img with different Gamma Value
subplot(1,4,2);
gamma0 = 0.5;
NewImg0 = GammaCorrection(img,gamma0);
imshow(NewImg0)
title(['Gamma = ',num2str(gamma0)]);

subplot(1,4,3);
gamma1 = 1.5;
NewImg1 = GammaCorrection(img,gamma1);
imshow(NewImg1)
title(['Gamma = ',num2str(gamma1)]);

subplot(1,4,4);
gamma2 = 1;
NewImg2 = GammaCorrection(img,gamma2);
imshow(NewImg2)
title(['Gamma = ',num2str(gamma2)]);
pause
%% Enhance MoonPhobos
moonPhobos = imread('MoonPhobos.tif');
figure(2);
subplot(3,2,1);
imshow(moonPhobos)
title('Original');
subplot(3,2,2);
imhist(moonPhobos);
title('Pixel Histalgram');

subplot(3,2,3);
% Gamma value = 0.3
CorrectionCoefficient = 0.3;
moonPhobosEn = GammaCorrection(moonPhobos,CorrectionCoefficient);
imshow(moonPhobosEn)
title(['Gamma = ',num2str(CorrectionCoefficient)]);
subplot(3,2,4);
imhist(moonPhobosEn);

% histeq method
subplot(3,2,5);
moonPhobosEq = histeq(moonPhobos,256);
imshow(moonPhobosEq)
subplot(3,2,6);
imhist(moonPhobosEq);
