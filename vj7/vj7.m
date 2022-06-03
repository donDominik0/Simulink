%% Parametri sustava
m = 0.12;
M = 0.45;
L = 0.797;
r = 0.015;
I = M*L^2/12;
g = 9.81;
J = 2/5*m*r^2;

%% Prostor stanja
A = [0 1 0 0;
    0 0 -m*g/((J/r^2) + m) 0;
    0 0 0 1;
    0 0 0 0];
B = [0 m*r/(((J/r^2) + m)*I) 0 1/I]';
C = [1 0 0 0;
    0 0 1 0];
D = [0 0]';

%% Pojačanje
Q = [(1/(L/2))^2 0 0 0;
    0 1 0 0;
    0 0 (1/0.3)^2 0;
    0 0 0 1];
R = 1;
K = lqr(A, B, Q, R);

%% Regulator
Ar = A - B*K;
sys = ss(Ar, B, C, D);
t = 0:0.01:8;
u = zeros(size(t));
x0 = [0.1 0 0 0]';
lsim(sys, u, t, x0);







