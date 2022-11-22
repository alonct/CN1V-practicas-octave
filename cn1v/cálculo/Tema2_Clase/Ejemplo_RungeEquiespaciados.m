%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2022-23
%% Cálculo de dos polinomios interpoladores con nodos equiespaciados, para la función de Runge en [-5,5]
clc
clear all

addpath('../Biblioteca');
f=@(x) 1./(1+x.^2);
n1=30;
n2=40; 
x1=linspace(-5,5,n1)
x2=linspace(-5,5,n2);
y1=f(x1);
y2=f(x2);
coef1=interpolNewton(x1,y1)
coef2=interpolNewton(x2,y2);

figure(1)
hold on;
z=linspace(-5,5,179);
pz1=polyinterpolador_eval(coef1,x1,z);
pz2=polyinterpolador_eval(coef2,x2,z);
plot(z,f(z),'b;Runge;',z,pz1,'r;interp. 15;',z,pz2,'g;interp. 19;')
title('Interpolación en nodos equiespaciados');
ylim([-10,10])
hold off
rmpath('../Biblioteca')
