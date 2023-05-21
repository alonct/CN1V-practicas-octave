clear all
addpath('./Biblioteca')
output_precision(16)
fmt='%5u\t %+17.17f\t %+17.17f\n';

maxit = 50;
imprime = 1;
tol = 10^(-12);

f = @(x) (20.*x - 1)./(19.*x);

x0 = 0.01;
x1 = 1;

[x, fx, npasos] = zeroshybrid(f, x0, x1, tol, maxit, imprime);
[x,fx,npasos]= secante(f,x0,x1,tol,maxit,imprime)

%% En este caso podemos observar que directamente el método de la secante normal directamente no converge, pues llega un caso en el que
%% la pendientes es tan pequeña (menor que eps cuando para) que el ordenador empieza a cometer errores de redondeo pues no tiene precisión suficiente para
%% realizar los calculos. Con el nuevo método nos ahorramos estos problemas.

f = @(x) x.^2 - (x-1).^(20) + 1/2;

x0 = 0;
x1 = 1;

[x, fx, npasos] = zeroshybrid(f, x0, x1, tol, maxit, imprime);
[x,fx,npasos]= secante(f,x0,x1,tol,maxit,imprime);
[x,fx,npasos]= biseccion(f,x0,x1,tol,imprime);

%% Este caso es más sorprendente si cabe. El método de la bisección necesita de 41 pasos mientras que el método de la secante ni siquiera converge.
%% Por su parte el método mixto consigue llegar a la aproximación en solo 10 pasos.

f = @(x) e.^(-4.*x) - 1/10;

x0 = 0;
x1 = 5;

[x, fx, npasos] = zeroshybrid(f, x0, x1, tol, maxit, imprime);
[x,fx,npasos]= secante(f,x0,x1,tol,maxit,imprime);
[x,fx,npasos]= regulaFalsi (f, x0, x1,tol,200,imprime)

%% Nuevamente, el método de la secante no es capaz de converger numéricamente al ser la pendiente de f por la derecha de la raíz tan pequeña de manera
%% constante y estar tan pegada al eje de abcisas. Después de la primera iteración, los siguientes dos puntos están tan pegados y la diferencia de sus
%% imagenes por f tan pequeña que el siguiente punto de la iteración es tan negativo que el ordenador no puede computar su imagen por f y directamente
%% le asigna el valor +inf. Por otro lado el método regula falsi sí converge pero de manera muy lenta por estar tan pegada la función al cero a la
%% derecha de la raíz, necesitando de casi 100 pasos. Por su parte el método híbrido aprovecha la bisección (método que ya de por si sería mucho más
%% rápidp que cualquiera de los otros dos ya mencionados) para situarse en un intervalo lo suficientemente pequeño donde el método de la secante puede
%% actuar sin problemas, alcanzando así la aproximación en solo 18 pasos.
