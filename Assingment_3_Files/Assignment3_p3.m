close all; clear all; clc;

baboon0 = imread('baboon0.tiff'); % read YM-watermarked image 
baboon = imread('baboon.tif');
peppers = imread('peppers.tif'); % read peppers
Wtmk = imread('Barbara.bmp'); %binary watermark
peppers0 = imread('peppers0.tiff');
%% LSB watermark manipulation
peppersLSB = LSBWaterMark(peppers, Wtmk,3);
baboonLSB = LSBWaterMark(baboon, Wtmk,3);
LSBCombined = [peppersLSB(257:512,:);baboonLSB(257:512,:)];
figure_num = 1;
figure(figure_num)
imshow(LSBCombined)
title('LSB Watermark Manipulation')
figure_num = figure_num +1;
figure(figure_num);
imgSeperate(LSBCombined);

%% Yeung-Mintzer watermarked image
Combined = [peppers(257:512,:);baboon0(257:512,:)]; % image combine 
WaterMarkExtracted = YMdecode(Combined,0); %Assume we know the key

figure_num = figure_num + 1;
figure(figure_num)
subplot(1,2,1)
imshow(Combined)
title('Peppers Baboons0')
subplot(1,2,2)
imshow(WaterMarkExtracted);

peppers0 = imread('peppers0.tiff');
YMAttack = [peppers0(257:512,:);baboon0(257:512,:)];
YMWaterMarkExtracted = YMdecode(YMAttack,0);
figure_num = figure_num + 1;
figure(figure_num)
subplot(1,2,1)
imshow(YMAttack)
title('Peppers0 Baboons0')
subplot(1,2,2)
imshow(YMWaterMarkExtracted);
