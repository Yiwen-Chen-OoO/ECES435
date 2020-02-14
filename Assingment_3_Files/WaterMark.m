function [Img_bit] = WaterMark(Original,Watermark,bit_plane)
Result = (zeros(size(Original)));
Original = double(Original);
Watermark = double(Watermark);

for i = 1:8
    if i ~= bit_plane
        Result = Result + (2^(i-1))*getPlane(Original,i);
    else
        Result = Result + (2^(i-1))*getPlane(Watermark,8);
    end
end
Img_bit = Result;
end


