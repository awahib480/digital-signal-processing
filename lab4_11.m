n = -10:10;
n0 = 3;                         % Input shift

% Task 1: Delay impulse by 5
x = (n == 0);
y = (n-5 == 0);
y_shift = (n-n0-5 == 0);
x_shift = (n-n0 == 0);
T_xshift = (n-n0-5 == 0);

disp('Task 1:')
disp(isequal(y_shift,T_xshift))


% Task 2: Shift impulse by s
s = 4;
x = (n == 0);
y = (n-s == 0);
y_shift = (n-n0-s == 0);
T_xshift = (n-n0-s == 0);

disp('Task 2:')
disp(isequal(y_shift,T_xshift))


% Task 3: Shift step by s
s = 4;
x = (n >= 0);
y = (n-s >= 0);
y_shift = (n-n0-s >= 0);
T_xshift = (n-n0-s >= 0);

disp('Task 3:')
disp(isequal(y_shift,T_xshift))


% Task 4: Flip then advance by s
s = 2;
x = (n >= 0);
y_shift = (-n+n0-s >= 0);      % T{x(n-n0)}
T_xshift = (-n-n0-s >= 0);     % y(n-n0)

disp('Task 4:')
disp(isequal(y_shift,T_xshift))