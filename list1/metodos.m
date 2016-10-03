function yk1 = euler(f, tk, yk, h)
% EULER returna uma aproximação de y_(k+1) a partir de y_k utilizando o metodo
% de Euler pra aproximação numerica de EDO's de primeira ordem.
%
%   yk1 = EULER(f, tk, yk, h) computa a função f avaliada em tk e yk.
%   Essa função deve funcionar seja lá qual for a natureza do elemento yk ou tk.

    yk1 = yk + h * feval(f, tk, yk);
end