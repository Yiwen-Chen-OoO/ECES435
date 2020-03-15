function [NewImg] = GammaCorrection(PATH,gamma)
    img = imread(PATH);
    [Rows, Cols] = size(img);% get the size of img
    DImg = double(img);% convert img to double
    %update the value pixel by pixel
    for i = 1:Rows
        for j = 1:Cols
            DImg(i,j) = 255*(DImg(i,j)/255)^gamma;
        end
    end
    NewImg = uint8(DImg); % restore the default img format uint8
    subplot(1,2,1);
    imshow(NewImg);
    title(string(PATH));
    subplot(1,2,2);
    [Count, Bin] = imhist(NewImg, 10);
    bar(Bin, Count);
    title(['\gamma = ',num2str(gamma)]);
    
    % with this command, the floating point value would be 
    % rounded and the range would be set to [0,255]
    
end

