function [ImageP,flag] = YMembed(Image,Wtmk,key)
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
        W(i,j) = LUTvals(Wtmk(i,j)+1);
        if Bk(i,j) ~= W(i,j)
            %Pixel Correction
            Image(i,j) = getIndex(Image(i,j),LUTvals);            
        end
    end
end

%% Result Check
flag = 1;
for i = 1:r
    for j = 1:c
      Bk(i,j) = LUTvals(Image(i,j)+1);
      W(i,j) = LUTvals(Wtmk(i,j)+1);
      if Bk(i,j) ~= W(i,j)
          flag = 0;
      end

    end
end
display(flag);
ImageP = Image;
end
