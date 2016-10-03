% Avaliação do problema de valor inicial dado pelo sistema no ponto tk = 1:
%   | y' = y
%   | y(0) = 1

function x = f(t, y)
    x = y;
end

hs = [1 .5 .25 .125 .0625 .0625/2 .0625/4 .0625/8];

t_inicial = 0;
y_inicial = 1;
t_objetivo = 1;

for h = hs
    tk = t_inicial:h:t_objetivo;
    N = size(tk)(2);
    yk = euler_h(@f, y_inicial, t_inicial, t_objetivo, h);
    fprintf('Result (h = %f) => y(%f) = %f \n', h, t_objetivo, yk(N));
end

