function [x] = flipadv(u, s)
    flipped = fliplr(u);
    x = circshift(flipped, -s);  % -s(-k)

    % zero out wrapped-around elements
    if s > 0 && s <= length(x)
        x(end-s+1:end) = 0;
    end
end