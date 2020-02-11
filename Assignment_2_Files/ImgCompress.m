function [peaksnr] = ImgCompress(PATH,Q_factor)

Image = imread(PATH); % read original image
S = dir(PATH);
Image_size = S.bytes; % get original size 
Name = strsplit(PATH,'.'); %get the image name by string operation
C_Name = string(Name(1))+num2str(Q_factor)+'.jpeg';%target file name
% create compressed version of image with quality factor
imwrite(Image, C_Name, 'Quality', Q_factor); 
% use PSNR to measure the fidelity of image
C_Image = imread(C_Name);
[peaksnr, snr] = psnr(Image, C_Image);
S = dir(C_Name);
C_Image_size = S.bytes; % get compressed size
fprintf('File: %s\n', string(Name(1)));
fprintf('Quality Factor: %d\n',Q_factor);
fprintf('Original Size: %d Bytes\n',Image_size);
fprintf('Compressed Size: %d Bytes\n',C_Image_size);
fprintf('The Peak-SNR value is %0.4f\n', peaksnr);
%result visualization 
subplot(1,2,1);
imshow(Image);
title('original');
subplot(1,2,2);
imshow(C_Image);
title(['Q=',num2str(Q_factor),'   PSNR =', num2str(peaksnr)]);
end

