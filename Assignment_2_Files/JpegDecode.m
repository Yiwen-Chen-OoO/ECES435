function [Dimage,iQ] = JpegDecode()
% This function would the file "JPEG_DCTQ_ZZ.txt' as the input
% Perform decoding and return decoded image and the size
    % call entropy decode function
    [rowN,colN,dct_block_size,iQ,iZZDCTQIm]=JPEG_entropy_decode('');
    Dimage = zeros(rowN,colN); %initialize result array
    %nested for loop for each 8 by 8 block
    for i = 1:rowN/8
        for j = 1:colN/8
            zVec = iZZDCTQIm(8*8*(i-1)+j,:);  %extract zigzag vector
            Mtx = Vector2ZigzagMtx(iZZDCTQIm(8*8*(i-1)+j,:));% restore zigzag vector to matrix
            DCT = Mtx .* iQ; %Dequantization using iQ
            iDCT = idct2(DCT); %inverse discrete cosine transform
            Dimage((i-1)*8+1:i*8,(j-1)*8+1:j*8) = iDCT; % allocate data to the block anticipated
        end
    end
    Dimage = uint8(Dimage); % change class to uint8
imshow(Dimage); %show result
end