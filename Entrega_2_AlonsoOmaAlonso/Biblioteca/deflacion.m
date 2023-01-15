%%  Autor: Salvador Sánchez-Pedreño
%%  Calcula la deflación de un polinomio para un valor complejo (en general)
%%    es decir devuelve los coeficientes de p(x) dividido por (x-a) y el valor de p(a)
%%  Método de Horner o Ruffini
%%  Entrada:    
%%     - p, es el polinomio, vector de coeficientes con el grado decreciente
%%     - a, el valor donde se evalúa y deflaciona 
%%  Salida:  
%%     - poldef, son los coeficientes del polinomio deflacionado
%%     - val, el valor de p(z)


function [poldef,val]=deflacion(p,a) 
 n=length(p);
 poldef(1)=p(1); 
 for k=1:1:n-2
   poldef(k+1)=poldef(k)*a+p(k+1);
 endfor   
 val=poldef(n-1)*a+p(n);
endfunction  