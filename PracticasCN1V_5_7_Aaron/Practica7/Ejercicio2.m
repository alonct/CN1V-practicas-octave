clc;
clear all;
close all
addpath('../Biblioteca')

output_precision(16)

f=@(x) x.^5 -5.6*x.^2 +10*x -32;
p=[1,0,0,-5.6,10,-32];
disp('Ejercicio 2')
disp('Apartado a. Radio del disco')
radio = 1+max(abs(p))/abs(p(1)) #Fórmula vista en teoría

disp('')
disp('Apartado b. newtonPoly')
tolerancia=10^-12;
nmax=50;
[raiz(1),val1,n1]=newtonPoly(p,radio+1/2,tolerancia,nmax,0)   # Nos quedamos con la primera variable que devuelve
#[raiz(2),val2,n2]=newtonPoly(p,-radio-1/2,tolerancia,nmax,0)
# Como es la misma raíz para distintas condiciones iniciales, llegamos a la
# conclusión de que solo hay una raíz real.

disp('')
disp('Apartados c y e. Deflación')
p2=deflacion(p,raiz(1));
# Se puede calcular el radio del polinomio deflacionado
[raiz(2),val2,n2]=newtonPoly(p2,0.5+1.5i,tolerancia,nmax,0);
raiz(2) = newtonPoly(p,raiz(2),tolerancia,nmax,0);
raiz(3) = conj(raiz(2));
p3=deflacion(p2,raiz(2));
p4=deflacion(p3,raiz(3));
raiz(4) = newtonPoly(p4,-1.6+1.6*i,tolerancia,nmax,0);
raiz(4) = newtonPoly(p,raiz(4),tolerancia,nmax,0); #Calculamos la raíz sobre el p original para evitar posible errores de redondeo
raiz(5) = conj(raiz(4))

disp('')
disp('Apartado f. Reconstruir polinomio')
papp = poly(raiz);
polyout(papp,'x')

disp('')
disp('Apartado d. Condiciones iniciales')
# Para coger las raíces complejas, primero vamos a probar a boleo.
#[raiz(2),val2,n2]=newtonPoly(p,i,tolerancia,nmax,0)

x=linspace(-3,3,200);
y=linspace(-3,3,200)';     # Traspuesto
z=abs(polyval(p,x+i*y));
plot3(x,y,z);      # Función valor abs de p(z)
set(1,"position", [100, 206, 560, 420]);

figure(2)
contour(x,y,z,0:1:15) # Curvas h(z=1)..h(z=15), sin la f (contourf) se ve mejor.
set(2,"position", [660, 206, 560, 420]);

# A partir de la gráfica, ponemos valores aproximados.
[raiz(2),val2,n2]=newtonPoly(p,0.5+1.5*i,tolerancia,nmax,0);
[raiz(3),val3,n3]=newtonPoly(p,0.5-1.3*i,tolerancia,nmax,0);  # Conjugada

[raiz(4),val4,n4]=newtonPoly(p,-1.6+1.5*i,tolerancia,nmax,0);
[raiz(5),val5,n5]=newtonPoly(p,-1.6-1.5*i,tolerancia,nmax,0);   # Conjugada
raiz
# Si no encuentra las raíces, podemos aumentar la tolerancia o el número de iteraciones.

rmpath('../Biblioteca');
