%Autores: A. Pallarés
%Modificaciones de: S. Sánchez-Pedreño
%%

clear all   % Para borrar las variables en memoria
clc         % Para limpiar la Ventana de comandos, TERMINAL.

%Numeros reales: numeros en coma flotante, cómo representarlos
%
%usamos las funciones de octave-matlab:
%       display para mandar mensajes a la consola
%       fprintf para mandar mensajes a la consola con variables y formato
%           admite variables numéricas (%d, %e, %g)
%           admite variables que son cadenas de caracteres-string- (%s,..)
%pause  para ir deteniendo la ejecución del script
%

display('1) Representando números')
pause

    fprintf ('\nx=1/7 \n \n') % para escribir en la TERMINAL
    x=1/7

    fprintf('format long \n')
    format long   %numeros reales con 16 digitos en la mantisa ("double")
    x

    fprintf('format long g \n')
    format long g
    x

    fprintf('format long e \n')
    format longe
    x

    fprintf('format short \n')
    format short
    x

    fprintf('\n\n')

pause
display('2) Indeterminaciones NaN e Inf ');
pause
    fprintf('\n 1/0 =  %d\n', 1/0);
    fprintf(' 3/Inf =  %d\n', 3/Inf);
    fprintf(' 0/0 =  %d \n',0/0);
    fprintf(' \n Inf/Inf =  %d\n', Inf/Inf);
    fprintf(' Inf - Inf =  %d\n\n', Inf-Inf);

pause

pause
display('3)  El mayor y el menor número <<double>>')

    fprintf('\n mayor real positivo \n');   %
    pause
    max=realmax

    display('Si hacemos (max+1) o (max+1.0e+291) no da error de overflow sino ...')
    fprintf('\n max+1e+291 = %d \n', max+1.0e+291);

    display('pero si hacemos (max+1.0e+292) o (2*max) da Inf (un numero double especial), OVERFLOW')
    fprintf('\n 2*max = %d \n', 2*max);

    pause
    fprintf('\n menor real positivo \n');
    pause
    min=realmin

    display('si hacemos (min/2^52 ) o (max+10) no da error pero ...')
    fprintf('\n min / 2^52 = %d \n', min/2^52);

    display('pero si hacemos (min/2^53) da cero')
    fprintf('\n min / 2^53 = %d \n', min/2^53);

pause
display('4)  La representación interna...')
    format bit
    fprintf('1 -> %d\n')
    1
    pause
    fprintf('2 -> %d\n')
    2
    pause
    fprintf('1/2 -> %d\n')
    1/2
    pause
    fprintf('1/10 -> %d\n')
    1/10
    format long g

%single(pi)
%cast(pi,"single")
