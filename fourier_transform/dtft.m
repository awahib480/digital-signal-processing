% Evaluating and plotting DTFT magnitude

% Signal & DTFT grid
x = [1, 1, 1, 1, 0, 0, 0, 0];
N = length(x);
w = linspace(-pi, pi, 1000);
X_dtft = freqz(x, 1, w);

% 8-point DFT & frequency mapping to [-pi, pi]
X_dft = fft(x);
w_dft = wrapToPi((0:N-1) * (2*pi/N));
[w_dft_s, idx] = sort(w_dft);

% Plotting
figure;
subplot(2,1,1);
plot(w/pi, abs(X_dtft), 'b', 'LineWidth', 1.5); hold on;
stem(w_dft_s/pi, abs(X_dft(idx)), 'r', 'filled'); grid on;
title('DTFT Magnitude |X(e^{j\omega})| and DFT Samples');
xlabel('\omega / \pi'); ylabel('Magnitude');
legend('DTFT', '8-point DFT');

subplot(2,1,2);
plot(w/pi, angle(X_dtft), 'b', 'LineWidth', 1.5); grid on;
title('DTFT Phase \angle X(e^{j\omega})');
xlabel('\omega / \pi'); ylabel('Phase (rad)');
