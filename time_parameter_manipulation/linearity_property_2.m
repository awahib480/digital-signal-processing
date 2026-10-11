% Verify the Linearity property by using the following parameters
% a) x1 = Unit Step (Step time = 1 & Final value = 1)
% b) x2 = Unit Step (Step time = 5 & Final value = 3)
% c) α1 = 7
% d) α2 = 19
% e) Sys(H) = 5 * X (n – 7)

n = -5:20;

% Inputs
a1 = 7;  x1 = 1 * (n >= 1); % Step at n=1, value 1
a2 = 19; x2 = 3 * (n >= 5); % Step at n=5, value 3

% Path 1: H{a1*x1 + a2*x2}
x_prod = a1*x1 + a2*x2;
y1 = 5 * (n - 7 >= 1).*a1 + 5 * (n - 7 >= 5).*3*a2; % delay by 7 and scale by 5

% Path 2: a1*H{x1} + a2*H{x2}
y1_del = a1 * (5 * (n - 7 >= 1));
y2_del = a2 * (5 * 3 * (n - 7 >= 5));
y2 = y1_del + y2_del;

% Proof verification
if isequal(y1, y2)
    disp('Linearity Property PROVED: Path 1 equals Path 2');
else
    disp('Linearity Property FAILED');
end
