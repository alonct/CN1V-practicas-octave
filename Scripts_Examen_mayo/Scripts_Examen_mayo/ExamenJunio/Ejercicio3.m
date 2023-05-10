%%Autor: Salvador Sánchez-Pedreño
%% Script que aproxima una integral impropia, acotando la cola y utilizando Gauss-Legendre compuesto
%% con un número grande de subdivisiones.
%% Se compara el valor con el que porporciona <ocatve a través de la función "integral"
clear all
close all
clc

output_precision(16)

addpath('../Biblioteca');

g=@(x) sin(3*pi./(2*(1+x.^2)));
printf('Valor de la integral que proporciona Octave: %15.15e\n', integral(g,0,Inf))
%% Acotando la cola mediante sen(t)<=t se ob  tiene un arco tangente
%% Se integra entre b y infty, y se calcula b para que esta integral sea menor que 1E-5.
b=floor(tan(pi/2-2*1E-4/(3*pi)))+1


printf('Aproximamos la integral mediante el método de Gauss-Legendre con %6u intervalos\n',b)
I=gaussLegendre(g,0,b,b,10);
printf('Acotando la cola, se aproxima la integral entre 0 y %6u\n',b)
printf('El valor obtenido es %15.15e\n',I)

%simpson(g,0,b,2*b)
rmpath('../Biblioteca');