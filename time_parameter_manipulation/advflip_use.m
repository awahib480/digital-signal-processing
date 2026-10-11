% Using the advflip(u,s) function

n = -5:5;
u = (n >= 0); % Unit step sequence
s = 2;        % Advance by 2 samples

x = advflip(u, s);

figure;
subplot(2,1,1);
stem(n, u, 'b', 'LineWidth', 1.5);
title('Original Sequence u[n]');
xlabel('n'); ylabel('Amplitude'); grid on; ylim([-0.2 1.2]);

subplot(2,1,2);
stem(n, x, 'r', 'LineWidth', 1.5);
title(sprintf('Advanced then Flipped Sequence x[n] = u[-n + %d]', s));
xlabel('n'); ylabel('Amplitude'); grid on; ylim([-0.2 1.2]);
