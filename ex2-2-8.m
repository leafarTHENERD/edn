% Aplique o metodo de Euler e de Heun para o PVI:
%		| y'(x) = x^2 + [y(x)]^2, x >= 0
%		| y(0) = 1
%  e compute y_2 para h = 0.1


h = 0.1;
x_inicial = 0;
y_inicial = 1;
k_objetivo = 2;
x_objetivo = x_inicial + h * k_objetivo;

function x = f(x, y)
	x = x^2 + y^2;
end

yk_euler = euler_h(@f, y_inicial, x_inicial, x_objetivo, h);
yk_heun = heun_h(@f, y_inicial, x_inicial, x_objetivo, h);

fprintf('%f, %f, %f\n', x_objetivo, yk_euler(size(yk_euler)(2)), yk_heun(size(yk_heun)(2)));