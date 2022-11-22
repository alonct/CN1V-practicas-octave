%Autores: A. Pallarés
%Modificaciones de: S. Sánchez-Pedreño
%Numeros enteros
clc;    % Para limpiar la Ventana de comandos, TERMINAL.
clear;  % para borrar los datos en memoria
% usamos las funciones de octave-matlab:
%       display para mandar mensajes a la consola
%
%       fprintf para mandar mensajes a la consola con variables y formato
%           admite variables numéricas (%d, %e, %g)
%           admite variables que son cadenas de caracteres-string- (%s,..)
%
%
cast(130,"uint8")
display('Octave admite dos tipos de enteros: con signo (int) y sin signo (uint)')
display('Los tipos de enteros que puede manejar son: 8, 16, 32, 64 bits, tanto con signo como sin signo')
pause
display('Ejemplo: el mayor entero de octave-matlab con signo')

pause
display('mayor entero int8')
max=intmax('int8')
display('Cambiar 8 por 16, 32 o 64')

pause
display('si hacemos (max +1) o (max + 10) no da error de overflow sino ...')
pause
fprintf('\n max + 1 = %d \n', (max+1))

pause
fprintf('\n menor entero int8 \n')
min=intmin('int8')

pause
display('si hacemos (min - 1) o (min -10) no da error de overflow sino ...')
fprintf('\n min - 1 = %d \n', min - 1)

pause
fprintf('\n mayor (unsigned) entero uint8 \n')   %%Cambiar 8 por 16, 32 o 64
max=intmax('uint8')

pause
fprintf('si hacemos (max +1) o (max + 10) no da error de overflow sino ...')
fprintf('\n max + 1 = %d \n', max+1)

pause
fprintf('\n menor (unsigned) entero uint8 \n')
min=intmin('uint8')

pause
fprintf('si hacemos (min - 1) o (min -10) no da error de overflow sino ...')
fprintf('\n min - 1 = %d \n', min - 1)

pause
display("Por defecrto cualquier constante en Octave se considera de tipo real (double)")
display("Elegimos el formato de representación binario: format bit")
format bit
display("Convertimos -12 a int8 y lo escribimos")
a=cast(-12,"int8");
a
display("Recordad que hay 2^8= 256 numeros enteros (sin signo) que se pueden escribir con 8 digitos en base 2. Para tenerlos con signo si el primer digito es 0 son positivos y si el primer digito es 1 se les resta 128 y son los negativos.")
