%% ECES435 Assignment 2
% Yiwen Chen | Yumeng Yang | Wanyi Ying

% 
%% Part I Compression on Images
close all; clear all; clc;
format compact;
%the path of image file, will be used
PATH = 'peppers.tif';
Q=[90 70 50 30 10];
for i=1:length(Q)% with different quality factor
    figure(i);
    [peaksnr] = ImgCompress(PATH,Q(i));
end
% the second picture
PATH2 = 'baboon.tif';
for i=1:length(Q)
    figure(i+5);
    [peaksnr] = ImgCompress(PATH2,Q(i));
end


