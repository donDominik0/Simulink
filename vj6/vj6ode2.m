function dy = vj6ode2(t, x)
global m l g b

dy = zeros(2, 1);
dy(1) = x(2);
dy(2) = -g/l*sin(x(1)) - b/(m*l^2)*x(2);

end

