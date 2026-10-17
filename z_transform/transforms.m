% z-transforms

syms z n

% a) x(n) = [5*2^n - 3^n]u(n)
Xa = ztrans(5*2^n - 3^n, n, z);
iztrans(Xa,z,n)

% b) x(n) = [7*3^n - 4*(-1)^n]u(n)
Xb = ztrans(7*3^n - 4*(-1)^n, n, z);
iztrans(Xb,z,n)

% c) x(n) = [6^n + 2*exp(-5*n)]u(n)
Xc = ztrans(6^n + 2*exp(-5*n), n, z);
iztrans(Xc,z,n)

% d) x(n) = cos(pi*n)u(n)
Xd = ztrans(cos(pi*n), n, z);
iztrans(Xd,z,n)
