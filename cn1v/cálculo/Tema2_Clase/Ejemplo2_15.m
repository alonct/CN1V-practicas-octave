%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2022-23
%% Ejemplo 2.15
%% Cálculo de la tabla de diferencias divididas y  el polinomio interpolador de Hermite 
%% en un ejemplo concreto.
clc
clear all

addpath('../Biblioteca');

x=[1,2];
y={[2,3],[6,7,8]};
format short;
[dif,coef]=dif_divHermite(x,y);
disp('Tabla de diferencias divididas')
disp(dif)
disp('')
disp('Coeficientes del polinomio de Hermite')
disp(coef)
pause
[coef,abscisas]=interpolHermite(x,y);
disp('')
disp('Nodos repetidos')
disp(abscisas)


pause
disp('')
disp('Polinomio interpolador:')
a=polyinterpolador(coef,abscisas)
polyout(a,'x')
rmpath('../Biblioteca')
