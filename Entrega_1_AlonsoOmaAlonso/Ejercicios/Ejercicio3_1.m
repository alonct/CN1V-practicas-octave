addpath('../BibliotecaEntrega')

n = [5, 10, 15, 20];
interval = linspace(-1, 1, 1000);

for i=1:length(n)
    nodos = linspace(-1, 1, n(i) + 1);
    [lambda_n, num_m] = lebesgue(nodos, interval);

    figure(i)
    hold on
    plot(interval, lambda_n, ';lambda(x);')
    title(sprintf('n = %u', n(i)))
    hold off

endfor