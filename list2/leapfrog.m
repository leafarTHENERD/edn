% function v = leapfrog(u_inicial, x_inicial, x_final, t_final, lambda, h)
%
% v = leapfrog(u_inicial, x_inicial, x_final, t_final, lambda, h)
%
% ESQUEMA LEAPFROG: resolve um PVC 
%   u_t + a * u_x = 0 com u0(x) = u_inicial
%
% DADOS:
%   u_inicial                - funcao em t = 0
%   x_inicial                - inicio intervalo do espaço
%   x_final                  - fim intervalo do espaço
%   t_final                  - tempo máximo onde se desejar computar
%   a                        - constante do PVC
%   lambda                   - parametro de espaçamento da malha
%   h                        - parametro de espaçamento da malha
%  

function v = leapfrog(u_inicial, x_inicial, x_final, t_final, a, lambda, h)
    x_m = x_inicial:h:x_final;

    M_final = size(x_m)(2);
    M_inicial = 2;
    t_now = 1;
    k = lambda * h;

    % dados iniciais
    for m = 1:M_final
        v(t_now, m) = feval(@u_inicial, x_m(m));
    end

    % dados iniciais utilizando ftcs para obter o segundo nivel de computação requerido pelo leapfrog
    t_new = t_now + 1;
    for m = M_inicial:M_final-1
        v(t_new, m) = v(t_now, m) - (1/2)*(a * lambda) * (v(t_now, m+1) - v(t_now, m-1));
    end
    v(t_new, M_final) = v(t_new, M_final-1);
    t_now = t_new;
    %M_inicial = M_inicial + 1;

    for t = k:k:t_final-k
        t_new = t_now + 1;
        for m = M_inicial:M_final-1
            v(t_new, m) = v(t_now - 1, m) - (a * lambda)*(v(t_now, m+1) - v(t_now, m-1));
        end
        M_inicial = M_inicial + 1;
        v(t_new, M_final) = v(t_new, M_final-1);
        t_now = t_new;
    end
end