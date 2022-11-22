%Autores: S. Sánchez-Pedreño
%% primer ejemplo de cálculo con Octave
clc
clear
format short

display("¿Qué valor deberíamos obtener para log(1/exp(a))?")

pause
a=128
b=log(1/exp(a));
fprintf("log(1/exp(a)) = %d \n",b)
pause

a=640
b=log(1/exp(a));
fprintf("log(1/exp(a)) = %d \n",b)
pause

a=710
b=log(1/exp(a));
fprintf("log(1/exp(a)) = %d \n",b)
pause


format long

fprintf("\n 2/3 = ")
2/3
fprintf("\n 2/3-0.666 666 6667 = ")
2/3-0.6666666667

pause
fprintf("\n 2/3-0.666 666 666 666 666 = ")
2/3-0.666666666666666

pause
display("\nQuince 'seises'")
0.666666666666666==0.6666666666666667;
fprintf("\n¿Es 0.666666666666666==0.6666666666666667? Respuesta: %d\n ", ans)

pause
display("\nDieciséis 'seises'")
0.6666666666666666==0.66666666666666667;
fprintf("\n¿Es 0.6666666666666666==0.66666666666666667? Respuesta: %d\n ", ans)

pause
a=(1+1e19)-1e19;
fprintf("\n(1+10^19)-10^19 = \%d\n",a)

pause
fprintf("\n18817-10864*sqrt(3) = ")
18817-10864*sqrt(3)


pause
fprintf("\n1/(18817+10864*sqrt(3)) = ")
1/(18817+10864*sqrt(3))
