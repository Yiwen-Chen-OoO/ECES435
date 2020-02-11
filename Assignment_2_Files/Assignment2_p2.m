close all; clear all; clc;
format compact;
PATH = 'peppers.tif';
S = dir('peppers.tif');
O_JPEGSIZE = S.bytes %get original file size
% The standard JPEG quantization matrix 
Q_Original = [16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];
% Designed quantization matrix
Q_me = [3 5 7 9 11 13 15 17;
    5 7 9 11 13 15 17 19;
    7 9 11 13 15 17 19 21;
    9 11 13 15 17 19 21 23;
    11 13 15 17 19 21 23 25;
    13 15 17 19 21 23 25 27;
    15 17 19 21 23 25 27 29;
    17 19 21 23 25 27 29 31];
% High PSNR quantization matrix
Q1 = ones(8);
% Encoding function 
C_Filesize = JpegEncode(PATH,Q_me);
% Decoding function
[Dimage,iQ] = JpegDecode();
% Compressing file size and PSNR analysis
[PEAKSNR, SNR] = psnr(Dimage, imread(PATH));
fprintf('Compressed file size %d\n',C_Filesize);
fprintf('PSNR = %.4f\n',PEAKSNR);
iQ




