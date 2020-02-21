function [Img_bit] = WaterMark(Original,Watermark,bit_plane)
% N least signicant bit planes from one image with the N most
% signigcant bit planes from another image


Result = double(Original);%initializing result mat
Watermark = double(Watermark);

for i = 1:bit_plane
    Result = bitset(Result,i,getPlane(Watermark,i+8-bit_plane));
    % set the ith bit plane with the i+8-bit_plane bit plane of watermark
    
end

Img_bit = uint8(Result);
end


