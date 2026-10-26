x = [3, 0, 2, 9];
N = length(x);

% 1. Built-in FFT
X_fft = fft(x);

% 2. Radix-2 DIT Algorithm
x_dit = x([1, 3, 2, 4]); % Bit-reversed input
A0 = x_dit(1) + x_dit(2);
A1 = x_dit(1) - x_dit(2);
B0 = x_dit(3) + x_dit(4);
B1 = x_dit(3) - x_dit(4);

X_dit = zeros(1, 4);
X_dit(1) = A0 + 1 * B0;
X_dit(2) = A1 + (-1i) * B1;
X_dit(3) = A0 - 1 * B0;
X_dit(4) = A1 - (-1i) * B1;

% 3. Radix-2 DIF Algorithm
C0 = x(1) + x(3);
C1 = x(2) + x(4);
D0 = (x(1) - x(3)) * 1;
D1 = (x(2) - x(4)) * (-1i);

X_dif = zeros(1, 4);
X_dif(1) = C0 + C1; % X[0]
X_dif(3) = C0 - C1; % X[2]
X_dif(2) = D0 + D1; % X[1]
X_dif(4) = D0 - D1; % X[3]

% Display Verification
disp('Built-in FFT:'); disp(X_fft);
disp('Manual DIT:  '); disp(X_dit);
disp('Manual DIF:  '); disp(X_dif);