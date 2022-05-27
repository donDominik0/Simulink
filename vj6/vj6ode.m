function [dy] = vj6ode(t, x)
global m K a sigma1 sigma0 z0 vu 

dy = zeros(4, 1);

if (x(3) > 0 && x(4) >= z0) || (x(3) < 0 && x(4) <= -z0)
    dz = 0;
else
    dz = x(3);
end

if abs(x(4)) <= z0
    Ft = sigma0*(1 + a)*x(4) + sigma1*dz;
else
    Ft = sigma0*z0*sign(x(4));
end

dy(1) = vu;
dy(2) = x(3);
dy(3) = -K/m*x(2) - Ft/m +K/m*x(1);
dy(4) = dz;


end

