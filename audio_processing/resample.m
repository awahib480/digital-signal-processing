% Script to record your utterance with a sample rate of 32 KHz and 8-bit
% resolution. Try to resample the audio signals at decreasing sample rates of 16 KHz, 8 KHz, 
% 4 KHz, 2 KHz, 1 KHz, and so on.

F = 32000;
record = audiorecorder(F, 8, 1);  % (sampling_freq, bit_res, channel)

disp("Recording started!");
recordblocking(record, 5);  % 5-second
disp("Recording finished!");

y = getaudiodata(record);
audiowrite('record.wav', y, F, 'BitsPerSample', 8);  % save to file

% read file
[y, f] = audioread('record.wav');

y16k = resample(y,16000,f);
audiowrite('record_16k.wav',y16k,16000);

y8k = resample(y,8000,f);
audiowrite('record_8k.wav',y8k,8000);

y4k = resample(y,4000,f);
audiowrite('record_4k.wav',y4k,4000);

y2k = resample(y,2000,f);
audiowrite('record_2k.wav',y2k,2000);

y1k = resample(y,1000,f);
audiowrite('record_1k.wav',y1k,1000);

y500 = resample(y,500,f);
audiowrite('record_500.wav',y500,500);

y250 = resample(y,250,f);
audiowrite('record_250.wav',y250,250);

