%% Parametri 1
global m K a sigma1 sigma0 z0 vu
m = 0.1;
K = 100;
a = 0.25;
sigma1 = 30;
sigma0 = 2e4;
vu = 0.002;
z0 = 1e-5;
T = 5;

%% Pozivanje simulinka
sim('vj6simulink.slx');

%% Simulacija s ode45
x0 = [0, 0, 0, 0];
[t1, y1] = ode45(@vj6ode, [0, T], x0);

%% Plot
plot(t1, y1(:,2), '--b','LineWidth', 2);
xlabel('t(s)');
ylabel('y2(m)');

%%
clear all;
clc;

%% Parametri 2
global m l g b
m = 1.5;
l = 0.2;
g = 9.81;
b = 0.1;

%% Ode45
x0 = [pi/8, 0];
[t2, y2] = ode45('vj6ode2', [0, 10], x0);

%% Plot
plot(t2, y2(:,2))
xlabel('t(s)');
ylabel('\theta (rad)');
legend('kut zakreta')



