close all; clear all; clc;
format compact;

PATH = {'imageOrigin1.JPG','blockArtifacts1.tif'};

for i=1:length(PATH)
    figure(i)
    K = JpegDetection(PATH{i});
end

