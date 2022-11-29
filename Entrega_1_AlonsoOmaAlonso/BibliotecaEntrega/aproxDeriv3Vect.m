%% Autor: Antonio Pallarés 
%% Modificaciones de: Salvador Sánchez-Pedreño 2021-22
%% Cálculo aproximado de la derivada con tres puntos 
%% a partir de un vector de abscisas equiespaciadas
%% Entradas: 
%%  - x, vector de abscisas
%%  - y, vector de ordenadas, valores de la función en las abscisas x
%%  Salida: devuelve el vector de las derivadas aproximadas en tres puntos, en las abscisas primera y última
%%    se aproxima lateralmente, en las demás con las diferencias centrales. 

function dfX = aproxDeriv3Vect(x, y)

if length(x)<=2
  error('Hay menos de 3 puntos, no se puede aproximar con la regla de 3 puntos');
endif

h=x(2)-x(1);
n=length(x);

dfx1=(-3*y(1)+4*y(2)-y(3))/(2*h);
dfxn=(y(n-2)-4*y(n-1)+3*y(n))/(2*h);
i=2:n-1;
dfxi=(y(i+1)-y(i-1))/(2*h);
dfX=[dfx1,dfxi,dfxn];

endfunction
