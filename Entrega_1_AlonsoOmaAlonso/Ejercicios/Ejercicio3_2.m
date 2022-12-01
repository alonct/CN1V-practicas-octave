addpath('../BibliotecaEntrega')

n = [9, 19];
z = linspace(-1, 1, 1000);

for i=1:length(n)
    for j=1:n(i)
        nodos = linspace(-1, 1, j+1);
        [lambda_n, num_m] = lebesgue(nodos, z);
        M(j) = num_m;
    endfor
    interval = linspace(1, n(i), n(i));
    figure(i)
    plot(interval, M, interval, M, '*')
    title(sprintf('n = %u', n(i)))
    hold off
endfor