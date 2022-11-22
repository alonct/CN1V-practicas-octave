%%Autor: S.Sánchez-Pedreño, septiembre 2021
%% Ejemplo de cancelación substractiva o error de cancelación
%% Requiere la función redondeo.m de la carpeta Biblioteca
clc
clear all
addpath('../Biblioteca')
ndig=5
format long e

display('Constantes y=5/7, x=0.714251, z=0.111111e-4')
y=5/7
x=0.714251
z=0.111111e-4

pause
display('Redondeamos a 5 dígitos en mantisa:')
fy=redondeo(y,ndig)
fx=redondeo(x,ndig)
fz=redondeo(z,ndig)

pause
display('La diferencia:')
fdif=fy-fx;
fprintf('fy-fx = %d',fdif)
dif=y-x;
fprintf('\nValor real: y-x = %d\n',dif)

pause
display('Errores:')
fprintf('Error absoluto = %d',abs(fdif-dif))
fprintf('\nError relativo: = %d\n',abs(fdif-dif)/dif)

pause
display('División por z:')
fcoc=fdif/z;
fprintf('(fy-fx)/z = %d',fcoc)
coc=dif/z;
fprintf('\nValor real: (y-x)/z = %d\n',coc)

pause
display('Errores:')
fprintf('Error absoluto = %d',abs(fcoc-coc))
fprintf('\nError relativo: = %d\n',abs(fcoc-coc)/coc)

rmpath('../Biblioteca')
