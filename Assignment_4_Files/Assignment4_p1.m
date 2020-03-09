close all; clear all; clc;
format compact;
got
PATH = {'imageOrigin1.JPG','imageOrigin2.jpg','imageOrigin3.JPG',...
    'imageOrigin4.JPG','imageOrigin5.jpg','imageOrigin6.jpg',...
    'blockArtifacts1.tif','blockArtifacts2.tif','blockArtifacts3.tif'};

for i=1:length(PATH)
    figure(i)
    K = JpegDetection(PATH{i});
end

