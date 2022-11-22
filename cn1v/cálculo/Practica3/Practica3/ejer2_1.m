clc
clear all
close all
addpath('../Biblioteca')

N=[5,10,15];
f = @(x) 1./(1+ x.^2); %hace falta el punto de la división pq sino tengo un escalar dividido por un vector
x=linspace(-5, 5, 501);
plot(x, f(x))
hold on

figure(2)

for i=1:length(N)
  %calculamos los nodos
  nodos= linspace(-5,5, N(i)+1);
  valores = f(nodos);
  coef = interpolNewton(nodos, valores);
  poly_eval=polyinterpolador_eval(coef, nodos, x)
  figure(1)
  plot (x, poly_eval, sprintf(';Puntos: %u;', N(i) +1)) %sprintf para la leyenda, hacer que cambie con el valor de cada i
  hold on
  figure(2)
  plot (x, abs(poly_eval -f(x)), sprintf(';Puntos: %u;', N(i) +1)) %sprintf para la leyenda, hacer que cambie con el valor de cada i
  hold on

endfor

%cambiar N=[20,30,40]
%falta hacer el c)
rmpath('../Biblioteca')
