function dx = odePU(t, x)    
global A B u k
dx = A(k)*x + B*u;
end

