%% 1. i 2. Parametri
m = 2;
k = 100;
b = 30;
t = [0:0.1:1];

%% 3. Prijenosne funkcije
G = tf(k, [m b k]);
Gm = tf(1/2, [0.01 1]);

%% 4. Otvoreni i zatvoreni krug
Go = series(G, Gm);
Gz = feedback(G, Gm);

%% 5. Nule i polovi sustava
No = zero(Go);
Nz = zero(Gz);
Po = pole(Go);
Pz = pole(Gz);

%% 6. Prikaz polova i linije prigušenja
pzmap(Gz);
grid on
hold on
[xlpo, ylpo] = damp(Gz);
plot(xlpo, ylpo);
pzmap(Go);
grid on
hold on
[xlpz, ylpz] = damp(Go);
plot(xlpz, ylpz);

%% 7. Sustav zapisan u nultočki-polova-pojačanja
[num, den] = tfdata(Gz, 'v');
[Z, P, K] = tf2zp(num, den);
Gzzpk = zpk(Gz);

%% 8. Prostor stanja
Gzss1 = ss(Gz);
[A1, B1, C1, D1] = tf2ss(num, den);
Gzss2 = ss(A1, B1, C1, D1);
[A2, B2, C2, D2] = zp2ss(Z, P, K);

%% 9. Polovi u prostoru stanja
Pss1 = eig(A1);
Pss2 = eig(A2);

%% 10. Step
step(Gzss1);
hold on
step(Gzss2, 'r.');

%% 11. parametri sa get 
V = get(G);

%% 12. InputName i OutputName
set(G, 'InputName', 'brzina');
set(G, 'OutputName', 'brzina mase');

%% 13. Nyquist otvorenog kruga
figure
nyquist(Go);

%% 14. AFK i FFK
[re1, im1, wout1] = nyquist(Go, 0.5);
[re2, im2, wout2] = nyquist(Go, 1);
AFK1 = sqrt(re1^2 + im1^2);
FFK1 = atan(im1/re1);
AFK2 = sqrt(re2^2 + im2^2);
FFK2 = atan(im2/re2);

%% 15. Bode
bode(Go);
bode(Gz);

%% 16. AFK i FFK sa Bode
[AFKB, FFKB] = bode(G, [0.5 1]);

%% 17. 18. rlocus rlocfind
rlocus(Go);
[Kp, P] = rlocfind(Go);

%% 19. Nova prijenosna funkcija
Gp = tf(Kp);
GZ = feedback(G, Gp);

%% 20. Nova prijenosna funkcija odziv
subplot(221);
impulse(GZ)
subplot(222);
step(GZ)
subplot(223);
lsim(GZ, t, t)
subplot(224);
lsim(GZ, t.^2, t)



















