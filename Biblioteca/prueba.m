clear all

x = linspace(1, 10, 10)
y = x.^2;
intervalo = linspace(0, 10, 500);
plot(intervalo, polyval(pruebaLagrange(x, y), intervalo), x, y, '*', 'color', 'k')
%{

matriz = factLagrange(x);

polinomio = [0];

for i=1:length(x)
    polinomio = y(i) * matriz(i,:);
endfor


%}


