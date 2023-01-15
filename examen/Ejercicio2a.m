clear all
addpath('./Biblioteca')

fmt='%5u\t %+17.17f\t %+17.17f\n';

tol = 10^(-15);

npasosmax = 1000; %Un número grande.

printf("\nf1(x)\n")

f = @(x) cos(x);
x0 = 0;
[aproxAcel, ImAcel, npasosAitken, numEvalAitken] = puntofijoAitken(f, x0, tol, npasosmax, 0);

printf("\nAitken:\n")
printf(fmt, aproxAcel, ImAcel, npasosAitken)
numEvalAitken

[aproxFijo, fAprox, npasosFijo, numEvalFijo] = puntofijo(f, x0, tol, npasosmax, 0);

printf("\nPunto fijo:\n")
printf(fmt, aproxFijo, fAprox, npasosFijo)
numEvalFijo

printf("\nf2(x)\n")

g = @(x) (1/2).* (e.^(-x)-sin(x));

[aproxAcel, ImAcel, npasosAitken, numEvalAitken] = puntofijoAitken(g, x0, tol, npasosmax, 0);

printf("\nAitken:\n")
printf(fmt, aproxAcel, ImAcel, npasosAitken)
numEvalAitken

[aproxFijo, fAprox, npasosFijo, numEvalFijo] = puntofijo(g, x0, tol, npasosmax, 0);

printf("\nPunto fijo:\n")
printf(fmt, aproxFijo, fAprox, npasosFijo)
numEvalFijo

