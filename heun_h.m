% function Y = heun_h(fun, y_inicial, t_inicial, t_final, h = 0.01)
%
% Y = euler(fun, y_inicial, t_inicial, t_final, h)
%
% METODO DE HEUN: resolve um EDO com uma condicao inicial y(a) = y_inicial.
%
% DADOS:
%   fun       				 - funcao
%   y_inicial 				 - condicao inicial
%   [t_inicial, t_final]     - intervalo
%   h         				 - tamanho do passo
%             				   Default h = 0.01

function Y = heun_h(fun, y_inicial, t_inicial, t_final, h = 0.01)
	Y(1) = y_inicial;
	T = t_inicial:h:t_final;
	N = size(T)(2);

	for k = 2:N
		ft_1y_1 = feval(fun, T(k-1), Y(k-1));
		phi = 0.5 * ( ft_1y_1 + feval(fun, T(k), Y(k-1) + h * ft_1y_1) );
		Y(k) = Y(k-1) + h*phi;
	end
end