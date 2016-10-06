
% 2.2.2 - Aplique o metodo de Euler para o PVI :
%         y' = -y 0 <= x <= 1
%         y(0) = 1
hs = [.25 .125 .0625];

function x = f(t, y)
    x = -y;
end

t_inicial = 0;
t_final = 1;
y_inicial = 1;

fg = figure;
hold on;

for h = hs
    fprintf('Result (h = %f)\n', h);
    tk = t_inicial:h:t_final;
    yk = euler_h(@f, y_inicial, t_inicial, t_final, h);

    p1 = plot(tk, yk);
    set(p1, 'color', [h*4 0 0]);
    set(p1, 'markerSize', 10);

    fprintf('\n');
end

f = plot(tk, e.^(-tk));
set(f, 'color', [0 1 0]);

leg = strcat(['h = '; 'h = '; 'h = '; 'e to -x'], [num2str(hs'); ' ']) ;
legend(leg);
xlabel('x');
ylabel('y');
title("Problema PVI por Euler: \n dy/dx = -y, 0<=x<=1 \n y(0) = 1");

fprintf('Program paused. Press enter to exit.\n');
pause;

hold off;
fg = figure;

