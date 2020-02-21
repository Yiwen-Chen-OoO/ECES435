function [ImageP] = YMembed(Image,Wtmk,key)
%% Generate Look Up Table
rng(key);
LUTvals= rand(1,256) > .5;
%% Image Watermark Extract and Correction
% Arguments Image, wtmk, key
% assume image and water mark share the same size
[r,c] = size(Image);
Bk = zeros(r,c);
for i = 1:r
    for j = 1:c
        Bk(i,j) = LUTvals(Image(i,j)+1);
        W(i,j) = Wtmk(i,j);
        if (Bk(i,j) ~= W(i,j))
            %Pixel Correction
            Image(i,j) = PixModify(Image(i,j),LUTvals);            
        end
    end
end

%% Result Check
ImageP = Image;


end


