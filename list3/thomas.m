% function x = thomas(a, b, c, d, N)
%
% x = thomas(a, b, c, d)
%
% ALGORITMO DE THOMAS: resolve um sistema tridiagonal
%   
% DADOS:
%   a              - diagonal abaixo da diagonal principal
%   b              - diagonal principal
%   c              - diagonal acima da diagonal principal
%   d              - coeficientes independentes
%   N              - tamanho da matrix do sistema tridiagonal
%   
% O algoritmo abaixo é uma implementação das instruções propostas no artigo sobre o algoritmo na Wikipedia
% (https://en.wikipedia.org/wiki/Tridiagonal_matrix_algorithm)
% Adaptação da implementãção sugerida pois os vetores são indexados começando de 1 no Octave

function x = thomas(a, b, c, d, N)

    c_prime(1) = c(1)/b(1);
    for i=2:N-1
        c_prime(i) = c(i)/(b(1) - a(i-1)*c_prime(i-1));
    end

    d_prime(1) = d(1)/b(1);
    for i=2:N
        d_prime(i) = (d(i) - a(i-1)*d_prime(i-1)) / (b(i) - a(i-1)*c_prime(i-1));
    end

    x(N) = d_prime(N);
    for i=N-1:-1:1
        x(i) = d_prime(i) - c_prime(i)*x(i+1);
    end
end