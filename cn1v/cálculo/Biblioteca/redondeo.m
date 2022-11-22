%Autor: Antonio Pallarés, curso 2020-21
%Modificado por: Salvador Sánchez-Pedreño
%Devuelve el redondeado de un numero (double) con d digitos en mantisa. Todo en base 10
%Entrada: x, valor numérico a redondear
%         ndig, número de cifras decimales

function rx= redondeo (x,numdig)
format long g;
output_precision(numdig,"local");
rx=eval(mat2str(x,numdig));
endfunction
