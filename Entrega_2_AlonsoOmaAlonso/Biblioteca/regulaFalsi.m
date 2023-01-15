%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método regula falsi para aproximar ceros de la función continua f 
%% supuesto  sign(f(a))*sign(f(b)) < 1 
%% Entradas:
%%    - f, función (se escribe "f" entre comillas si la funcion es externa, cuando es interna se escribe f sin comillas)
%%    - a, b extremos del intervalo donde f cambia de signose escribe "f" entre comillas 
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones toleradas
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximacion a una solucion
%%     - fx, el valor de f(x)
%%     - npasos, número de iteraciones realizadas
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez fx<tol


function [x,fx,npasos]= regulaFalsi (f, a,b,tol,maxit,imprime)
  global precision;
  npasos=1;
  if imprime
    display(" Paso               a                        b                        f(a)                        f(b)")
  endif  
  fmt='%5u\t %+17.17f\t %+17.17f\t %+17.17e\t %+17.17e\n';
  aa=a;
  c=aa;
  fa=f(aa);
  bb=b;
  fb=f(bb);
  fc=10*tol;
  x=a;
  fx=fa;
    if sign(fa)*sign(fb) > -1
      error(' Biseccion: f no cambia de signo en a,b ');
    endif
    if (imprime==1) 
      printf(fmt,npasos,aa,bb,fa,fb)
    endif
    while or((abs(bb-aa)>=tol*(1+abs(aa))),(abs(fc)>=tol) )      
      if npasos>=maxit
         x=c;
         fx=fc;
        return
      endif
      npasos = npasos +1;      
      c=aa-fa*(bb-aa)/(fb-fa); %cambio
      fc=f(c);
        if sign(fa)*sign(fc) < 1
          bb=c;
          fb=fc;
        else
          aa=c;
          fa=fc;
        endif  
     if (imprime==1) 
      printf(fmt,npasos,aa,bb,fa,fb)
     endif      
     endwhile
     x=c;
     fx=fc;       
end






