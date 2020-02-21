function [shifted] = getIndex(unshifted,LUTvals)
    %value expected :  logical invert of the original decoded index
    %search first right then left, shortest path
    unshifted = unshifted + 1; % Image 0-255, LUT 1-256
    Target = ~LUTvals(unshifted);
    i = 1;
    while 1
        if (unshifted+i <= 256) && (LUTvals(unshifted+i) == Target)
            shifted = unshifted + i;
            break;
        elseif (unshifted-i >= 1)&&(LUTvals(unshifted-i) == Target)
            shifted = unshifted - i;
            break;
        else
        i=i+1;
    end
    
    

end

