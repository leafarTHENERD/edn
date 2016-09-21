% Verifique os calculos das tabelas 2.1 e 2.2

% Tabela 2.1
% Resolução de EDO com metodo de Euler utilizando xk = hk e h=0.1
% 		| y' = y^2 + 2x -x^4
%       | y(0) = 0

h = 0.1;
x_inicial = 0;
y_inicial = 0;
x_final = 0.6;

xs = x_inicial:h:x_final;

function x = f1(x, y)
	x = y^2 + 2*x - (x^4);
end

yk = euler_h(@f1, y_inicial, x_inicial, x_final, h);

fprintf('Tabela 2.1\n');
for i = 2:size(xs)(2)
	fprintf('%f, %f, %f\n', xs(i), yk(i), xs(i)^2);
end


% Tabela 2.1
% Resolução de EDO com metodo de Euler (solução em x = 1)
% 		| y' = y
%       | y(0) = 1

function x = f2(x, y)
	x = y
end

hs = [1 .5 .25 .125 .0625];

x_inicial = 0;
y_inicial = 1;
x_objetivo = 1;
errors = [];

fprintf('Tabela 2.2\n');
for h = hs
	YK = euler_h(@f2, y_inicial, x_inicial, x_objetivo, h);
    y_objetivo = YK(size(YK)(2));
    erro = e^x_objetivo - y_objetivo;
    errors = [errors [erro]];
	fprintf('%f, %f, %f\n', h, y_objetivo, erro);
end


