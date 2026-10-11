% Script that can read the wav file "hello.wav" and display the following information:
% a. Number of sample points.
% b. Sampling rate.
% c. Bit resolution
% d. Time duration of the recording (in terms of seconds)

[hello, f] = audioread('hello.wav');
sound(hello, f);

fprintf("Information of Sound File 'hello.wav'\n")
fprintf("Sampling Points: %d samples\n", length(hello));
fprintf("Sampling Rate: %d samples/sec\n", f);

info = audioinfo("hello.wav");
fprintf("Bit Resolution: %d bits/sample\n", info.BitsPerSample);
fprintf("Time Duration: %.3f seconds\n", info.Duration);
