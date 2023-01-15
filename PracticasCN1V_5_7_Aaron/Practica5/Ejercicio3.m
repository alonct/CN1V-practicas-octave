addpath('../Biblioteca')
clc
clear all
close all

display ("Apartado 3 a. TrapecioCorregido Tabla")
f=@(x) 3./(1+x.^2);
a=0;
b=sqrt(3);

k=1:13;
n=2.^(k-1);

for j=1:length(k)
  trap(j)=trapecio(f,a,b,n(j));
  error(1,j)=abs(pi-trap(j));
  trapcor(j)=trapecioCorr(f,a,b,n(j),0, -3*sqrt(3)/8);
  error(2,j)=abs(pi-trapcor(j));
endfor
form = '%5u,\t %16.15e,\t %12.12e,\t %12.12e,\t %12.12e\n';
disp('n        trap                    errortrap               trapcorr                errortrapcorr')
for j=1:length(k)
  printf(form, n(j), trap(j), error(1,j),trapcor(j), error(2,j));
endfor

disp('Tabla cocientes')
for j=1:(length(k)-1)
  trap_coc(j)=error(1,j)/error(1,j+1);
  trapcor_coc(j)=error(2,j)/error(2,j+1);
endfor
form = '%5u,\t %12.12f,\t %12.12f\n';
disp('n        c1                      c2               ')
for j=1:length(k)-1
  printf(form, n(j), trap_coc(j), trapcor_coc(j));
endfor
# Aquí, la tabla de cocientes indica que los errores del trapecio se dividen por 4
# aproximadamente, y en el del TrapecioCorregido por 16, que es consecuente con el
# orden de precisión de ambos métodos
disp('')


display ("Apartado 3 b. Simpson y Gauss-Legendre")
f=@(x) 3./(1+x.^2);
a=0;
b=sqrt(3);

n=2.^(k-1);
for j=2:length(k)
  simp(j)=simpson(f,a,b,n(j));
  error(1,j)=abs(pi-simp(j));
  gauss(j)=gaussLegendre(f,a,b,n(j),3);
  error(2,j)=abs(pi-gauss(j));
endfor
form = '%5u,\t %16.15e,\t %12.12e,\t %12.12e,\t %12.12e\n';
disp('n        simp                    errorsimp               gauss                   errorgauss')
for j=1:length(k)
  printf(form, n(j), simp(j), error(1,j),gauss(j), error(2,j));
endfor

disp('Tabla cocientes')
for j=1:(length(k)-1)
  simp_coc(j)=error(1,j)/error(1,j+1);
  gauss_coc(j)=error(2,j)/error(2,j+1);
endfor
form = '%5u,\t %12.12f,\t %12.12f\n';
disp('n        c1                      c2               ')
for j=1:length(k)-1
  printf(form, n(j), simp_coc(j), gauss_coc(j));
endfor
# Aquí, la tabla de cocientes indica que los errores de Simpson se dividen por 16
# aproximadamente, que tiene sentido, pues tiene el mismo orden que trapecioCorregido,
# pero en el método de Gauss no nos dice nada
disp('')


display ("Apartado 3 c. Trapecio=TrapecioCorregido")
f=@(x) (sin(x)).^2;
a=0;
b=2*pi;

k=1:13;
n=2.^(k-1);

for j=1:length(k)
  trap(j)=trapecio(f,a,b,n(j));
  error(1,j)=abs(pi-trap(j));
  trapcor(j)=trapecioCorr(f,a,b,n(j),0, 0);
  error(2,j)=abs(pi-trapcor(j));
endfor
form = '%5u,\t %16.15e,\t %12.12e,\t %12.12e,\t %12.12e\n';
disp('n        trap                    errortrap               trapcorr                errortrapcorr')
for j=1:length(k)
  printf(form, n(j), trap(j), error(1,j),trapcor(j), error(2,j));
endfor
# Por ser sen(x) periódica, y estar en un intervalo periódico (también valdría con un múltiplo del periodo),
# f'(a)=f'(b), entonces el TrapecioCorregido coincide con el Trapecio normal, por lo que en este intervalo,
# el Trapecio adquiere una mayor precisión (la precisión del TrapecioCorregido). Para profundizar en este
# tema, recurrir al apéndice del tema 3.

disp('Tabla cocientes')
for j=1:length(k)-1
  trap_coc(j)=error(1,j)/error(1,j+1);
  trapcor_coc(j)=error(2,j)/error(2,j+1);
endfor
form = '%5u,\t %12.12f,\t %12.12f\n';
disp('n        c1                      c2               ')
for j=1:length(k)-1
  printf(form, n(j), trap_coc(j), trapcor_coc(j));
endfor
# Aquí, la tabla no dice mucho porque al ser tan precisos los métodos, los errores no se aprecian (con los bits de esta máquina)
# así que los considera cero, y al hacer los cocientes hace cosas del tipo 0/0...
rmpath('../Biblioteca')
