function ret = polyLagrange_eval(x, y, s)

    n = length(x);
    
    % Matriz
    lambda = zeros(n, n);
    for i=1:n
        for j=1:n
            if i > j
                lambda(i, j) = 0;
            elseif i == j

                if i == 1
                    lambda(i,j) = 1;
                endif
                if i != 1
                    producto = 1;
                    for k=1:i-1
                        producto = producto * (1 / (x(i) - x(k)));
                    endfor
                    lambda(i,j) = producto;
                endif

            else
                lambda(i,j) = lambda(i, j-1) / (x(i) - x(j));
            endif
        endfor
    endfor

    for i=1:length(s)
        dividendo = 0;
        divisor = 0;
        for j=1:n
            dividendo = dividendo + (y(j) * (lambda(j, n) / (s(i) - x(j))));
            divisor = divisor + (lambda(j, n) / (s(i) - x(j)));
        endfor

        eva(i) = dividendo / divisor;

    endfor

    ret = eva;

endfunction

x = linspace(1, 10, 10);
y = x.^2;
interval = linspace(0, 10, 500);
evaluacion = polyLagrange_eval(x, y, interval);
plot(interval, evaluacion)