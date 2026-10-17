w = linspace(-20,20,200);

% H1(z)
b1 = [1 1];
a1 = [1 -0.9 0.81];
H1 = freqz(b1,a1,w);

% H2(z)
b2 = [2 5 12];
a2 = [1 2 10];
H2 = freqz(b2,a2,w);

subplot(2,1,1);
plot(w,H1);
title('Frequency Response H1(z)');
xlabel('\omega'); ylabel('H1');

subplot(2,1,2);
plot(w,H2);
title('Frequency Response H2(z)');
xlabel('\omega'); ylabel('H2');
