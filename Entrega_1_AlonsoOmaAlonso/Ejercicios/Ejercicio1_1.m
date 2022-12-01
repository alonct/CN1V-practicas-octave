addpath('../BibliotecaEntrega')

%% Esta fución la he definido para ahorrar líneas de código.
function ret = Lagrange(x, y)
    matriz = factLagrange(x);
    polinomio = interpolLagrange(matriz, y);
    ret = polinomio;
endfunction

x_1 = [0, 1, 2, 5];
y_1 = x_1 .* 2;

x_2 = [0, 1, 2, 3];
y_2 = x_2 .^ 3;

pol_1 = Lagrange(x_1, y_1);
pol_2 = Lagrange(x_2, y_2);

intervalo = linspace(0, 5, 500);

polyout(pol_1, 'x')
figure(1)
plot(intervalo, polyval(pol_1, intervalo), x_1, y_1, '*', 'color', 'k')
title("y = 2*x")

polyout(pol_2, 'x')
figure(2)
plot(intervalo, polyval(pol_2, intervalo), x_2, y_2, '*', 'color', 'k')
title("y = x^3")