close all; clear all; clc;
format compact;

pout = imread('pout.tif');
[poutRows, poutCols] = size(pout)
subplot(1,2,1)
imshow(pout);
[hval, pixval] = imhist(pout);
subplot(1,2,2)
bar(pixval, hval)
close all;

poutHisEq= histeq(pout);

figure(1)
subplot(2,2,1);
imshow(pout);
subplot(2,2,2);
imshow(poutHisEq)'

subplot(2,2,3:4);
imhist(poutHisEq)
