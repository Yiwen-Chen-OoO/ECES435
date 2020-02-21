function [Img_bit] = getPlane(Image,bit_plane)
% get the bit plane for the image given
Image = double(Image);
Img_bit = bitget(Image,bit_plane);


end

