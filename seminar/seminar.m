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
%function [dp1, dp2] = tlak(Q1, omega_m, theta_m, Q2)
%%global qrm B V0;
%qrm = 25.4e-6;
%B = 1350e6;
%V0 = 150e-6;
%
%dp1 = (B/(V0 + qrm*omega_m) * (Q1 - qrm*theta_m));
%dp2 = (B/(V0 - qrm*omega_m) * (Q2 + qrm*theta_m));
%
%end

%% ventil
%function [Q1, Q2] = protok(p1, yv, p2)
%%global ps pa;
%ps = 100e5;
%pa = 1e5;
%
%if yv >= 0
%    Q1 = yv * sqrt(abs(ps - p1)) * sign(ps - p1);
%    Q2 = -yv * sqrt(abs(p2 - pa)) * sign(p2 - pa);
%else
%    Q1 = yv * sqrt(abs(p1 - pa)) * sign(p1 - pa);
%    Q2 = -yv * sqrt(abs(ps - p2)) * sign(ps - p2);
%end

%end

%% plots
%plot 1
figure
subplot(2,1,1);
plot(out.t, out.theta_m, 'LineWidth', 2);
hold on
plot(out.t, out.theta_r, 'k--', 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Kut zakreta \theta [rad]');
legend('Kut zakreta', 'Referenca');

subplot(2,1,2);
plot(out.t, out.omega_m, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Kutna brzina \omega [rad/s]');

%plot 2
figure
subplot(2,1,1);
plot(out.t, out.i, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Struja i [A]');

subplot(2,1,2);
plot(out.t, out.yv, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Pozicija ventila yv [m]');

%plot 3
figure
subplot(2,1,1);
plot(out.t, out.Q1, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Protok Q1 [m^3/s]');

subplot(2,1,2);
plot(out.t, out.Q2, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Protok Q2 [m^3/s]');

%plot 4
figure
subplot(2,1,1);
plot(out.t, out.p1, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Tlak p1 [Pa]');

subplot(2,1,2);
plot(out.t, out.p2, 'LineWidth', 2);
grid on
xlabel('Vrijeme [s]');
ylabel('Tlak p2 [Pa]');




