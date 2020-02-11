function [JPEGSIZE] = JpegEncode(PATH,Q)
% take the path of image file and quantization matrix as input
% return compressed image file size 
image = imread(PATH); %read image
[r,c] = size(image);  %get rows and columns
Text = zeros(r*c/64,64); % each row in the Text file is 1 zigzag series
for i = 1:r/8 % nested for loop
    for j = 1:c/8 %perform calculation for each block
        block = image((i-1)*8+1:i*8,(j-1)*8+1:j*8); %block segmentation
        DCT = dct2(block); %Discrete cosine transformation
        Q_DCT = DCT./Q; %Quantization
        zVec = ZigzagMtx2Vector(Q_DCT); %zigzag
        Text(8*8*(i-1)+j,:) = zVec;%store in the text file
    end
end
Len=JPEG_entropy_encode(r,c,8,Q,Text,'',0);% call entropy encoding function
S = dir('JPEG.jpg');
JPEGSIZE = S.bytes;%return size
end




