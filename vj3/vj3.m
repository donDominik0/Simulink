%% 1. Parametri
m1 = 2;
m2 = 0.2;
k1 = 1;
k2 = 0.8;
k3 = 2;
c = 2;

%% 2. 3. A i B su globalne varijable
global A B k u
A = @(k)[0 1 0 0;-(k1+k)/m1 -c/m1 k/m1 c/m1;0 0 0 1;k/m2 c/m2 -(k+k3)/m2 -c/m2];
B = [0;1/m1;0;0];

%% 4. Matrice C i D
C = [1 0 0 0;0 0 1 0];
D = [0;0];

%% 5. Polovi
p = eig(A(k2));

%% 6. Prostor stanja ss
sys = ss(A(k2), B, C, D);

%% 7. 8. Step
sys.OutputName = {'x1', 'x2'};
step(sys, 60);

%% 9. Početni uvjeti
x0 = [0.5;0;-0.3;0];

%% 10. initial
initial(sys, x0, 60);

%% 11. 12. iteracija
u = 0;
t1 = 60;
x1 = [0.5;0;-0.3;0];
for k = [0:0.5:2]
    [t x] = ode45(@odePU, [0 t1], x1);
    txt = ['k_2 = ', num2str(k)];
    figure(1)
    subplot(211)
    plot(t, x(:, 1), 'DisplayName', txt);
    hold on
    ylabel('x1(m)');
    subplot(212)
    plot(t, x(:, 3), 'DisplayName', txt);
    hold on
    xlabel('t(s)');
    ylabel('x2(m)');
    legend
end
    
    