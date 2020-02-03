close all; clear all; clc;
format compact;
%% Part 2 Sharpen Moon 
figure(1)
moon = imread('moon.tif');
subplot(1,2,1);
imshow(moon);
title("Original");
% Sharpened Img with different alpha Value
subplot(1,2,2);
alpha0 = 10;
NewImg = Sharpen(moon,alpha0);
imshow(NewImg)
title(['alpha = ',num2str(alpha0)]);

%% Sharpen outoffocus

figure(2)
OutOfFocus = imread('outoffocus.tif');
subplot(1,2,1);
imshow(OutOfFocus);
title("Original");
subplot(1,2,2);
alpha1 =20;
FixedImg = Sharpen(OutOfFocus,alpha1);
imshow(FixedImg)
title(['alpha = ',num2str(alpha1)]);