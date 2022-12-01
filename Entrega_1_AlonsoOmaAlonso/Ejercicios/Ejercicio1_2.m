addpath('../BibliotecaEntrega')

function ret = Lagrange(x, y)
    matriz = factLagrange(x);
    polinomio = interpolLagrange(matriz, y);
    ret = polinomio;
endfunction

n = 10;
a = 0;

x = linspace(0 + a, 2*pi + a, n);
y = sin(x);

interval = linspace(0 + a, 2*pi + a, 500);

figure(1)
title("Newton")
hold on
coef = interpolNewton(x, y);
evalNetown = polyinterpolador_eval(coef, x, interval);
plot(interval, evalNetown, ";newton(x);", x, y, '*', 'color', 'k')
plot(interval, sin(interval), ";sin(x);")
ylim([-1.2, 1.2]);
xlim([0 + a, 2*pi + a]);
hold off

figure(2)
title("Lagrange")
hold on
evalLagrange = polyval(Lagrange(x, y), interval);
plot(interval, evalLagrange, ";Lagrange(x);", x, y, '*', 'color', 'k')
plot(interval, sin(interval), ";sin(x);")
ylim([-1.2, 1.2]);
xlim([0 + a, 2*pi + a]);
hold off

figure(3)
title("Errores")
hold on
error_newton = abs(evalNetown - sin(interval));
plot(interval, error_newton, ";Error de Newton;")
error_Newton_max = max(error_newton)

errorLagrange = abs(evalLagrange - sin(interval));
plot(interval, errorLagrange, ";Error de Lagrange;")
error_Lagrange_max = max(errorLagrange)