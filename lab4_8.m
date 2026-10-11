n = -5:15;

% Inputs
a1 = 1; x1 = 1 * (n >= 1); % Step at n=1, value 1
a2 = 2; x2 = 3 * (n >= 5); % Step at n=5, value 3

% Path 1: H{a1*x1 + a2*x2}
x_prod = a1*x1 + a2*x2;
y1 = (n - 3 >= 1).*1*a1 + (n - 3 >= 5).*3*a2; %delay by 3

% Path 2: a1*H{x1} + a2*H{x2}
y1_del = a1 * (1 * (n - 3 >= 1));
y2_del = a2 * (3 * (n - 3 >= 5));
y2 = y1_del + y2_del;

% Proof verification
if isequal(y1, y2)
    disp('Linearity Property PROVED: Path 1 equals Path 2');
else
    disp('Linearity Property FAILED');
end