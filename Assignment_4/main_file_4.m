close all
clc

% Input data
a=0.1; % Length of crank [m]
b=0.2; % Length of piston rod [m]
t=linspace(0,10,100); % Time [sec]
omega=1; % Angular velocity [rad/sec]
phi= (pi/6)+omega.*t; % Angle of drive rod

x_r=[0;1]; % Estimation
eps=1e-7; % Accurancy

x=zeros(2,length(t));
vel=zeros(2,length(t));
acc=zeros(2,length(t));

for i=1:length(t)
% Position
% u(1) = theta
% u(2) = d   

F=@(u) [a*cos(phi(i))+b*cos(u(1))-u(2);
        a*sin(phi(i))-b*sin(u(1))];

Jac=@(u) [-b*sin(u(1)) -1;
         -b*cos(u(1))  0];

[x(:,i),~] = NR_method(F, Jac, x_r, eps);

% Velocities
% v(1) = theta prime(velocity)
% v(2) = piston velocity

F=@(vel) [-a*sin(phi(i))*omega-b*sin(x(1,i))*vel(1)-vel(2);
        +a*cos(phi(i))*omega-b*cos(x(1,i))*vel(1)];

Jac=@(vel) [-b*sin(vel(1)) -1;
            -b*cos(vel(1))  0];
    
[vel(:,i),~] = NR_method(F, Jac, x_r, eps);

% Acceleration
% a(1)=theta double prime (accel)
% a(2)=piston accel
    
F=@(acc) [-a*cos(phi(i))*omega^2-b*cos(x(1,i))*(vel(1,i))^2-b*sin(x(1,i))*acc(1)-acc(2);
          -a*sin(phi(i))*omega^2+b*sin(x(1,i))*(vel(1,i))^2-b*cos(x(1,i))*acc(1)];

Jac=@(acc) [-b*sin(acc(1)) -1;
          -b*cos(acc(1))  0];
    
[acc(:,i),~] = NR_method(F, Jac, x_r, eps);
end

% Kinematics of piston
figure 
plot(t,x(2,:))
hold on
title('Kinematics of piston')
xlabel('Time [sec]')
plot(t,vel(2,:))
plot(t,acc(2,:))
legend('Displacement','Velocity','Acceleration')

% Kinematics of piston rod
figure 
plot(t,x(1,:))
hold on
title('Kinematics of piston rod')
xlabel('Time [sec]')
plot(t,vel(1,:))
plot(t,acc(1,:))
legend('Angle','Angular velocity','Angular acceleration')