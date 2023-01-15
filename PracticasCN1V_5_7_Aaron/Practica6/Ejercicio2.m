addpath('../Biblioteca')
clc
clear all
close all

disp("Ejercicio 2. Aproximar integral")
output_precision (16);

f=@(x) sin(3*pi./(2*(1+x.^2)));

disp('')
real=integral(f,0,Inf)  # Con este comando, Octave aproxima la integral con los métodos más adecuados

tol=10^-5;              # Esta tolerancia nos da cinco cifras significativas

disp('')
# Haciendo la acotación de la cola con sen(x)<= x, y viendo cuando esta integral es menor que tolerancia, hallamos k
# que será el extremo dderecho del intervalo en el que aproximaremos la integral y también el número de intervalos en los que aproximaremos la integral
k=floor(tan(pi/2-(2*tol)/(3*pi)))+1;
printf('Intervalo donde aproximamos: [0,%u6]\n',k)

disp("simpson")
tic
int1=simpson(f,0,k,2*k) #Doble de puntos
toc
printf('errorAbs: %15.15e\n',abs(int1-real))
disp('')

disp("gaussLegendreBis")
tic
# Muchísimo más rápido usando la nueva función gaussLegendreBis que gaussLegendre (porque se trabaja de forma vectorial)
int2=gaussLegendreBis(f,0,k,k,10)
toc
printf('errorAbs: %15.15e\n',abs(int2-real))

rmpath('../Biblioteca')
