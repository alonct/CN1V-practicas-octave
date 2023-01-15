clear all
addpath('./Biblioteca')

fmt='%5u\t %+17.17f\t %+17.17f\n';

f = @(x) ((3.*x.^4) + (42.*x.^2) - 49)./(8.*x.^3);
%df = @(x) (3/8) - (21./(4.*x.^2) + (147 ./(8.*x.^4)));
df = @(x) ((8.*x.^3 .* (12.*x.^3 + 84.*x)) - (24.*x.^2 .* (3.*x.^4 + 42.*x.^2 -49)))./((8.*x.^3).^2);

x0 = [2,8];

tol = (1/2) * 10^(-15);
npasosmax = 1000;

for i=1:length(x0)

  printf("*************************************")
  printf(sprintf("\nx0 = %u\n", x0(i)))

  printf("-------------------------------------")

  [aproxAcel, ImAcel, npasosAitken, numEvalAitken] = puntofijoAitken(f, x0(i), tol, npasosmax, 0);

    printf("\nAitken:\n")
    printf(fmt, aproxAcel, ImAcel, npasosAitken)
    numEvalAitken

  [aproxFijo, fAprox, npasosFijo, numEvalFijo] = puntofijo(f, x0(i), tol, npasosmax, 0);

    printf("\nPunto fijo:\n")
    printf(fmt, aproxFijo, fAprox, npasosFijo)
    numEvalFijo

    printf("\n\n")
  [aproxNewton, faproxNewton, npasosNewton] = newton(f, df, x0(i), tol, npasosmax, 0)
    printf("\nNewton:\n")


  endfor
