%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Newton para aproximar ceros de la función continua f 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - df, función derivada de f
%%    - x0, punto inicial para el método
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%%     - val, vector de abscisas calculdas en cada iteración hasta la parada
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol
%% y que se sobrepase el número maxit de iteraciones, en cuyo caso enviará un error.


function [x,fx,npasos,valores]= newtonTabla(f, df,x0,tol, maxit)
  npasos=1;
  x=x0;
  valores(1)=x0;
  fx=f(x);
  dfx=df(x);
    while npasos <= maxit
      npasos = npasos +1;
      if( abs(dfx)<10*eps )
        disp('Newton: derivada nula');
        return;
      end
      deltax=fx/dfx;
      x=x-deltax;
      valores(npasos)=x;
      fx=f(x);
      dfx=df(x);                 
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(fx)<=tol) )      
        return;
      endif
     endwhile
     disp('No hay convergencia de newton');       
     return;
end






