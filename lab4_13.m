n = 0:10;

% Random inputs
x1 = rand(1,length(n));
x2 = rand(1,length(n));

% Constants
a1 = 7;
a2 = 19;

% Path 1: H{a1*x1 + a2*x2}
x = a1*x1 + a2*x2;
y1 = 2*x;

for k = 2:length(n)
    y1(k) = y1(k) + 3*x(k-1);
end

% Path 2: a1*H{x1} + a2*H{x2}
y1_del = 2*x1;
y2_del = 2*x2;

for k = 2:length(n)
    y1_del(k) = y1_del(k) + 3*x1(k-1);
    y2_del(k) = y2_del(k) + 3*x2(k-1);
end

y2 = a1*y1_del + a2*y2_del;

% Verification
if isequal(y1,y2)
    disp('Linearity Property PROVED')
else
    disp('Linearity Property FAILED')
end