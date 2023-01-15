addpath('../Biblioteca')
clc
clear all
close all

display ("Apartado 2. aproxDeriv3Vect y aproxIntegrales")

f= @(x) x.*cos(x.^2);
x=linspace(0,10,1001); # espacio (10-0)/1000(subintervalos) = 1/100
y=f(x);
plot(x,y,';f(x);')
set(1,"position", [100, 206, 560, 420])
hold on
deriv=aproxDeriv3Vect(x,y);
#la amplitud aumenta porque la derivada tiene un x^2...
plot(x,deriv,';df(x) aprox;')

figure(2)
disp ('Tiempo trapecio:')
tic
for k=1:length(x)
  trap(k)=trapecio(f,0,x(k),200);
#Esta estrategia es mala porque calculamos en cada paso, toda la integral, en lugar de
#aprovechar la propiedad aditiva de la integral para calcular la integral de ese hueco
#más la integral calculada en el paso anterior
endfor
toc
plot(x,trap,'b ;Trapecio;')
set(2,"position", [660, 560, 560, 420])
hold on
# se puede observar un ligero decremento de la amplitud con este método, cosa que no
# deberia suceder al calcular la integral. Podemos calcularla de una forma más inteligente.

disp ('Tiempo trapecio inteligente:')
trapint(1)=0;
tic
for k=2:length(x)
  trapint(k)=trapint(k-1)+trapecio(f,x(k-1),x(k),2);
endfor
toc
plot(x,trapint,'r ;TrapecioInteligente;')


figure(3)
simp(1)=0;
disp ('Tiempo Simpson:')
tic
for k=2:length(x)
  simp(k)=simp(k-1)+simpson(f,x(k-1),x(k),2);
endfor
toc
plot(x,simp,'y ;Simpson;')
set(3,"position", [1220, 206, 560, 420])

figure(4)

gauss(1)=0;
disp ('Tiempo GaussLegendre:')
tic
for k=2:length(x)
  gauss(k)=gauss(k-1)+gaussLegendre(f,x(k-1),x(k),2,2);
endfor
toc
plot(x,gauss, 'g ;GaussLegendre;')
set(4,"position", [660, 40, 560, 420])

#Si queréis profundizar más sobre cuadratura, investigad el paquete QuadPack

rmpath('../Biblioteca')
