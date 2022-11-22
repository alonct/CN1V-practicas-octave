%%Autor: S.Sánchez-Pedreño, septiembre 2021
%% Ejemplo de iteración con propagación super exponencial
%% Véase el ejercicio 1.30 de las notas 2022-2023
clc
clear all
format long g
y=e-1
for n=1:25
  y=n*y-1;
  fprintf('y(%d)=%e\n',n,y);
endfor
