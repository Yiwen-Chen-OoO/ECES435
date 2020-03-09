PATH = "blockArtifacts3.tif"

IMG = imread(PATH);% import the image file

[r,c] = size(IMG); % get the size of image
r = floor(r/8)-1; % calculate the dimention of block and ignore the rigth and bottom edge
c = floor(c/8)-1;
Z1 = zeros(r,c);%Initialization 
Z2 = zeros(r,c);
for i = 1:r % loop for each block 
    for j = 1:c
        ref1 = 8*(i-1)+4; %Z' At the Center
        Z1(i,j) = abs(IMG(ref1,ref1)-IMG(ref1,ref1+1)-IMG(ref1+1,ref1)+IMG(ref1+1,ref1+1));
        ref2 = 8*i;% Z'' At the Corner
        Z2(i,j) = abs(IMG(ref2,ref2)-IMG(ref2,ref2+1)-IMG(ref2+1,ref2)+IMG(ref2+1,ref2+1));
    end
end
edge = linspace(0,255,11); 
% Set the edge for Histogram of Z' and Z''
% They mush share the same x axis

subplot(2,1,1)
%Plot histogram for Z' and add title 
H1 = histogram(Z1,'BinEdges',edge,'Normalization','probability');
title(string(PATH)) % File name
K1 = H1.Values;%List Object
subplot(2,1,2)
H2 = histogram(Z2,'BinEdges',edge,'Normalization','probability');
K2 = H2.Values;
K = sum(abs(K1-K2)); % calculate k value based on SUM of abs(K1-K2)
title(['K = ',num2str(K)]); %K value 



