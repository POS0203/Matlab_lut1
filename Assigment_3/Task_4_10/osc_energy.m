function [ep, ec] = osc_energy(u, v, omega)

ep = 1/2*omega.^2*u.^2;
ec = 1/2*v.^2;

end