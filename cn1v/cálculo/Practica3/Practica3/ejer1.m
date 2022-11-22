clc
clear all
close all
addpath('../Biblioteca')

nodos = [1.5,2.7,3.1,-2.1,-6.6,11.0]
valores = [0.0,1.0,-0.5,1.0,0.5,0.0]

coef_pol =interpolNewton(nodos,valores);
%dif_divNewton(nodos, valores)
x=linspace(min(nodos), max(nodos),200);
plot(x, polyinterpolador_eval(coef_pol, nodos, x), nodos, valores, "*")
set(1, "position", [ %los valores que me hayan salido
%cell
% y={[1,2],[0,1,1],[3],[1,1]}
%for i=1:length(y)
%z(i)=y{i}(1)
%endfor

nodos2 = [0,1,2,3];
valores2 = {[1,2], [0,1,1,], [3], [1,1]};

[a,b]=interpolHermite(nodos2, valores2) %b=nodos repetidos
x=linspace(0,3,200);
%solo va a rescuperar la primera de las cosas, pero como queremos que recupere ambas [a,d]
%interpolhermite devuelve un vector con dos componentes
%queremos que me devuelva un vector con dos componentes tmbn
figure(2)

for i=1:length(valores2)
  ord(i)= valores2{i}(1)
endfor

plot(x, polyinterpolador_eval(a,b, x), nodos2, ord, "*")
set (2, "position", [136,211,560,418]
%para que no se pongan dos ventanas una encima de otra: get(2,"position"), para el tamaño de la ventanas
%las 2 primeras son las coordenadas de la esquina superior izq
%las otras dos son el ancho y el alto de la pantalla
rmpath('../Biblioteca')
