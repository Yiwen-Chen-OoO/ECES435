%% Assignment 5 
%% Yiwen Chen | Yumeng Yang | Wanyi Ying

% Part I 
close all; clear all; clc;
format compact;

%% 1. Contrast Enhancement
PATH1 = {'imageCE1.tif','imageCE2.tif','imageCE3.tif','imageCE4.tif'};
n_bin = 10; %num of bins
for i = 1:length(PATH1)
    IMG = imread(PATH1{i});
    figure(i);
    subplot(1,2,1);
    imshow(IMG);
    title(string(PATH1{i}));    
    subplot(1,2,2);
    [Count, Bin] = imhist(IMG,n_bin);% get img histogram with 10 bins
    bar(Bin,Count); %plot histogram using bar
    
end


%% 2. Gamma Correction
PATH2 = {'unaltIm1.tif','unaltIm2.tif','unaltIm3.tif'};
Gamma = {0.7,1,1.3};
% performing gamma correction to the img. 
% note that img dont change if gamma = 1;

for k = 1:length(Gamma)
    for j = 1:length(PATH2)
       figure
       NewImg = GammaCorrection(PATH2{j},Gamma{k});
       %Performing gamma correction to the img with respecte to gamma
       %value
    end
end

%% 3. Contractive or Expansive 
IMG5 = imread('imageCE5.tif');
figure
subplot(1,2,1);
imshow(IMG5);
title('imageCE5.tif');
subplot(1,2,2);
[Count, Bin] = imhist(IMG,n_bin);
bar(Bin,Count);
%get the img histogram and plot as bar 