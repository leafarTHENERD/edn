% Exemplo PG 159 - PVI := u_t + a * u_x = b * u_xx em 0 <= x <= 10, 0 <= t <= 0.8
%                        u_0 (x) = tent function between -0.5 e 0.5
%

x_inicial  = -2;
x_final    = 10;
t_final    = 0.8;
a          = 10;
b          = 0.1;
mu         = 1;
hs         = [1/20 1/30];

function u = u_inicial(x)
    u = max(1 - abs(2*x), 0);
end

h = hs(1);
v = ftcs(@u_inicial, x_inicial, x_final, t_final, a, b, mu, h);

%h = hs(2);
%v = upwind(@u_inicial, x_inicial, x_final, t_final, a, b, mu, h);


fg = figure;
hold on;

x_m = x_inicial:h:x_final;
t_n = 0:(mu*h*h):t_final;


t = v(size(v)(1), :);

p = plot(x_m, t);
set(p, 'marker', 'o');
set(p, 'color', [1 .25 .5]);
set(p, 'markerSize', 5);

p = plot(x_m, u_inicial(x_m));
set(p, 'marker', '+');
set(p, 'color', [1 .25 .5]);


xlabel('x_m');
ylabel('t_n');
%zlabel('v_n_m');

%view(3);
%mesh(x_m, t_n, v);

fprintf('Program paused. Press enter to exit.\n');
pause;
