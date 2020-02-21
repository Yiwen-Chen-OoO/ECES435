%% Assignment3 Part I 
% Yiwen Chen | Yumeng Yang | Wanyi Li
% Date: 02/21/2020
% Language: MATLAB

close all; clear all; clc;
format compact;
%the path of image file, will be used
PATH = {'peppers.tif','baboon.tif','LSBwmk1.tiff','LSBwmk2.tiff','LSBwmk3.tiff'};
%% Extract Hidden Message 
% Bit Plane Seperation and Display for Pepper, Babbon, LSBwmk1,
for j = 1:length(PATH)
figure(j)
Image = imread(PATH{j});% load the image #j 
imgSeperate(Image);%Bit Plane Seperation and Display
end

Image = imread('peppers.tif');
wtmk = imread('Barbara.bmp');
New = WaterMark(Image, wtmk,1);
figure(j+1)
imshow(Image);
figure(j+2)
imgSeperate(New)


