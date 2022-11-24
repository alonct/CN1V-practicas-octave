%%  Autor: Salvador Sánchez-Pedreño 2021-22
%%  Calcula la aproximación a una integral con la regla de Gauss
%%  Entrada:    
%%     - f es la funcion a integrar, introducida como una cadena de caracteres, o como una función interna.
%%     - a y b son los extremos del intervalo de integración.
%%     - N es el número de subdivisiones del intervalo [a,b] para la regla compuesta
%%     - nG es el número de puntos de Gauss que se utilizarán en cada subintervalo de la división
%%  La función llama a gaussLegendreSimple.m, por lo que nG desbe ser uno de los valores admitidos por ésta
%%  Salida:  int es el valor de la integral aproximada.
%              


function int=gaussLegendre(f,a,b,N,nG)
  
h=(b-a)/N;
int=0;
for k=1:N
ak=a+(k-1)*h;
fk=@(x) f(ak+(1+x)*h/2);
int=int+gaussLegendreSimple(fk,nG);
endfor         
int=int*h/2;  
endfunction

