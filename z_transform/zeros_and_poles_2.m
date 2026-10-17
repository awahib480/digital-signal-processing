% Poles and Zeros of:
% y(n) = x(n) + 2x(n-1) - 0.9y(n-1)

% H(z) = (1 + 2z^-1)/(1 + 0.9z^-1)
b = [1 2];
a = [1 0.9];

% Find zeros and poles
z = roots(b);
p = roots(a);

disp('Zeros:');
disp(z);

disp('Poles:');
disp(p);

% Pole-zero plot
zplane(b,a);
grid on;
title('Pole-Zero Plot');
