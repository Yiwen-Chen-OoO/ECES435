close all; clear all; clc;
format compact;

%% Contrast Enhancement
PATH = {'imageCE1.tif','imageCE2.tif','imageCE3.tif','imageCE4.tif','imageCE5.tif',};
for i = 1:length(PATH)
    IMG = imread(PATH{i});
    figure(i);
    subplot(1,2,1);
    imshow(IMG);
    title(string(PATH{i}));    
    subplot(1,2,2);
    [Count, Bin] = imhist(IMG,10);
    bar(Bin,Count);
end
% CE3 may be contrast enhanced



