% Exercicio 1.3.1 - PVI := u_t + u_x = 0 em -1 <= x <= 3, 0 <= t <= 2.4
%                        u_0 (x) = | cos^2 (pi * x), se |x| <= 1/2
%                                  | 0             , c.c.

x_inicial  = -1;
x_final    = 3;
t_final    = 2.4;
a          = 1;
hs         = [1/10 1/20 1/40];

function u = u_inicial(x)
    if (abs(x) <= 0.5)
        u = (cos(pi * x))^2;
    else
        u = 0;
    end
end


% (a) ftbs com lambda = 0.8
%lambda     = 0.8;
%h = hs(3);
%v = ftbs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);


% (b) ftcs com lambda = 0.8
%lambda     = 0.8;
%h = hs(3);
%v = ftcs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);


% (c) lax-friedrichs com lambda = [0.8 1.6]
%lambda     = [0.8 1.6];
%lambda = lambda(2);
%h = hs(3);
%v = lax_friedrichs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);

% (d) leapfrog com lambda = 0.8
lambda      = 0.8;
%lambda     = 1.6;
h = hs(1);
v = leapfrog(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);

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
