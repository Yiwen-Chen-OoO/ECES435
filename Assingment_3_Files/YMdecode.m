function [W] = YMdecode(Image,key)
%% Generate Look Up Table
rng(key);
LUTvals= rand(1,256) > .5;

[r,c] = size(Image);
W = zeros(r,c);
for i = 1:r
    for j = 1:c
        W(i,j) = LUTvals(Image(i,j)+1);
        % decode using the Look Up Table
        % The +1 change the range of colors 0-255 -> LUT index range
        % 1-256
        
    end
end
end

