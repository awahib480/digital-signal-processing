% script that delays the unit impulse by 5 samples.

n = -5:5;
x = (n == 0);

subplot(2,1,1);
stem(n, x);
title('Impulse Signal');
xlabel('n'); ylabel('Delta(n)');

subplot(2,1,2);
x_delayed = (n-3 == 0);
stem(n, x_delayed);
xlabel('n'); ylabel('Delta(n-3)');

