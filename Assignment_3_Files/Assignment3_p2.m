%% Assignment3 Part II
% Yiwen Chen | Yumeng Yang | Wanyi Ying
% Date: 02/21/2020
% Language: MATLAB

close all; clear all; clc;
format compact;
PATH = {'peppers.tif','baboon.tif'};
ImageWMK = uint8(zeros(512,512,length(PATH)));
for i = 1:length(PATH)
    % read image and watermark
    Image = imread(PATH{i});
    % Watermark is the Most Significant Plane
    Wtmk = getPlane(imread('Barbara.bmp'),8);
    
    figure(2*i-1)
    key = 0;%key assigned
    [ImageWMK(:,:,i)] = YMembed(Image,Wtmk,key);%embed info
    imshow(ImageWMK(:,:,i)) %show embeded image
    
    PATH{i}
    peaksnr = psnr(ImageWMK(:,:,i),Image)
    title(['PSNR of ',PATH{i},'=',num2str(peaksnr)])
    figure(2*i)
    imgSeperate(ImageWMK(:,:,i));
end
imwrite(ImageWMK(:,:,1),'peppers0.tiff','tiff'); % store Yeung-Mintzer --
imwrite(ImageWMK(:,:,2),'baboon0.tiff','tiff');  % watermarked image
%% Read the Watermarked Image and Searching for the information embeded
figure(2*i+1)
ImageYM = imread('YMwmkedKey435.tiff');
Wt = YMdecode(ImageYM,435);
subplot(1,2,1)
imshow(ImageYM)
title('YMwmkedKey435.tiff')
subplot(1,2,2)
imshow(Wt)
title('Extracted Watermark')




