close all; clear all; clc;
format compact;
PATH = {'peppers.tif','baboon.tif'};
for i = 1:length(PATH)
    % read image and watermark
    Image = imread(PATH{i});
    % Watermark is the Most Significant Plane
    Wtmk = getPlane(imread('Barbara.bmp'),8);
    
    figure(2*i-1)
    key = 0;%key assigned
    [ImageWMK] = YMembed(Image,Wtmk,key);%embed info
    imshow(ImageWMK) %show embeded image
    figure(2*i)
    imgSeperate(ImageWMK);
end


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




