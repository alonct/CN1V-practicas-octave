%% Autor: Antonio Pallarés 
%% Modificaciones de: Salvador Sánchez-Pedreño 2021-22
%% Cálculo aproximado de la derivada con tres puntos
%% Entradas: 
%%  - función f, que puede ser interna, definida con @(x), o externa (?), la función que se quiere derivar
%%  - h, el paso
%%  - x, el punto donde aproximamos la derivada
%%  - pos, es una cadena que indica el punto donde se aproxima la derivada
%%     * si pos=i, x es el punto más a izquierda de tres, e.d. x, x+h,x+2h
%%     * si pos=d, x es el punto a derecha, x-2h,x-h,x
%%     * en cualqueir otro caso se aproxima con las diferencias centrales, x-h,x,x+h
%% Salida: devuelve el valor de la derivada aproximada
%% Funciona si x es un vector de abscisas

function retrn=aproxDeriv3(f,x,h,pos)
  
  switch (pos)
   case 'i'
     retrn=(-3*f(x)+4*f(x+h)-f(x+2*h))/(2*h);
   case 'd'
     retrn=(f(x-2*h)-4*f(x-h)+3*f(x))/(2*h);
   otherwise
     retrn=(f(x+h)-f(x-h))/(2*h);
  endswitch
  
endfunction  
