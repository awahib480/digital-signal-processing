% A function that flip the sequence first and then advance the sequence. The function
% will receive two arguments as defined below, first is input signal which needs to be
% flipped and then advances, and second is the number of samples by which the signal should be advanced.

% [x]= flipadv (u,s)


function [x] = flipadv(u, s)
    flipped = fliplr(u);
    x = circshift(flipped, -s);  % -s(-k)

    % zero out wrapped-around elements
    if s > 0 && s <= length(x)
        x(end-s+1:end) = 0;
    end
end
