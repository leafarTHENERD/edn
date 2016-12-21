% function v = ftcs(u_inicial, x_inicial, x_final, t_final, a, b, mu, h)
%
% v = ftcs(u_inicial, x_inicial, x_final, t_final, lambda, h)
%
% ESQUEMA FORWARD-TIME CENTRAL-SPACE: resolve um PVI 
%   u_t + a * u_x = bu_xx com u0(x) = u_inicial
%
% DADOS:
%   u_inicial                - funcao em t = 0
%   x_inicial                - inicio intervalo do espaço
%   x_final                  - fim intervalo do espaço
%   t_final                  - tempo máximo onde se desejar computar
%   a                        - constante do PVI
%   b                        - constante do PVI
%   mu                       - parametro de espaçamento da malha
%   h                        - parametro de espaçamento da malha
%  

function v = ftcs(u_inicial, x_inicial, x_final, t_final, a, b, mu, h)
    k = mu * h * h;
    alph = (h*a)/(2*b);
    x_m = x_inicial:h:x_final;
    t_n = 0:k:t_final;

    M_inicial = 2;
    M_final = size(x_m)(2);
    N_inicial = 1;
    N_final = size(t_n)(2);
    
    v = zeros(N_final, M_final);

    % dados iniciais em t = 0
    for m = 1:M_final
        v(1, m) = feval(@u_inicial, x_m(m));
    end

    N_inicial = N_inicial + 1;
    for n = N_inicial:N_final
        for m = 2:M_final-1
            v(n, m) = (1 - 2*b*mu) * v(n-1, m) + b*mu*(1-alph) * v(n-1, m + 1) + b*mu*(1 + alph)*v(n-1, m-1);
        end
    end
end