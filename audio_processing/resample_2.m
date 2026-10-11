% Script to resample the audio signals in "sunday.wav" such that new
% waveform has a new sample rate of 11025. Plot these two waveforms and their absolute difference by using subplot.

[x, Fs] = audioread('sunday.wav');
% resample
y = resample(x, 11025, Fs);

% same length for comparison
N = min(length(x), length(y));
x1 = x(1:N);
y1 = y(1:N);

% absolute difference
difference = abs(x1 - y1);

subplot(3,1,1);
plot(x);
title('Original Audio Signal');
xlabel('Sample');
ylabel('Amplitude');

subplot(3,1,2);
plot(y);
title('Resampled Audio Signal - 11025 Hz');
xlabel('Sample');
ylabel('Amplitude');

subplot(3,1,3);
plot(difference);
title('Absolute Difference');
xlabel('Sample');
ylabel('Difference');
