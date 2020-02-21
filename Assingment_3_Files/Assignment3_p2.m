close all; clear all; clc;
format compact;

Image = imread('peppers.tif');
Wtmk = imread('Barbara.bmp');

key = 0;
[ImageP,flag] = YMembed(Image,Wtmk,key);
%% Read the Watermarked Image and Searching for the information embeded

Image1 = imread('YMwmkedKey435.tiff');
W = YMdecode(Image1,435);
imshow(W)




