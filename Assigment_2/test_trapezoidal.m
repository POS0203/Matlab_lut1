%% Function test_trapeziodal
% Check that linear functions are integrated exactly

% Original equation
f = @(x) (6*x-4);
a = 1.2; b = 4.4; % Limits of integration
F = @(x) (3*x^2-4*x); % Integrated function

expected = F(b) - F(a);
tol = 1E-14;
n = 1; 
computed = trapezoidal_integral(f, a, b, n);
error = abs(expected - computed);
assert(error < tol, 'n=%d, err=%g', n, error);

%% Function test_trapeziodal
% Changed the equation
f = @(x) (6e8*x-4e6);
a = 1.2; b = 4.4; % Limits of integration
F = @(x) (3e8*x^2-4e6*x); %Integrated function

expected = F(b) - F(a);
tol = 1E-6;
n = 1; 
computed = trapezoidal_integral(f, a, b, n);
error = abs(expected - computed);
assert(error < tol, 'n=%d, err=%g', n, error);
