t = -20:20;

% Square wave with amplitude from -5 to 5
x = 5 * square(2*pi*(t/10));

% Flip signal around y-axis (n -> -n)
x_flipped = fliplr(x);

subplot(2,1,1); 
plot(n, x); 
title('Original Square Wave x[n] (-5 to 5)'); 
xlabel('n'); ylabel('Amplitude'); grid on; ylim([-6 6]);

subplot(2,1,2); 
plot(n, x_flipped); 
title('Flipped Square Wave x[-n]'); 
xlabel('n'); ylabel('Amplitude'); grid on; ylim([-6 6]);