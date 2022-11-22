%% Autor: Salvador Sánchez-Pedreño, CN1V 2022-23
%% Función que devuelve los n+1 nodos de Chebyshev en el intervalo [a,b]
%% Entrada: a, b (los extremos del intervalo) y n, siendo n+1 el grado del polinomio de Chebyshev
%% Salida: los n+1 nodos de Chebyshev en [a,b], ordenados de menor a mayor.

function nodos=nodosCheby(a,b,n)
indic=(2*[n:-1:0]+1)*pi/(2*n+2);
nodos=(1+cos(indic))*(b-a)/2+a;
endfunction

