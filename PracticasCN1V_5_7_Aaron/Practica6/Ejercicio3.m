addpath('../Biblioteca')
clc
clear all
close all

disp("Ejercicio 3. Puntos de corte")
f=@(x) e.^(-x/60);
df=@(x) (-1/60)*f(x);
g=@(x) cos(pi*x);
dg= @(x) -pi*sin(pi*x);

F=@(x) f(x) - g(x);
dF= @(x) df(x) - dg(x);

disp("Apartado 3a. Dibujar gráficas f,g")
y=linspace(1,10,500); # intervalo [1,10]
plot(y,f(y),';f(x);');
set(1,"position", [100, 206, 560, 420])
hold on
plot(y,g(y),';g(x);');

disp("Apartado 3b. Dibujar gráfica f-g")
figure(2)
plot(y,F(y),';f(x)-g(x);');
set(2,"position", [660, 206, 560, 420])
hold on
plot([0,10],[0,0],';x=0;')

disp("Apartado 3c. Puntos de corte")
# El razonamiento para coger los puntos iniciales es que para x grande, los ceros de F
# son como los ceros de cos(x), y como por el teorema de la convergencia global de Newton
# necesitamos, f*f''>0, entonces, buscamos los puntos de inflexión de cos(pi*x)
k1=3/2:2:100; #Puntos iniciales cogidos a la izquierda del primer cero de cada periodo
k2=5/2:2:101; #Puntos iniciales cogidos a la derecha del segundo cero de cada periodo
tol=10^-10;
max=50;
for k=1:length(k1)
  x1(k)=newton(F,dF,k1(k)+0.1,tol,max,0); # newton devuelve [x,fx,npasos], por omisión, sólo devuelve x
  x2(k)=newton(F,dF,k2(k)-0.1,tol,max,0);
endfor

y=linspace(1,101,1000);
figure(3)
plot(y,f(y),';f(x);',y,g(y),';g(x);')
set(3,"position", [1220, 206, 560, 420])
hold on
plot(x1,f(x1),'*;pto izq;',x2,f(x2),'*;pto der;')

rmpath('../Biblioteca')
