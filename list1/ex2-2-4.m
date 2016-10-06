% 2.2.4 - Aplique o metodo de Heun para o PVI :
%        | y' = -y,  0<=x<=1
%        | y(0) = 1

fg = figure;
hold on;

function x = f(t, y)
    x = -y;
end

hs = [.25 .125 .0625];

x_inicial = 0;
y_inicial = 1;
x_final = 1;

for h = hs
    xk = x_inicial:h:x_final;
    yk = heun_h(@f, y_inicial, x_inicial, x_final, h);
    N = size(yk)(2);

    fprintf('(h = %f)\n', h);
    for i = 2:N
        fprintf('%f, %f, %f\n', xk(i), yk(i), e^(-xk(i)) - yk(i));
    end

    p1 = plot(xk, yk);
    set(p1, 'color', [h*4 0 0]);
    set(p1, 'markerSize', 10);
end

f = plot(xk, e.^(-xk));
set(f, 'color', [0 1 0]);

leg = strcat(['h = '; 'h = '; 'h = '; 'e to -x'], [num2str(hs'); ' ']) ;
legend(leg);
xlabel('x');
ylabel('y');
title("Problema PVI por Heun: \n dy/dx = -y, 0<=x<=1 \n y(0) = 1");

fprintf('Program paused. Press enter to exit.\n');
pause;