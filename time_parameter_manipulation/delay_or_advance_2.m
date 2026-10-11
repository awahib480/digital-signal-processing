% Generate a script that uses user input to shift unit step response right or left. Use MATLAB
% input command to take the number of samples to shift the signal and use switch option or
% If - else statement to decide whether to shift the signal to the right (delay) or to the left (advance).

n = -5:5;
x = (n >= 0);

direction = input("Enter direction to shift (1 for left / 2 for right): ");
k = input("Enter no. of samples to shift: ");

if direction == 1
    k = -k;
elseif direction == 2
    k = k;
end

subplot(2,1,1);
stem(n, x);
title('Unit Step Signal');
xlabel('n'); ylabel('u(n)');

subplot(2,1,2);
x_shifted = ((n-k) >= 0);
stem(n, x_shifted);
xlabel('n'); ylabel('Shifted Signal');
