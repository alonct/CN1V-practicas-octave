%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño
%% Método de Newton para aproximar ceros de un polinomio, tanto real como complejo
%% Entradas:
%%    - p, el polinomio
%%    - x0, punto inicial para el método
%%    - tol, tolerancia, estimación del error para detener la iteración
%%    - maxit, número máximo de iteraciones del método
%%    - imprime, si toma el valor 1 se imprime una tabla de los valores itermedios
%% Salidas:
%%     - x, aproximación a una raíz
%%     - pz, el valor de p(x)
%%     - npasos, número de iteraciones realizadas
%% Los criterios de parada utilizados son:
%% la diferencia entre dos iteraciones sucesivas es menor que tol en cierto sentido relativo y a la vez abs(pz)<tol
%% y que se sobrepase el número maxit de iteraciones, en cuyo caso enviará un error.

function [x,pz,npasos]= newtonPoly(p,x0,tol,maxit,imprime)
  npasos=1;
  x=x0;
  fmts='%3u\t %-40s \t %-40s \t %-40s\n';
  n=length(p);    
  if (imprime) 
    disp('Iteración          Aproximación                                       Valor pol.                                       Valor der.')
  endif
  while npasos <= maxit
      pz=p(1);
      dpz=pz;
      for k=1:1:n-2
        pz=pz*x+p(k+1);
        dpz=dpz*x+pz; ##valor de la derivada de p en x
      endfor 
      pz=pz*x+p(n); ##valor de p en x
      if (imprime==1) 
        printf(fmts,npasos,num2str(x,'%+17.17e'),num2str(pz,'%+17.17e'),num2str(dpz,'%+17.17e'))
      endif 
      if( abs(dpz)<2*eps )
      disp('Newton: derivada nula')
        error('Newton: derivada casi nula');
      end
      deltax=pz/dpz;                     
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(pz)<=tol) )      
        return;
      endif
      x=x-deltax;  
      npasos = npasos +1; 
   endwhile
     disp('No hay convergencia de Newton')
     error('No hay convergencia de Newton');  
end






