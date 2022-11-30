function [lambda, M] = lebesgue(nodos, z)

    matriz = factLagrange(nodos);
    altura_matriz = length(matriz(:, 1));

    vect_M = []; % vector que para cada i evalua L_i(x) y almacena el máximo valor encontrado en la posición i de vectM.

    evaluacion = zeros(altura_matriz, length(z));

    for i = 1:altura_matriz
        evaluacion(i, :) = abs(polyval(matriz(i, :), z));   % evaluamos los nodos z en L_i y guardamos el resultado en 
                                                            % valor absoluto.
        vect_M(i) = max(evaluacion(i, :));  % guardamos el máximo de los L_i(z) para cada i=1:altura_matriz.
    endfor

    M = sum(vect_M);    % sum(A): si A es un vector, devuelve la suma de los componentes del vector.

    lambda = sum(evaluacion);   % sum(A): si A es una matriz, devuelve un vector con la suma por columnas de la matriz.

endfunction