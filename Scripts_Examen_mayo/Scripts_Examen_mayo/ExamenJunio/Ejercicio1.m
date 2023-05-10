%% Autor: Salvador Sánchez-Pedreño
%% Ejercicio 1, examen práctico CN1V, Junio 2022
%% Ejemplo de aplicación del método de newton con aproximación de la derivada en cinco puntos
%% Comparación con el método de Newtoon estándar, en una función con ceros simples y en otra con un cero doble.

clear all
close all
clc

output_precision(16)

addpath('../Biblioteca');

g=@(x) x.^2.*exp(x)-cos(x);
dg=@(x) x.*exp(x).*(2+x)+sin(x);

z=linspace(-5,1,500);
figure(1)
plot(z,g(z),[-5,1],[0,0])
hold on
plot(z,cos(z))
hold on

display('Función x^2exp(x)-cox(x)')
h=0.001;
x0=[1,-pi/2,-3*pi/2];
sol1=zeros(3);
iter1=zeros(3);
for k=1:3   
 [sol1(k),f,iter1(k)]=newtonAprox5p(g,x0(k),h,1E-14,100,0); 
 sol1(k)
 display('')
endfor 
sol2=zeros(3);
iter2=zeros(3);
for k=1:3  
 [sol2(k),f,iter2(k)]=newton(g,dg,x0(k),1E-14,100,0); 
 display('')
endfor 
fmt='Iteraciones: %3u\t\t  Aproximación: %15.15e\n';
for k=1:3
printf(fmt,iter1(k),sol1(k))
printf(fmt,iter2(k),sol2(k))
endfor
plot(sol1,g(sol1),'*')

%% Segunda función
q=@(x) 1-x.*exp(1-x);
dq=@(x) exp(1-x).*(x-1);

display('')
display('Función 1-xexp(1-x)')
x0=3;
[sol1,f,iter1]=newtonAprox5p(q,x0,h,1E-12,100,0); 
[sol2,f,iter2]=newton(q,dq,x0,1E-12,100,0); 
printf(fmt,iter1,sol1)
printf(fmt,iter2,sol2)





rmpath('../Biblioteca');