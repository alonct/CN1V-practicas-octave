addpath('../Biblioteca')
clc
clear all
close all

display ("Apartado 1 a. AproxDerivadaTabla")

valor_real_derivada = cos(1.2)
cociente =@(h) (sin(1.2+h)-sin(1.2))./h;
error_abs = @(h) abs(cociente(h)-valor_real_derivada);
error_teor = @(h) (h/2)*sin(1.21);

form = '%5.5e,\t %16.15e,\t %12.12e,\t %12.12e\n';
disp('h                cociente                errorabs                errorteorico')
k=1:20;
h=10.^(-k);
eval=cociente(h);
ea=error_abs(h);
#para valores muy pequeños del paso h el método comienza a mostrar una gran inestabilidad,
#debido a los errores de redondeo. Para h<=10^-8, el error absoluto se mantiene por debajo
#del teórico, a partir de ahí empieza a degenerar... En concreto para 10^-16, sen(x+h)=sen(x)
#debido a que el epsilón de máquina es 2.2204e-16
et=error_teor(h);
for j=1:20
  printf(form, h(j), eval(j), ea(j), et(j));
endfor

display ("Apartado 1 b. loglog")
loglog(h,ea,'*- ;Error absoluto;'); #gráfico con escala logarítmica
set(1,"position", [100, 206, 560, 420])
hold on
loglog(h,et,';Error teorico;');
hold on

display ("Apartado 1 c. ErrorTotalOptimo")
loglog([sqrt(sin(1.21)*eps),sqrt(sin(1.21)*eps)],[10^-20,10^-1], 'k ;h;');
# sí se aproxima a la zona de menor error (absoluto)
# asimismo, coincide con "se aconseja coger h netemente mayor que eps^(1/q+1) para O(h^q)"
# en este caso, sqrt(2.2204e-16)=1.4901e-08.
# Si tuvieramos más bits (digitos en mantisa), nos saldría un h menor

display ("Apartado 1 d. AproxDerivadaGrafica")
figure(2)
aprox=@(x,h) (sin(x+h)-sin(x))/h;
x=linspace(0,pi, 1000);
for k=1:2:15
  h=10^(-k);
  plot(x,aprox(x,h),sprintf(';h = %2.2e;',h))#h=1 mala aprox
  set(2,"position", [660, 206, 560, 420])
  hold on
endfor
plot(x,cos(x),';cos(x);')
# las líneas horizontales que aparecen en h=10^-15 se deben a que por el epsilon de máquina
# se tiene que sen(x+h)=sen(x) => sen(x+h)-sen(x)=0

rmpath('../Biblioteca')
