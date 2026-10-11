% A function that advances the sequence first and then flip the sequence. The
% function will receive two arguments as defined below, first is input signal which needs to
% be moved and then flipped, and second is the number of samples by which the signal should be advanced.

% [x]= advflip (u,s)


function [x] = advflip(u, s)
    u_advanced = circshift(u, -s);
    
    % zero out the wrapped-around trailing elements
    if s > 0 && s <= length(u)
        u_advanced(end-s+1:end) = 0;
    end

    % advance
    x = fliplr(u_advanced);
end
