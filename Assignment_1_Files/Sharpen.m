function [NewImg] = Sharpen(img,alpha)
    DImg = double(img);% convert img to double
    %update the value pixel by pixel
    Laplacian = [0     -0.25 0;
                 -0.25 1 -0.25;
                 0     -0.25 0]
             
    G = filter2(Laplacian,DImg);    
    NewImg = uint8(DImg+alpha*G); % restore the default img format uint8
    
    % with this command, the floating point value would be 
    % rounded and the range would be set to [0,255]
    
end