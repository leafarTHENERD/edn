% function Y = euler_N(fun, y_inicial, t_inicial, t_final, N)
%
% Y = euler_N(fun, y_inicial, t_inicial, t_final, N)
%
% METODO DE EULER: resolve um EDO de primeira ordem
% com uma condicao inicial y(a) = y_inicial.
%
% DADOS:
%   fun       				 - funcao
%   y_inicial 				 - condicao inicial
%   [t_inicial, t_final]     - intervalo
%   N         				 - numero de passos

function Y = euler_N(fun, y_inicial, t_inicial, t_final, N)
	h = abs(t_inicial - t_final)/N;
	Y(1) = y_inicial;
	T = t_inicial:h:t_final;

	for k = 2:(N+1)
		phi = feval(fun, T(k-1), Y(k-1),0);
		Y(k) = Y(k-1) + h*phi;
	end
end