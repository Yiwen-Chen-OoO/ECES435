function [Img_bit] = getPlane(Image,bit_plane)

Image = double(Image);
Img_bit = bitget(Image,bit_plane);


end

