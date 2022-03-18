%% a) parametri sustava
global m k1 k2 c
m = 1.8;
k1 = 4.2;
k2 = 2.1;
c = 1.3;

%% b) matrice
global A B C D
A = [0 1;-(k2+k1)/m -c/m];
B = [0;1/m];
C = [1 0];
D = 0;

%% c) step
global u
u = 2;

%% 4.
eig(A)
t1 = 25;
[t x] = ode45(@odePU, [0 t1], [0 0])
plot(t, x(:, 1))
hold on
[t x] = ode45(@odePU, [0 t1], [2 0])
plot(t, x(:, 1), '--r')
hold on
[t x] = ode45(@odePU, [0 t1], [0 2])
plot(t, x(:, 1), '--k')
legend
xlabel('t(s)')
ylabel('x(m)')

















