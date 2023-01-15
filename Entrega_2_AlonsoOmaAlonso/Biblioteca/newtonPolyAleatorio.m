%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Newton para aproximar los ceros de un polinomio mediante el método de  Newton, 
%%  eligiendo puntos al azar dentro del disco (de Cauchy) que contiene a todos los ceros.
%% Utiliza el método de Horner para evaluar simultáneamente el valor de p(x) y de p'(x)
%% Entradas:
%%    - p, el polinomio
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método de Newton (para cada punto inicial)
%%    - intentos, es el número máximo de puntos aleatorios que se podrán elegir antes de encontrar una aproximación a todas las raíces
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios en el método de Newton
%% Salidas:
%%     - raices, el vector de aproximaciones a las raíces encontrado
%%     - nintent, el número de elecciones aleatorias de condición inicial
%% Si se supera el número máximo de intentos devuelve las raíces encontradas que serán menos de las necesarias


function [raices,nintent]= newtonPolyAleatorio(p,tol,maxit,intentos,imprime)
  nintent=0;
  NR=0;  
  n=length(p)-1;
  prec=tol^(1/3);
  pd=p;
  radio=max(abs(pd))/abs(pd(1))
  while (NR<n)
    nintent=nintent+1;
    printf('Número de intentos: %4u\n',nintent)
    try      
      ang=rand();
      z0=radio*rand()*(cos(2*pi*ang)+i*sin(2*pi*ang));
      printf('Pto incial: %16.16e\t %16.16e\n',real(z0), imag(z0))
      [raicesd(NR+1),app,nump]=newtonPoly(pd,z0,prec,maxit,imprime);
      [raices(NR+1),app,nump]=newtonPoly(p,raicesd(NR+1),tol,maxit,imprime);
      [pd,val]=deflacion(pd,raicesd(NR+1));
      radio=max(abs(pd))/abs(pd(1));
      NR=NR+1
    catch
      disp(['Error desde el método de Newton: ',lasterror.message])
    end_try_catch
    if (nintent>=intentos)
      disp('Se ha sobrepasado el número máximo de intentos')      
      return;
    endif
  endwhile
endfunction






