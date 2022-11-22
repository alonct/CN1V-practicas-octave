function ret = interpolLagrange (matriz, y)

    suma = 0;
    for i=1:length(y)
        term = y(i) * matriz(i, :);
        suma = suma + term;
    endfor

    ret = suma;

endfunction