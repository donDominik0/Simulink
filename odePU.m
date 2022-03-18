

function dx = odePU(t, x)    
global A B u
dx = A*x + B*u
end

