% Exemplo PG 159 - PVI := u_t + a * u_x = b * u_xx em 0 <= x <= 10, 0 <= t <= 0.8
%                        u_0 (x) = tent function between -0.5 e 0.5
%

x_inicial  = 0;
x_final    = 4;
t_final    = 0.8;
a          = 10;
b		   = 0.1;
mu		   = 1;
hs         = [1/20 1/30];

function u = u_inicial(x)
    if x >= 0 && x <= 0.5,
        u = 1 - 2*x;
    elseif x < 0 && x >= -0.5
    	u = 1 + 2*x;
%	if(abs(x) <= .5)
%		u = sin(pi*x);
    else
    	u = 0;
    end
end

%h = hs(3);
%v = ftcs(@u_inicial, x_inicial, x_final, t_final, a, b, mu, h);

h = hs(1);
v = upwind(@u_inicial, x_inicial, x_final, t_final, a, b, mu, h);


x_m = x_inicial:h:x_final;
t_n = 0:(mu*h*h):t_final;

fg = figure;
hold on;

xlabel('x_m');
ylabel('t_n');
zlabel('v_n_m');

view(3);
mesh(x_m, t_n, v);

fprintf('Program paused. Press enter to exit.\n');
pause;
