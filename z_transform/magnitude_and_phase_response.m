% Magnitude and Phase Response

w = linspace(-20,20,200);

% H1(z)
b1 = [1 1];
a1 = [1 -0.9 0.81];
H1 = freqz(b1,a1,w);

% H2(z)
b2 = [2 5 12];
a2 = [1 2 10];
H2 = freqz(b2,a2,w);

% H1 plots
subplot(2,2,1);
plot(w,20*log10(abs(H1)));
grid on;
title('H1 Magnitude (dB)');
xlabel('\omega'); ylabel('Magnitude (dB)');

subplot(2,2,2);
plot(w,angle(H1)*180/pi);
grid on;
title('H1 Phase (degrees)');
xlabel('\omega'); ylabel('Phase (°)');

% H2 plots
subplot(2,2,3);
plot(w,20*log10(abs(H2)));
grid on;
title('H2 Magnitude (dB)');
xlabel('\omega'); ylabel('Magnitude (dB)');

subplot(2,2,4);
plot(w,angle(H2)*180/pi);
grid on;
title('H2 Phase (degrees)');
xlabel('\omega'); ylabel('Phase (°)');
