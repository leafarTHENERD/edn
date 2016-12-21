% Exercicio 3.5.1 - PVC := u_t + u_x = 0 em -1 <= x <= 1, 0 <= t <= 1
%                          u(t, -1) = sin pi * (x - t)
%                          u(0,  x) = sin pi * (x - t)
x_inicial   = -1;
x_final     = 1;
t_final     = 1;
a           = 1;
hs          = [1/10 1/20 1/40];
lambda      = 1;

function u1 = u_x_inicial(t)
    u1 = sin(pi*(-1 - t));
end

function u0 = u_inicial(x)
    u0 = sin(pi * x);
end


h = hs(3);
v = crank_nicolson_lower_bound(@u_inicial, @u_x_inicial, x_inicial, x_final, t_final, a, lambda, h);

x_m = x_inicial:h:x_final;
t_n = 0:(lambda*h):t_final;

fg = figure;
hold on;

x_m = x_inicial:h:x_final;
t_n = 0:(lambda*h):t_final;

xlabel('x_m');
ylabel('t_n');
zlabel('v_n_m');

view(3);
mesh(x_m, t_n, v);

fprintf('Program paused. Press enter to exit.\n');
pause;
