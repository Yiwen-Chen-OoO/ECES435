close all; clear all; clc;
format compact;
PATH = 'peppers.tif';
Q_Original = [16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];

Q_me = [3 5 7 9 11 13 15 17;
    5 7 9 11 13 15 17 19;
    7 9 11 13 15 17 19 21;
    9 11 13 15 17 19 21 23;
    11 13 15 17 19 21 23 25;
    13 15 17 19 21 23 25 27;
    15 17 19 21 23 25 27 29;
    17 19 21 23 25 27 29 31];
Q_s = [6  4  4  6 10 16 20 24;
  5  5  6  8 10 23 24 22;
  6  5  6 10 16 23 28 22;
  6  7  9 12 20 35 32 25;
  7  9 15 22 27 44 41 31;
 10 14 22 26 32 42 45 37;
 20 26 31 35 41 48 48 40;
 29 37 38 39 45 40 41 40;
 ];
Q1 = ones(8);
C_Filesize = JpegEncode(PATH,Q_original);
fprintf('Comressed file size %d\n',C_Filesize);
[Dimage,iQ] = JpegDecode();

% [r,c] = size(image);
% Text = zeros(r*c/64,64);
% for i = 1:r/8
%     for j = 1:c/8
%         block = image((i-1)*8+1:i*8,(j-1)*8+1:j*8);
%         DCT = dct2(block);
%         Q_DCT = DCT./Q;
%         zVec = ZigzagMtx2Vector(Q_DCT);
%         Text(8*8*(i-1)+j,:) = zVec;
%     end
% end
% Len=JPEG_entropy_encode(r,c,8,Q,Text,'',0);


