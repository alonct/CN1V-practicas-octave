%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño, CN1V, 21/22, 22/23
%% Algoritmo para calcular una aproximacion de la integral mediante
%% la regla compuesta de trapecio
%
%  Entrada:    - f es la funcion que queremos integrar
%              - a y b son los extremos de integracion.             
%              - N es el numero de subintervalos en que se divide [a,b]. 
%  Salida:     - int es el valor aproximado de la integral

function int = trapecio(f,a,b,N)
  x=linspace(a,b,N+1);
  y=feval(f,x);
  int=y(1)+y(N+1);
  int = (b-a)/(2*N)*(int+2*sum(y(2:N))); 
endfunction
