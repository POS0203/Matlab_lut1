function [u, t] = ode_FE(f, U_0, dt, T)
    % Intup data for Forward Euler
    
    N_t = floor(T/dt);                  % Number of step
    u = zeros(N_t+1, 1);                % First variable
    t = linspace(0, N_t*dt, length(u)); % Second variable 
    u(1) = U_0;                         % Initial values
    
    for n = 1:N_t
        u(n+1)  = u(n) + dt*f(u(n), t(n));
    end
   
end

