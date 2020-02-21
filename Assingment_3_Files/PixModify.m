function [shifted] = PixModify(unshifted,LUTvals)
   
    %search first right then left, shortest path in Look Up table with
    %value of logical invert of the current cell
    
    unshifted = unshifted + 1; % Image 0-255, LUT 1-256
    Target = ~LUTvals(unshifted);  %value expected :  logical invert of the original decoded index
    i = 1;
    while 1
        %not exceeding the range, but search until find the target value
        if (unshifted+i <= 256) && (LUTvals(unshifted+i) == Target)
            shifted = unshifted + i-1;%-1 means change the boundary 1-256 -> 0-255
            break;
        elseif (unshifted-i >= 1)&&(LUTvals(unshifted-i) == Target)
            shifted = unshifted - i-1;
            break;
        else
        i=i+1;
    end
    
    

end

