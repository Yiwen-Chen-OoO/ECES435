close all; clear all; clc;
format compact;

Image = imread('peppers.tif');
Wtmk = imread('Barbara.bmp');
Wtmk = getPlane(Wtmk,8);
figure(1)
key = 0;
[ImageP] = YMembed(Image,Wtmk,key);
figure(1)
imshow(ImageP)
W = YMdecode(ImageP,0);
figure(2)
imshow(W)
%% Read the Watermarked Image and Searching for the information embeded

Image1 = imread('YMwmkedKey435.tiff');
Wt = YMdecode(Image1,435);
figure(3)
imshow(Image1)
figure(4)
imshow(Wt)




