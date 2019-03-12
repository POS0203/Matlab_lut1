clc
close all
% Intup data
f = @(u, t) 0.1*(1 - u/500)*u;        % logistic model
U_0 = 100;                            % initial condition
T = 60;                               % time interval: from 0 to T
N = input('Write number of plots:');  % number of plots
d_t = 15;                             % initial time step
% Plot graph 1 and 2 for first corresponding
dt_1 = 2^(-0)*d_t;                    % time step
[u_2, t_2] = ode_FE(f, U_0, dt_1, T); % Outputs from Forward Euler
dt_2 = 2^(-1)*d_t;                    % time step
[u_3, t_3] = ode_FE(f, U_0, dt_2, T); % Outputs from Forward Euler
plot(t_3,u_3, 'b')
hold on
plot(t_2,u_2, 'r')
title('Logistic model')
xlabel('t [min]')
ylabel('u [-]')
legend(['Step = ', num2str(dt_2) ,''],['Step = ', num2str(dt_1) ,''])

for k = 2:1:N
    r = input('If you are not satisfied with result, press 0.\n');
    if r == 0
    dt = 2^(-k)*d_t;
    [u_1, t_1] = ode_FE(f, U_0, dt, T);
    close all
    % Plot graph 1
    plot(t_1,u_1, 'b')
    hold on
    % Plot graph 2
    plot(t_2,u_2, 'r')
    title('Logistic model')
    xlabel('t [min]')
    ylabel('u [-]')
    legend(['Step = ', num2str(dt) ,''],['Step = ', num2str(dt*2) ,''])
    u_2 = u_1;
    t_2 = t_1;
    else
        break
    end
end




