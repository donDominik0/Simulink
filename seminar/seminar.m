%% Parametri
global Kv omegav ps pa B V0 qrm J b c Km
Kv = 5.55e-7;
omegav = 113;
ps = 100e5;
pa = 1e5;
B = 1350e6;
V0 = 150e-6;
qrm = 25.6e-6;
J = 0.00156;
b = 0.5;
c = 150;
Km = 1;

%% tlak
function [dp1, dp2] = tlak(Q1, omega_m, theta_m, Q2)
%global qrm B V0;
qrm = 25.4e-6;
B = 1350e6;
V0 = 150e-6;

dp1 = (B/(V0 + qrm*omega_m) * (Q1 - qrm*theta_m));
dp2 = (B/(V0 - qrm*omega_m) * (Q2 + qrm*theta_m));

end

%% ventil
function [Q1, Q2] = protok(p1, yv, p2)
%global ps pa;
ps = 100e5;
pa = 1e5;

if yv >= 0
    Q1 = yv * sqrt(abs(ps - p1)) * sign(ps - p1);
    Q2 = -yv * sqrt(abs(p2 - pa)) * sign(p2 - pa);
else
    Q1 = yv * sqrt(abs(p1 - pa)) * sign(p1 - pa);
    Q2 = -yv * sqrt(abs(ps - p2)) * sign(ps - p2);
end

end


