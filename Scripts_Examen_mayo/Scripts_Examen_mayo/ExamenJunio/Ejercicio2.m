%%Autor: Salvador Sánchez-Pedreño
%% Script que aproxima la función periodo del péndulo de longitud 1 sin rozamiento 
%% y aproxima el valor del ángulo inicial para el que el periodo es 1.5*T0, siendo T0 el periodo del péndulo linealizado
%% Se utilizan el método de la secante.
%% El código de estes método se pega aquí y se modifica, la dificultad es que, tal y como están definidos los métodos de aproximación de integrales,
%% no se pueden utilizar con una integral dependiente de parámetros (o integrar una función de dos variables, fijando una de ellas) 
clear all
close all
clc

output_precision(16)

addpath('../Biblioteca');

g=9.807;

H=@(z,a) 1./sqrt(1-((sin(a/2)).^2.*(sin(z)).^2));


function [x,fx,npasos]=misecante(x0,x1,tol,maxit)
  H=@(z,a) 1./sqrt(1-((sin(a/2)).^2.*(sin(z)).^2));
  npasos=1;
  imprime=1;
  fmt='%5u\t %+17.17f\t %+17.17f\n';
  x=x1;
  f=@(z) H(z,x);
  fx=2*gaussLegendre(f,0,pi/2,50,10)/pi-1.5;
  x_0=x0;
  f=@(z) H(z,x_0);
  fx_0=2*gaussLegendre(f,0,pi/2,50,10)/pi-1.5;
  
  if (imprime==1) 
      printf(fmt,npasos,x,fx)
  endif
    while npasos <= maxit
      npasos = npasos +1;
      if( abs(fx-fx_0)<eps )
        disp('Secante: pendiente nula');
        return;
      end
      deltax=fx*(x-x_0)/(fx-fx_0);
      x_0=x;
      fx_0=fx;
      x=x-deltax;
      f=@(z) H(z,x);
      fx=2*gaussLegendre(f,0,pi/2,50,10)/pi-1.5;
      if (imprime==1) 
         printf(fmt,npasos,x,fx)
      endif   
      if and((abs(deltax)<=tol*(1+abs(x))),(abs(fx)<=tol) )       
      return;
      endif
     endwhile
     disp('Secante: No hay convergencia '); 
endfunction



z=linspace(0,3,200);
figure(1)
for k=1:length(z)
  f=@(x) H(x,z(k));
  C(k)=2*gaussLegendre(f,0,pi/2,50,10)/pi;
endfor 
plot(z,C,[0,pi],[1.5,1.5])
hold on
pause(3)

x0=3;
x1=2.5;
[x,fx,n]=misecante(x0,x1,1E-14,20)
printf('solucion: %15.15e\n',x)
plot(x,fx+1.5,'*')
display('')
display('Método de la secante')
printf('La aproximación obtenida en %3u pasos es: %15.15e *pi\n',n,x/pi)
display('')



rmpath('../Biblioteca');
