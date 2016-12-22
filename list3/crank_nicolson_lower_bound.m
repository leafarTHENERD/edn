% function v = crank_nicolson_lower_bound(u_inicial, u_x_inicial, x_inicial, x_final, t_final, a, lambda, h)
%
% v = crank_nicolson_lower_bound(u_inicial, u_x_inicial, x_inicial, x_final, t_final, a, lambda, h)
%
% ESQUEMA CRANK-NICOLSON: resolve um PVC 
%   u_t + a * u_x = 0 , 0 <= t <= t_final, x_inicial <= x <= x_final
%   com u0(x)         = u_inicial
%   com uxinicial(t)  = u_x_inicial
%
% DADOS:
%   u_inicial                - funcao em t = 0
%   u_x_inicial              - funcao em x = x_inicial
%   x_inicial                - inicio intervalo do espaço
%   x_final                  - fim intervalo do espaço
%   t_final                  - tempo máximo onde se desejar computar
%   a                        - constante do PVC
%   lambda                   - parametro de espaçamento da malha
%   h                        - parametro de espaçamento da malha
%  

function v = crank_nicolson_lower_bound(u_inicial, u_x_inicial, x_inicial, x_final, t_final, a, lambda, h)
    k = lambda * h;
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

    % dados de contorno
    for n = 1:N_final
        v(n, 1) = feval(@u_x_inicial, t_n(n));
    end

    alph = (a*lambda)/4;
    %tridiagonal_N = M_final-2; % sem condições de contorno (sem as duas condições)
    tridiagonal_N = M_final-1; % sem condições de contorno (condição de contorno implicita)

    aa = -alph*ones(1, tridiagonal_N - 1);
    bb = ones(1, tridiagonal_N);
    cc = alph*ones(1, tridiagonal_N - 1);
    dd = zeros(1, tridiagonal_N);

    % condições numericas de contorno
    aa(tridiagonal_N-1) = -lambda;
    bb(tridiagonal_N) = (1 + lambda);

    N_inicial = N_inicial + 1;
    for n = N_inicial:N_final 
        for i=1:tridiagonal_N-1
            m = i+1;
            dd(i) = v(n-1, m) - alph*(v(n-1, m+1) - v(n-1, m-1));
            if i == 1
                dd(i) = dd(i) + alph*v(n, 1);
            %elseif i == tridiagonal_N-1
            %    dd(i) = dd(i) - alph*v(n, M_final);
            end
        end
        dd(tridiagonal_N) = v(n, M_final);

        xx = thomas(aa, bb, cc, dd, tridiagonal_N);
        %v(n, M_final) = v(n-1, M_final-1);
        %v(n, :) = [v(n, 1) xx v(n, M_final)];
        v(n, :) = [v(n, 1) xx];
    end
end