addpath('../Biblioteca')
clc
clear all
close all
disp("Ejercicio 4. Distribución normal estándar ")

max=50;
tol=10^-10;
numi=10;
numG=10;
buscado=0.9757;
coef=1/sqrt(2*pi);
x0=0;
int0=1/2; #Valor de phi(0)
f = @(x) e.^((-x.^2)/2);
F= @(x) int0 + coef*gaussLegendreBis(f,x0,x,numi,numG)-buscado;
# Recordad que estamos buscando el x tq phi(x)=0.9757, así que para usar los métodos
# de búsqueda de ceros, nuestra función es F(x)=phi(x)-buscado
# No hay que calcular explícitamente la integral de f para escribirla dentro de una función,
# se puede dejar como se muestra arriba.
# Tampoco se debe calcular la integral desde -infinito a x, pues ya sabemos que desde -infinito hasta 0 vale 1/2
# (lo pone en el enunciado), así que basta calcularla de 0 a x


disp("Apartado 4a. Hallar x tq phi(x)=0.9757")
## Implimentación con otros métodos:
##dphi=@(x)  coef*exp(-x.^2/2);
##tic
##[app,fapp,n]=newton(F,dF,0,tol,50,1)
##toc
##tic
##[app,fapp,n]=secante(F,0,0.01,tol,50,1)
##toc

disp('Con bisección')
tic
[aprox,faprox,iter]=biseccion(F,0,2,tol,1) # El argumento 1 es para que imprima los pasos
toc
disp('')

disp('Con regulaFalsi')
tic
[aprox,faprox,iter]=regulaFalsi(F,0,2,tol,max,1)
toc
disp('')

disp("Apartado 4b. Cálculo eficiente de raíces")
#Programa similar al método de Newton
x=0;
tic
phi=int0+coef*simpson(f,x0,x,10);
for j=1:50
  printf('Iteración: %5u,\tAprox: %16.16e\n',j-1,x)
  delta=(phi-buscado)/(coef*f(x)); #Equivale a F/F' del método de Newton. En este caso phi'=coef*f por TFC
  x1=x-delta;                      #Siguiente punto del método de Newton
  if (abs(phi-buscado)<tol)
    printf("Iteraciones: %5u\tAproximación obtenida: %15.15e\n",j,x)
    break
  endif
  phi=phi+coef*simpson(f,x,x1,10);
  x=x1;
endfor
toc

#Gráfica de la función iterativa
x=0:0.01:5;
int(1)=1/2;
for i=2:length(x)
  int(i)=int(i-1)+coef*simpson(f,x(i-1),x(i),10);
endfor
plot(x,int)

rmpath('../Biblioteca')
