function [x] = advflip(u, s)
    u_advanced = circshift(u, -s);
    
    % zero out the wrapped-around trailing elements
    if s > 0 && s <= length(u)
        u_advanced(end-s+1:end) = 0;
    end

    % advance
    x = fliplr(u_advanced);
end