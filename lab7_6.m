% X(z) = (z^3 - 3z^2 + 4z + 1)/(z^3 - 4z^2 + z - 0.16)
b = [1 -3 4 1];
a = [1 -4 1 -0.16];

% Partial fraction expansion
[r,p,k] = residue(b,a);

disp('Residues:');
disp(r);

disp('Poles:');
disp(p);

disp('Direct term:');
disp(k);
