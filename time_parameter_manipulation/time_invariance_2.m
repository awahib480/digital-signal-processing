% Design Time Invariance System by giving random signal and system

n = 0:10;
n0 = 3;                    % Input shift

% Random signal
x = rand(1,length(n));

% Original output: y(n) = 2x(n) + x(n-1)
y = 2*x;
for k = 2:length(n)
    y(k) = y(k) + x(k-1);
end

% Shift the input: x(n-n0)
x_shift = zeros(size(x));
for k = n0+1:length(n)
    x_shift(k) = x(k-n0);
end

% System applied to shifted input: T{x(n-n0)}
y1 = 2*x_shift;
for k = 2:length(n)
    y1(k) = y1(k) + x_shift(k-1);
end

% Shift original output: y(n-n0)
y2 = zeros(size(y));
for k = n0+1:length(n)
    y2(k) = y(k-n0);
end

% Verification
if isequal(y1,y2)
    disp('Time Invariance PROVED')
else
    disp('Time Invariance FAILED')
end
