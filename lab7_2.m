% 1) H(z) = (z+1)/(z^2 - 0.9z + 0.81)
num1 = [1 1];
den1 = [1 -0.9 0.81];

z1 = roots(num1);
p1 = roots(den1);

figure;
pzmap(tf(num1,den1));
grid on;
title('H_1(z)');

% 2) H(z) = (2z^2+5z+12)/(z^2+2z+10)
num2 = [2 5 12];
den2 = [1 2 10];

z2 = roots(num2);
p2 = roots(den2);

figure;
pzmap(tf(num2,den2));
grid on;
title('H_2(z)');

disp('Zeros and poles of H1:')
z1, p1

disp('Zeros and poles of H2:')
z2, p2