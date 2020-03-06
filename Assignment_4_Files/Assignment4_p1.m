close all; clear all; clc;
format compact;

PATH = {'imageOrigin1.JPG'};

IMG = imread(PATH{1});

[r,c] = size(IMG);
r = r/8-1;
c = c/8-1;
Z1 = zeros(r,c);
Z2 = zeros(r,c);
for i = 1:r
    for j = 1:c
        ref1 = 8*(i-1)+4;
        Z1(i,j) = abs(IMG(ref1,ref1)-IMG(ref1,ref1+1)-IMG(ref1+1,ref1)+IMG(ref1+1,ref1+1));
        ref2 = 8*i;
        Z2(i,j) = abs(IMG(ref2,ref2)-IMG(ref2,ref2+1)-IMG(ref2+1,ref2)+IMG(ref2+1,ref2+1));
    end
end
nbin = 100;
edge = linspace(0,256,100);
subplot(2,1,1)
H1 = histogram(Z1,'BinEdges',edge,'Normalization','probability');
K1 = H1.Values;
subplot(2,1,2)
H2 = histogram(Z2,'BinEdges',edge,'Normalization','probability');
K2 = H2.Values;
K = sum(abs(K1-K2))
