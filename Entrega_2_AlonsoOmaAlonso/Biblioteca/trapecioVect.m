%% Autor: Antonio Pallarés
%% Modificaciones de: Salvador Sánchez-Pedreño, CN1V, 21/22
%% Algoritmo para calcular una aproximacion de la integral mediante
%% la regla compuesta de trapecio
%%
%%  Entrada:    - x son las abscisas de la regla del trapecio: se espera que estén equiespaciadas. 
%%              - y es la imagen de la función en el vector de abscisas x             
%%                Los extremos de integración vienen dados por la primera y la última de las componentes de x
%%  Salida:     - int es el valor aproximado de la integral

function int = trapecioVect(x,y)
  h=x(2)-x(1);
  N=length(x)-1;
  int=y(1)+y(N+1);
  int = (h/2)*(int+2*sum(y(2:N))); 
endfunction