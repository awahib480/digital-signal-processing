t = -5:0.01:5;
x = sawtooth(2*pi*t, 0.5);

x_comp = sawtooth(2*pi*(2*t), 0.5);   % Compressed: x(2t) double frequency
x_dil  = sawtooth(2*pi*(t/2), 0.5);   % Dilated: x(t/2) half frequency

subplot(3,1,1); plot(t, x);      title('Original Triangular Wave x(t)');   grid on;
subplot(3,1,2); plot(t, x_comp); title('Compressed x(2t)');                grid on;
subplot(3,1,3); plot(t, x_dil);  title('Dilated x(t/2)');                  grid on;