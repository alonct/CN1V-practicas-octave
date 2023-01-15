%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Muller para aproximar ceros de la función continua f 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - x0, x1, x2, puntos iniciales para el método
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


function [x,fx,npasos]= muller(f,x0,x1,x2,tol,maxit,imprime) 
  npasos=0;
  x=x2;
  fx=f(x);
  x_1=x1;
  fx_1=f(x_1);
  x_0=x0;
  fx_0=f(x_0);
  h=1+tol;
%  fmt='%5u\t %+17.17e\t %+17.17e\n';
  fmt='%5u\t %+17.17e \t\t\t %+17.17e\n';
  fmtc='%5u\t %+17.17e%+17.17ei \t %+17.17e%+17.17ei\n';  
   fmts='%3u\t %-45s \t\t %-45s\n';
  if imprime
    display("Iteración             x                                              f(x)")
  endif 
##  if abs(fx_0)<tol
##    x=x_0;
##    fx=fx_0;
##    return;
##  end
##  if abs(fx_1)<tol
##    x=x_1;
##    fx=fx_1;
##    return;
##  end
  f01=(fx_0-fx_1)/(x_0-x_1);
  while npasos <= maxit
##      if (imprime==1) 
##        if  iscomplex(x)
##          printf(fmtc,npasos,real(x), imag(x),real(fx),imag(fx))
##        else
         printf(fmts,npasos,num2str(x,'%+17.17e'),num2str(fx,'%+17.17e'))
##        endif       
 %      disp([npasos,x,fx);
 %     endif     
      if and(abs(fx)<tol,abs(h)<tol*(1+abs(x)))
        return;
      end
      npasos = npasos +1;
      f02 = (fx_0-fx)/(x_0-x); 
      f12 = (fx_1- fx)/(x_1-x);
      f012 = (f01-f12)/(x_0-x);
      W = f12 + f02 -f01;
      if and(abs(W)<10*eps, abs(f012)<10*eps )
        error('Muller: polinomio próximo a constante');
      end
      aux =sqrt(W*W-4*fx*f012);
      denomin1 = W + aux; 
      denomin2 = W-aux;
      if abs(denomin1)>abs(denomin2)
        h =-2*fx/denomin1;
      else
        h =-2*fx/denomin2;
      end
      x_0 = x_1; 
      fx_0 = fx_1; 
      x_1 = x; 
      fx_1 = fx; 
      f01 = f12;
      x = x + h; 
      fx = f(x); 
  end
  error('Muller: No hay convergencia ');       
end






