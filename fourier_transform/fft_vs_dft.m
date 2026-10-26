% Comparing DFT and FFT

N_vals = [64, 128, 256, 512, 1024, 2048];
t_dft = zeros(size(N_vals));
t_fft = zeros(size(N_vals));

for idx = 1:length(N_vals)
    N = N_vals(idx);
    x = randn(1, N); % Random test sequence

    % Direct DFT (O(N^2))
    tic;
    X_dft = zeros(1, N);
    for k = 0:N-1
        for n = 0:N-1
            X_dft(k+1) = X_dft(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
    end
    t_dft(idx) = toc;

    % Built-in FFT (O(N log N))
    tic;
    X_fft = fft(x);
    t_fft(idx) = toc;
end

% Plotting
figure;
plot(N_vals, t_dft, '-o', 'LineWidth', 1.5); hold on;
plot(N_vals, t_fft, '-s', 'LineWidth', 1.5); grid on;
title('Computation Time: Direct DFT vs. Built-in FFT');
xlabel('Sequence Length N'); ylabel('Execution Time (seconds)');
legend('Direct DFT', 'Built-in FFT');
