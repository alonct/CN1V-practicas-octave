clc;
clear all;
close all
addpath('../Biblioteca')

p1=[1,0,0,-5.6,10,-32];
p2=[3,-12,-1,23,-1,0,32,0,-123,12,-1,15];
p3=[5,0,0,-0.5,2,0.8,2,-1,0,32,0,-13,2,-1,-1];

tolerancia=10^-13;
nmax=50;
intentos=50;

disp("Ejercicio 3. newtonPolyAleatorio")
display('Polinomio 1')
[raices1,nint1] = newtonPolyAleatorio(p1,tolerancia,nmax,intentos,0);

p1aprox = poly(raices1);
original=polyout(p1,'x')
aprox=polyout(p1aprox,'x')
printf('Máxima diferencia: %d\n',max(abs(p1-p1aprox)))


tol=10^(-10)/2; #Si ponemos tolerancia 10^-13, no hay convergencia de Newton en los intentos establecidos
disp('')
display('Polinomio 2')
[raices2,nint2] = newtonPolyAleatorio(p2,tol,nmax,intentos,0);

p2aprox = 3*poly(raices2);# Se multiplica por 3 porque el polinomio no es mónico
original=polyout(p2,'x')
if length(raices2)==length(p2)-1 #Para comprobar que el método de Newton haya encontrado todas las raices
  aprox=polyout(p2aprox,'x')
  printf('Máxima diferencia: %d\n',max(abs(p2-p2aprox))) #p2(1)=3
endif


disp('')
display('Polinomio 3')
[raices3,nint3] = newtonPolyAleatorio(p3,tol,nmax,intentos,0);

p3aprox = 5*poly(raices3);#Se podría poner también p3(1) ya que es =5
original=polyout(p3,'x')
if length(raices3)==length(p3)-1
  aprox=polyout(p3aprox,'x')
  printf('Máxima diferencia: %d\n',max(abs(p3-p3aprox)))
endif

rmpath('../Biblioteca');
