x = [1, 1, 1, 1, 0, 0, 0, 0];

% Periodicity Property: X(e^j(w + 2*pi)) = X(e^j w)
w_test = [-pi/3, 0, pi/4, 2*pi/3]; % Test frequencies

X_w = freqz(x, 1, w_test);
X_w_2pi = freqz(x, 1, w_test + 2*pi);

max_diff_periodicity = max(abs(X_w - X_w_2pi));

disp('=== (i) Periodicity Verification ===');
fprintf('Max difference between X(w) and X(w + 2*pi): %g\n\n', max_diff_periodicity);

% Time-Shifting Property: DTFT{x[n-2]} = X(e^j w) * e^(-j*2*w)
x_shifted = [0, 0, x]; % x[n-2] shifted by 2 samples

w_grid = linspace(-pi, pi, 1000);

% Direct DTFT of shifted sequence (accounting for the n=0 origin alignment)
X_shifted_direct = freqz(x_shifted, 1, w_grid);

% Theoretical DTFT using time-shift property
X_original = freqz(x, 1, w_grid);
X_shifted_theory = X_original .* exp(-1i * 2 * w_grid);

max_diff_shift = max(abs(X_shifted_direct - X_shifted_theory));

disp('=== (ii) Time-Shifting Verification ===');
fprintf('Max difference between direct DTFT{x[n-2]} and theoretical X(w)*e^(-j2w): %g\n', max_diff_shift);