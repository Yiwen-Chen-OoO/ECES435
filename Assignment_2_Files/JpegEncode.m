function [JPEGSIZE] = JpegEncode(PATH,Q)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
image = imread(PATH);
[r,c] = size(image);
Text = zeros(r*c/64,64);
for i = 1:r/8
    for j = 1:c/8
        block = image((i-1)*8+1:i*8,(j-1)*8+1:j*8);
        DCT = dct2(block);
        Q_DCT = DCT./Q;
        zVec = ZigzagMtx2Vector(Q_DCT);
        Text(8*8*(i-1)+j,:) = zVec;
    end
end
Len=JPEG_entropy_encode(r,c,8,Q,Text,'',0);
S = dir('JPEG.jpg');
JPEGSIZE = S.bytes;




