%% Autor: Salvador Sánchez-Pedreño, CN1V, curso 2022-23
%% Ejemplo 2.12.
%% Ilustración de la convergencia de los polinomios interpoladores del sen(x) en el intervalo [0,1]
clc
clear all

addpath('../Biblioteca');
n=5; %% puedes aumentar el número de puntos...
x=linspace(0,1,n); %% Puedes modificar el intervalo donde interpolar, aunmentándolo
y=sin(x);
format short;
[dif,coef]=dif_divNewton(x,y);
pause
a=polyinterpolador(coef,x);
polyout(a,'x')
pause
figure(1)
z=linspace(0,1,179);
pz=polyinterpolador_eval(coef,x,z);
plot(z,sin(z),';sen(x);',z,pz,'r;pol. interp.;')
hold on
plot(x,polyinterpolador_eval(coef,x,x),'*;;')
hold off
rmpath('../Biblioteca')
