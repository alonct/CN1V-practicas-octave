%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de la secante para aproximar ceros de la función continua f 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - df, función derivada de f
%%    - x0, x1, puntos iniciales para el método
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%%     - val, vector de abscisas calculdas en cada iteración hasta la parada, comenzando por x1
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol
%% y que se sobrepase el número maxit de iteraciones, en cuyo caso enviará un error.

function [x,fx,npasos,valores]= secanteTabla(f,x0,x1,tol,maxit)
  npasos=1;
  x=x1;
  fx=f(x);
  x_0=x0;
  fx_0=f(x_0);
  valores(1)=x1;
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
      valores(npasos)=x;
      fx=f(x); 
      if isnan(f(x)) error('f=Inf') endif 
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(fx)<=tol) )       
        return;
      endif
     endwhile
     disp('Secante:: No hay convergencia ');  
     return     
end






