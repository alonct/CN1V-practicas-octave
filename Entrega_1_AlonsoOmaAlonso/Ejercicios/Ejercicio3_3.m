addpath('../BibliotecaEntrega')

% Apartado a

N = [4, 8, 14, 20];
maximo = max(N) + 1;
valores = zeros(length(N), maximo);

for i=1:length(N)
    w = rand(1, N(i) + 1);
    u = (-0.01) + 0.02 .* w;
    diferencia(i) = maximo - length(u);
    valores(i,:) = [u, zeros(1, diferencia(i))];
endfor

% Apartado b

function ret = Lagrange(x, y)
    matriz = factLagrange(x);
    polinomio = interpolLagrange(matriz, y);
    ret = polinomio;
endfunction

coeficientes = zeros(length(N), 2, maximo);

for i=1:length(N)
    abcisas = linspace(-1, 1, N(i)+1);
    x = abcisas;
    y = sin(abcisas);
    z = [sin(abcisas), zeros(1, diferencia(i))] + valores(i, :);
    z((N(i)+2: end)) = [];

    coef1 = Lagrange(x, y);
    coeficientes(i, 1, :) = [zeros(1, diferencia(i)), coef1];

    coef2 = Lagrange(x, z);
    coeficientes(i, 2, :) = [zeros(1, diferencia(i)), coef2];
endfor

%% En este momento tenemos guardados los coeficientes de los polinomios interpoladores en la matriz de dimensión 3
%% que hemos llamado coeficientes. Además estan ordenados de manera decreciente, con el vector completado por delante
%% con ceros hasta el el coeficiente de mayor grado del polinomio.
%% De esta manera, tenemos que para n=9, (n(1)) los coeficientes del polinomio interpolador con 'y' se encontrarán en 'coeficientes(1,1,:)',
%% mientras que los del polinomio interpolador con 'z' se encuentran en 'coeficientes(1,2,:)'.

% Apartado c

interval = linspace(-1, 1, 1000);

for i=1:length(N)

    nodos = linspace(-1, 1, N(i) + 1);

    for j=1:maximo
        coef1(j) = coeficientes(i, 1, j);
        coef2(j) = coeficientes(i, 2, j);
    endfor

    py = polyval(coef1, interval);
    pz = polyval(coef2, interval);

    [lambda, M] = lebesgue(nodos, interval);

    disp(sprintf('Para %u nodos:', N(i)))
    dif_max = max(abs(py-pz))
    desv_max_esp = 0.01 * M
    printf('\n')

    figure(i)
    title(sprintf('n = %u', N(i)))
    hold on
    plot(interval, py, ';P_N (x);')
    hold on
    plot(interval, pz, ';P_N prima (x);')
    hold off
endfor