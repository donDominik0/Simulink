%% Parametri sustava
J = 3.2284e-6;
b = 3.5077e-6;
Ke = 0.0274;
Km = Ke;
Ra = 4;
La = 2.75e-6;
T = 0.001;

%% Zahtjevi regulacijskog kruga
Tr = 0.04;
Mp = 0.16;
e = 0;
ed = 0;

%% Odziv bez regulatora
t = [0:T:0.2];
s = tf('s');
Gs = Km/(s*(J*La*s^2 + (b*La + J*Ra)*s + b*Ra + Ke*Km));
step(Gs, t)

%% Sustav s regulatorom
num = Km;
den = [J*La (b*La + J*Ra) (b*Ra + Ke*Km) 0];
Kp = 1.7;
Gr = tf(Kp);
Gonum = conv(Kp, num);
Goden = conv(1, den);
[numc, denc] = cloop(Gonum, Goden);
Gz1 = tf(numc, denc);
step(Gz1, t)
hold on
Gz2 = feedback(Gs, Gr);
step(Gz2, t)

%% PID regulator
Kp = 150;
Ki = 50;
Kd = 1;
Gpid = tf([Kd Kp Ki], [1 0]);
Go = series(Gpid, Gs)
Gz = feedback(Go, 1);
step(Gz, t)

%% Root locus PI
num = [1 30];
den = [1 0];
GR = tf(num, den);
GO = series(GR, Gs)
rlocus(GO)
axis([-100, 100, -200, 200]);
sgrid(0.7, 0)
[Kp, polovi] = rlocfind(GO)
GReg = tf([Kp 30*Kp], [1 0]);
G = feedback(series(GReg, Gs), 1);
step(G)

%% Root locus PID
num = [1 90 1800];
den = [1 0];
GR = tf(num, den);
GO = series(GR, Gs)
rlocus(GO)
axis([-100, 100, -200, 200]);
sgrid(0.7, 0)
[Kp, polovi] = rlocfind(GO)
GReg = tf([Kp 90*Kp 1800*Kp], [1 0]);
G = feedback(series(GReg, Gs), 1);
step(G)







