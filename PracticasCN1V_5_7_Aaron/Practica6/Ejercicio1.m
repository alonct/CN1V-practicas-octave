addpath('../Biblioteca')
clc
clear all
close all

disp("Apartado 1 c. Integral de Dirichlet")
printf("Valor real: %15.15e\n",pi/2)
function z = f(x) # función extendida de sen(x)/x, implementada con indexación booleana
 z=zeros(size(x));# para que Octave no de problemas por hacer broadcasting
 z(x!=0)=sin(x(x!=0))./x(x!=0);
 z(x==0)=1;
endfunction

function z = g(x)  # función x*sen(1/x),
 z=zeros(size(x));
 z(x!=0)=x(x!=0).*sin(1./x(x!=0));
 z(x==0)=0;
endfunction

fmt = "%5u,\t%15.15e,\t%15.15e\n";
disp("simpson")
disp('interv  valor                   errorabs')
for j=1:15
  int1=simpson(@f,0,pi,2^j);
  int2=-1/pi-2*simpson(@g,0,1/pi,2^j);  # Habría que hacer más divisiones en esta integral
                                        # porque no es ni C1 (es continua en 0, pero no derivable)
  int = int1 + int2;
  printf(fmt,2^j,int,abs(int-pi/2));
endfor
disp('')

disp("gaussLegendreBis")
disp('interv  valor                   errorabs')
for j=1:15
  int1=gaussLegendreBis(@f,0,pi,2^j,10); # 10 puntos de Gauss
  int2=-1/pi-2*gaussLegendreBis(@g,0,1/pi,2^j,10);
  int = int1 + int2;
  printf(fmt,2^j,int,abs(int-pi/2));
endfor

rmpath('../Biblioteca')
