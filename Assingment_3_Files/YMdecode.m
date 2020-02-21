function [W] = YMdecode(Image,key)
%% Generate Look Up Table
rng(key);
LUTvals= rand(1,256) > .5;

[r,c] = size(Image);
W = zeros(r,c);
for i = 1:r
    for j = 1:c
        W(i,j) = LUTvals(Image(i,j)+1);
        
        
    end
end
end

