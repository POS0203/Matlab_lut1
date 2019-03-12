clc
close all

omega = 5; % Natural frequency omega
P = 2*pi/omega; % Period
dt = P/60; % Time step
T = 3*P; % Time interval
N_t = floor(T/dt); % Number of elements
t = linspace(0, N_t*dt, N_t+1); % Time vector
u = zeros(N_t+1, 1); % Displacement vector
v = zeros(N_t+1, 1); % Speed vector

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

% plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
% legend('numerical', 'exact','location','northwest');
% xlabel('t');

[ep, ec] = osc_energy(u, v, omega);
sum_E = ec + ep;
plot(t,sum_E)
hold on
plot(t,ep)
plot(t,ec)
legend('Sum energy', 'Potencial energy', 'Kinetic energy')
xlabel('t [s]')
ylabel('E [J]')