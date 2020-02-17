close all; clear all; clc;
format compact;
%the path of image file, will be used
PATH = {'peppers.tif','baboon.tif','LSBwmk1.tiff','LSBwmk2.tiff','LSBwmk3.tiff'};
% for j = 1:length(PATH)
% figure(j)
% Image = imread(string(PATH(j)));% load the image #j 
% imgSeperate(Image);
% end

Image = imread('peppers.tif');
wtmk = imread('Barbara.bmp');
New = WaterMark(Image, wtmk,3);
figure(1)
imshow(Image);
figure(2)
imgSeperate(New)
