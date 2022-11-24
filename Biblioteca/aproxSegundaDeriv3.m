%% Autor: Antonio Pallarés 
%% Modificaciones de: Salvador Sánchez-Pedreño 2021-22
%% Cálculo aproximado de la derivada con tres puntos
%% Entradas: 
%%  - función f,  la función que se quiere derivar
%%  - h, el paso
%%  - x, el punto donde aproximamos la derivada
%% Salida: devuelve el valor de la derivada segunda aproximada
%% Funciona si x es un vector de abscisas

function retrn=aproxSegundaDeriv3(f,x,h)
  
retrn=(f(x-h)-2*f(x)+f(x+h))/h^2;
  
endfunction  
