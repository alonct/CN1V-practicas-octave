addpath('../Biblioteca')
clc
clear all
close all

disp("Ejercicio 5. Muller")
disp('Con x0=2; x1=1.5; x2=1;')
f = @(x) x.^6-x-1;
x0=2;
x1=1.5;
x2=1;
max=50;
tol=10^-10;
disp('npasos   x                                                       f(x)')
[aprox,faprox,iter]=muller(f,x0,x1,x2,tol,max,0)

disp('')
disp('Con x0=2; x1=1.7; x2=1.5;')
x0=2;
x1=1.7;
x2=1.5;
disp('npasos   x                                                       f(x)')
[aprox,faprox,iter]=muller(f,x0,x1,x2,tol,max,0)
#Efectivamente, aquí los cálculos se realizan en el campo complejo

#Extra con datos iniciales complejos
disp('')
disp('Con x0=2*i, x1=-0.5+2i y x2=-0.5+0.5i')
tic
[aprox,faprox,iter]=muller(f,2*i,-0.5+2*i,-0.5+0.5*i,tol,20,1)
# Para imprimirlo formateado habría que escribir:
# printf('\nAproximación encontrada: %s en %s iteraciones, valor de f(x)=%s.\n',num2str(aprox,"%15.15e"), num2str(iter,"%3u"),num2str(faprox,"%15.15e"))

#Para comprobar que son raices, basta hacer evaluar el polinomio y ver que dan cero:
# Se puede hacer lo mismo para los 2 casos anteriores
pol=[1,0,0,0,0,-1,-1];
da_cero=polyval(pol,aprox)

rmpath('../Biblioteca')
