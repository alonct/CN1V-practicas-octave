%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Iteraciones de punto fijo de una función f: x(n+1)=f(x(n))
%% Entradas:
%%    - f, la función
%%    - x0, punto inicial de la iteración
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - nmax, número máximo de iteraciones del método
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximación al punto fijo
%%     - fval, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%% La condicion de parada es que  abs(f(x)-x) < tol
%%   o que se sobrepase el número nmax de iteraciones, en cuyo caso enviará un error.

function [x,fval,npasos, numEval] = puntofijo (f,x0,tol,nmax,imprime)
  npasos=1;
  fmt='%5u\t %+17.17f\t %+17.17f\n';
  x=x0;
  fval=f(x);
  npasos=1;
  numEval = 1;
  while(npasos <= nmax)
    if (imprime==1)
      printf(fmt,npasos,x,fval)
    endif
    if (abs(x-fval)<= tol)
      return
    end
    x=fval;
    fval=f(x);
    npasos=npasos+1;
    numEval += 1;
  end
error('No hay convergencia de punto fijo');
endfunction
