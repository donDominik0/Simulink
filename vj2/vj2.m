clc
clear all
close all
%% Parametri sustava
z1 = 25;
z2 = 75;
J1 = 1.5;
J2 = 2;
D1 = 0.5;
D2 = 1.5;
i = z2/z1;
J = i^2*J1 + J2;
D = D1 + D2;

%% Matrice prostora stanja
A = [0 1;0 -D/J];
B = [0;i/J];
C = [1 0;0 1];
D = [0];

%% Skokovita promjena
u = pi/4;

%% PID
Kp = 35;
Ki = 0;
Kd = 35;

%% Simulink
sim('vj2_simulink');

%% Plot
plot(tout, fi);
%hold on;
%plot(tout, dfi);
xlabel('t(s)');
ylabel('\theta (rad)');
legend('\theta pozicija');
grid on;
xlim = 120;
ylim = 1;




