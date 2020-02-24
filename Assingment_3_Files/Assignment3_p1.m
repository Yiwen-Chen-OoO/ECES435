%% Assignment3 Part I 
% Yiwen Chen | Yumeng Yang | Wanyi Ying
% Date: 02/21/2020
% Language: MATLAB

close all; clear all; clc;
format compact;
%the path of image file, will be used
PATH = {'peppers.tif','baboon.tif','LSBwmk1.tiff','LSBwmk2.tiff','LSBwmk3.tiff'};
%% Extract Hidden Message 
%Bit Plane Seperation and Display for File in PATH

for j = 1:length(PATH)
figure(j)
Image = imread(PATH{j});% load the image #j 
imgSeperate(Image);%Bit Plane Seperation and Display
end

%% LSBWaterMark 
% replaces the N least significant bit planes from one image with the N most
% significant bit planes from another imag
Image = imread('peppers.tif');
%also do with baboon 
wtmk = imread('Barbara.bmp');

j = j + 1;
for i = 1:8
    
    figure(j)
    subplot(2,4,i)
    New = LSBWaterMark(Image, wtmk,i);
    imshow(New);
    

    %figure(i+j)
    %imgSeperate(New)    
end



