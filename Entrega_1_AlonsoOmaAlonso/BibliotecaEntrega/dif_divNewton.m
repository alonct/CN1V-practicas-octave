%% Autor: U.M. Ascher and C. Greif, "A First Course in Numerical Methods", SIAM 2011, cap.10
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2022-23
%% Funcion para calcular la tabla de diferencias divididas 
%% Variables esperadas:  
%%     xi = vector de los nodos
%%     yi = vector de las ordenadas
%% Salida:
%%     tabla = tabla de las diferencias divididas (incluye nodos en la primera columna)
%%     coefNewton = los coeficientes del polinomio de Newton en orden ascendente de la potencia, vector fila
%% Para recuperar las dos variables de salida se debe hacer, p.ej. [A,B]=dif_divNewton(x,y)
function [tabla,coefNewton] = dif_divNewton(xi,yi)
%
np1 = length(xi); n = np1-1;
tablei = zeros(np1,np1); 
xi = xi'; 
yi = yi'; 
% construct divided difference table one column at a time 
tablei(1:np1,1) = yi;
for k = 2:np1
    tablei(k:np1,k) = (tablei(k:np1,k-1) - tablei(k-1:n,k-1)) ./ ...
                     (xi(k:np1) - xi(1:np1-k+1));
end
tabla=zeros(np1,np1+1);
tabla(:,1)=xi;
tabla(:,2:np1+1)=tablei;
coefNewton = diag(tablei)';  % the diagonal elements of table %% tomo la adjunta para recuperar un vector fila
disp(['Número de nodos de interpolación= ' mat2str(np1)])
disp('Nodos: ')
disp(xi')
disp('Ordenadas:')
disp(yi')
disp('')
disp('La tabla de diferencias divididas es:');
disp(tabla)

disp('')
disp('Los coeficientes del polinomio interpolador de Newton son: ')
disp(coefNewton)