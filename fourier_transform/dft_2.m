% DFT using fft(x, 32) and plotting magnitude and phase spectrum

% signal of 32 samples
N = 32;
n = 0:N-1;
x = 0.8.^n; % Truncated 0.8^n * u(n)

% 32-point DFT
X = fft(x, N);

% Normalized frequency vector k/N
k_norm = (0:N-1) / N;

% Magnitude and Phase
magX = abs(X);
phaseX = angle(X); % Phase in radians

% Magnitude Spectrum
subplot(2,1,1);
stem(k_norm, magX, 'filled', 'LineWidth', 1.2);
grid on;
title('Magnitude Spectrum |X[k]|');
xlabel('Normalized Frequency (k/N)');
ylabel('Magnitude');

% Phase Spectrum
subplot(2,1,2);
stem(k_norm, phaseX, 'filled', 'LineWidth', 1.2);
grid on;
title('Phase Spectrum \angle X[k]');
xlabel('Normalized Frequency (k/N)');
ylabel('Phase (radians)');
