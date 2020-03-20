function [p] = Kirchner(PATH,lamda,tau,sigma)
IMG = double(imread(PATH)); % Read Image
[r c] = size(IMG); %Get ths size of IMG for proper display

alpha = [-0.25 0.5 -0.25;
        0.5 0 0.5;
        -0.25 0.5 -0.25]; % \alpha * matrix
IMG_P = filter2(alpha, IMG); % Applied filer alphs, get IMG_Prediction
e = IMG - IMG_P; % Calculate Error function by IMG - IMG_Prediction 
p = lamda*exp(-e.^tau/sigma); % Get the P map from the formula
% p(x,y) = lamda exp ( -e^tau / sigma)
figure;
subplot(1,3,1);
imshow(uint8(IMG));%show img
title(string(PATH));
subplot(1,3,2);
imagesc(p) %show p_map
title('P map');
axis equal %equal x and y axis for comparing img
axis off; % dont display axis
xlim([1 c]);  % get proper size 
ylim([1 r]);

subplot(1,3,3);
showFreqPmap(p); % show frequency p map
title('Freq P map');
axis equal % same as above, for better visualization 
axis off;
xlim([1 c]);
ylim([1 r]);

end

