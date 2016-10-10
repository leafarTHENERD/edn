% Exemplo 1.3.1 - PVC := u_t + u_x = 0 em -2 <= x <= 3, 0 <= t
%                        u_0 (x) = | 1 - |x|, se |x| <= 1
%                                  | 0        se |X| >= 1

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
    endif
end


% (a) ftbs com lambda = 0.8
lambda     = 0.8;
v = ftbs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);

% (b) ftcs com lambda = 0.8
lambda     = 0.8;
v = ftcs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);


% (c) lax-friedrichs com lambda = [0.8 1.6]
lambda     = [0.8 1.6];
v = lax_friedrichs(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);

% (d) leapfrog com lambda = 0.8
lambda     = 0.8;
v = leapfrog(@u_inicial, x_inicial, x_final, t_final, a, lambda, h);

%x_m = x_inicial:h:x_final;
%t_n = 0:(lambda*h):t_final;

fg = figure;
hold on;

%p = plot(x_inicial:h:x_final, t);
%set(p, 'marker', 'o');
%set(p, 'color', [1 .25 .5]);
%set(p, 'markerSize', 5);

%x_m = x_inicial:h:x_final;
%t_n = 0:(lambda*h):t_final;

%mesh(x_m, t_final, t);
%mesh(x_m, t_n, v);

fprintf('Program paused. Press enter to exit.\n');
pause;
