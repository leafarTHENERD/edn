% 2.2.10
fg = figure;
hold on;

function r = f1(x, y)
    ALPHA = 0.25;
    BETA  = -0.01;
    r = ALPHA*x + BETA*x*y;
end

function r = f2(x, y)
    GAMA  = -1.00;
    DELTA = 0.01;    
    r = GAMA*y + DELTA*x*y;
end

function [r1 r2] = f(t, v)
    x = v(1);
    y = v(2);
    ALPHA = 0.25;
    BETA  = -0.01;
    GAMA  = -1.00;
    DELTA = 0.01;
%    r1 = f1(v(1), v(2));
%    r2 = f2(v(1), v(2));
    r1 = ALPHA*x + BETA*x*y;
    r2 = GAMA*y + DELTA*x*y;
end

hs = [.25 .5];

t_inicial = 0;
x_inicial = 80;
y_inicial = 30;
v_inicial = [x_inicial y_inicial];
N = 100;

for h = hs
    fprintf('(h = %f)\n', h);
    t_final = t_inicial + h*N;
    vk = euler_h(@f, v_inicial, t_inicial, t_final, h);

    vk
    x = vk(: ,1)';
    y = vk(: ,2)';

    p1 = plot(x, y);
    set(p1, 'marker', 'o');
    set(p1, 'color', [(h/2)*1 (h/4) (h/8)]);
    set(p1, 'markerSize', 5);
end

%f = plot(xk, e.^(-xk));
%set(f, 'color', [0 1 0]);

leg = strcat(['h = '; 'h = '], [num2str(hs')]) ;
%legend(leg);
xlabel('x');
ylabel('y');

fprintf('Program paused. Press enter to exit.\n');
pause;