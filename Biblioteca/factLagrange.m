function ret = factLagrange(x)

    matriz = zeros(length(x), length(x));

    for i=1:length(x)
        p=1;
        for j=1:length(x)
            if j~=i
                c = poly(x(j))/(x(i)-x(j)); % Poly devuleve los coeficientes del polinomio cuyas raíces son el argumento dado, es decir, 
                                            % en este caso poly(x(j)) = 1*x -x(j)*x^0 = [1, -x(j)] en notación de octave.
                p = conv(p,c);
            end
        end
        matriz(i, :) = p;
    endfor
    ret = matriz;
endfunction
