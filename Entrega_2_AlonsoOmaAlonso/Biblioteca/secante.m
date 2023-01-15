%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de la secante para aproximar ceros de la función continua f 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - x0, x1: puntos iniciales para el método
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol
%% y que se sobrepase el número maxit de iteraciones, en cuyo caso enviará un error.

function [x,fx,npasos]= secante(f,x0,x1,tol,maxit,imprime)
  npasos=1;
  fmt='%5u\t %+17.17f\t %+17.17f\n';
  x=x1;
  fx=f(x);
  x_0=x0;
  fx_0=f(x_0);
  if imprime
    display("Iteración             x                f(x)")
  endif
  if (imprime==1) 
      printf(fmt,npasos,x,fx)
  endif
    while npasos <= maxit
      npasos = npasos +1;
      if( abs(fx-fx_0)<eps )
        disp('Secante: pendiente nula');
        return;
      end
      deltax=fx*(x-x_0)/(fx-fx_0);
      x_0=x;
      fx_0=fx;
      x=x-deltax;
      fx=f(x);
      if (imprime==1) 
         printf(fmt,npasos,x,fx)
      endif   
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(fx)<=tol) )       
        return;
      endif
     endwhile
     disp('Secante: No hay convergencia '); 
     return;     
end






