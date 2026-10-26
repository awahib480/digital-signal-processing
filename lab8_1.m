x_a = [4, -3, 2, 0, -1, -2, 3, 1];
N_a = length(x_a);
X_dft_a = zeros(1, N_a);

% equation
for k = 0:N_a-1
    for n = 0:N_a-1
        X_dft_a(k+1) = X_dft_a(k+1) + x_a(n+1) * exp(-1i * 2 * pi * k * n / N_a);
    end
end
X_fft_a = fft(x_a);

disp('=== Part (a) ===');
disp('Direct DFT:'); disp(X_dft_a);
disp('Built-in FFT:'); disp(X_fft_a);


%b
x_b = [1, 1, 1, 1, 1, 1, 1, 1];
N_b = length(x_b);
X_dft_b = zeros(1, N_b);

% equation
for k = 0:N_b-1
    for n = 0:N_b-1
        X_dft_b(k+1) = X_dft_b(k+1) + x_b(n+1) * exp(-1i * 2 * pi * k * n / N_b);
    end
end
X_fft_b = fft(x_b);

disp('=== Part (b) ===');
disp('Direct DFT:'); disp(X_dft_b);
disp('Built-in FFT:'); disp(X_fft_b);