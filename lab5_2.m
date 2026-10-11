[hello, f] = audioread('Lab5_DSP/recordings/hello.wav');
sound(hello, f);

fprintf("Information of Sound File 'hello.wav'\n")
fprintf("Sampling Points: %d samples\n", length(hello));
fprintf("Sampling Rate: %d samples/sec\n", f);

info = audioinfo("Lab5_DSP/recordings/hello.wav");
fprintf("Bit Resolution: %d bits/sample\n", info.BitsPerSample);
fprintf("Time Duration: %.3f seconds\n", info.Duration);