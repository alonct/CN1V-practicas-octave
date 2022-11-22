%% Autor: Antonio Pallarés,  
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Funcion para calcular la tabla de diferencias divididas 
%% Variables esperadas:  
%%     x = vector de los nodos
%%     y = vector de las ordenadas
%% Salida:
%%     difdiv = tabla de las diferencias divididas (incluye nodos en la primera columna)
%%     coefNewton = los coeficientes del polinomio de Newton en orden ascendente de la potencia
%% Para recuperar las dos variables de salida se debe hacer, p.ej. [A,B]=diferencias_divididas(x,y)

function [difdiv,coefNewton]=dif_divNewton(x,y)
  
n=length(x)-1;
if length(y) ~= n+1
   error('Error: las dimensiones de x e y no coinciden');
endif

difdiv=zeros(n+1,n+2);
for i=1:n+1
    difdiv(i,1)=x(i);
    difdiv(i,2)=y(i);
    coefNewton(i)=y(i);
endfor

for j=3:n+2
    for i=n+1:-1:j-1
        difdiv(i,j)=(difdiv(i,j-1)-difdiv(i-1,j-1))/(x(i)-x(i-(j-2)));
    endfor
    coefNewton(j-1)=difdiv(j-1,j);
    
endfor
disp(['Número de nodos de interpolación= ' mat2str(n+1)])
disp('Nodos: ')
disp(x)
disp('Ordenadas:')
disp(y)
disp('')
disp('La tabla de diferencias divididas es:');
disp(difdiv)

disp('')
disp('Los coeficientes del polinomio interpolador de Newton son: ')
disp(coefNewton)
endfunction


