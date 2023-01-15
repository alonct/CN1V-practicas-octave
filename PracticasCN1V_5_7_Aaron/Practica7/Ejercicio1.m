addpath('../Biblioteca')
clc;
clear all;
close all

output_precision(16)

f=@(x) x.^3+x-1000;
fa=@(x) -x.^3+1000;
fb=@(x) (1000-x)./(x.^2);
fc=@(x) (1000-x).^(1/3);

disp('Ejercicio 1. Punto fijo')
disp('Representaciones')
y = linspace(9,10,500);

figure(1)
plot(y,fa(y),y,y,';x=y;');
#ylim([9,10])
set(1,"position", [100, 206, 560, 420]);
hold on

figure(2)
plot(y,fb(y),y,y,';x=y;');
#ylim([9,10])
set(2,"position", [660, 206, 560, 420]);
hold on

figure(3)
plot(y,fc(y),y,y,';x=y;');
#ylim([9,10])
set(3,"position", [1220, 206, 560, 420]);
hold on
# A simple vista se puede observar que la opción fc convergerá más rápido
# por ejemplo probar con la calculadora a poner "9" "=" expresión sustituyendo
# xn por "ANS". Visualmente se ve que en el caso fa y fb son repulsores y
# fc es un atractor.
# Otra forma de hacerlo es derivar y dibujar la función de la derivada.
# Entonces se puede ver que |f|>1 en a y b => a y b son repulsores
# NOTA: para comentar ctrl+R, para descomentar ctrl+shift+R

##dfa=@(x) -3*x.^2;
##dfb=@(x) ((-x.^2)-((1000-x).*(2*x)))./(x.^4);
##dfc=@(x) -(1./(3*(1000-x).^(2/3)));
##figure(4)
##plot(y,abs(dfa(y)));
##hold on
##
##figure(5)
##plot(y,abs(dfb(y)));
##hold on
##
##figure(6)
##plot(y,abs(dfc(y)));
##hold on
##set(4,"position", [100, 206, 560, 420]);
##set(5,"position", [660, 206, 560, 420]);
##set(6,"position", [1220, 206, 560, 420]);


# Empezamos con el 9 porque es uno de los números más lejanos del intervalo.
disp('Iteraciones')
tolerancia=10^(-14);
x0=9;     # Con x0=10, tardará todavía menos.
[aprox,faprox,npasos]=puntofijo(fc,x0,tolerancia,50,1)
# Se han necesitado 7 iteraciiones

rmpath('../Biblioteca');
