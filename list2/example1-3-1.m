% Exemplo 1.3.1 - PVI := u_t + u_x = 0 em -2 <= x <= 3, 0 <= t
%                        u_0 (x) = | 1 - |x|, se |x| <= 1
%                                  | 0        se |X| >= 1

x_inicial  = -2;
x_final    = 3;
t_objetivo = 1.6;
a          = 1;
lambda     = 0.8;
h          = 0.1;

function u = u_inicial(x)
    if (abs(x) <= 1)
        u = 1 - abs(x);
    else
        u = 0;
    endif
end

v = lax_friedrichs(@u_inicial, x_inicial, x_final, t_objetivo, a, lambda, h);
t = v(size(v)(1), :)

fg = figure;
hold on;

%p = plot(x_inicial:h:x_final, t);
%set(p, 'marker', 'o');
%set(p, 'color', [1 .25 .5]);
%set(p, 'markerSize', 5);

x_m = x_inicial:h:x_final;
t_n = 0:(lambda*h):t_objetivo;

mesh(x_m, t_objetivo, t);
mesh(x_m, t_n, v);

fprintf('Program paused. Press enter to exit.\n');
pause;
