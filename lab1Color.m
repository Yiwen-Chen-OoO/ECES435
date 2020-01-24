close all; clear all; clc;
format compact;
baboon= imread('baboon_color.tiff');
[babRows,babCols,babColors]= size(baboon)
%% RGB Seperation
figure(1)
subplot(2,2,1);
imshow(baboon);
baboonRed= baboon(:,:,1); % red color layer
baboonGreen= baboon(:,:,2); % green color layer
baboonBlue= baboon(:,:,3); % blue color layer
babonR = uint8(zeros(size(baboon)));
babonR(:,:,1) = baboonRed;

babonG = uint8(zeros(size(baboon)));
babonG(:,:,2) = baboonGreen;
babonB = uint8(zeros(size(baboon)));
babonB(:,:,3) = baboonBlue;


subplot(2,2,2);
imshow(babonR);
subplot(2,2,3);
imshow(babonG);
subplot(2,2,4);
imshow(babonB);

% %% Y Cb Cr
% % convert the image to the Y Cb Cr color space (Y is luminance, Cb and Cr
% % are chrominance)
% baboonYCbCr= rgb2ycbcr(baboon);
% figure(2)
% % display the luminance color layer of baboon image
% subplot(2,2,2);
% imshow(baboonYCbCr(:,:,1))
% 
% subplot(2,2,3);
% imshow(baboonYCbCr(:,:,2))
% subplot(2,2,4);
% imshow(baboonYCbCr(:,:,3))
