clc
clear all
close all
addpath('../Biblioteca')

N=[5,10,15];
f = @(x) 1./(1+ x.^2);
df = @(x) (-2).*x./(1+x.^2).^2;
ddf =@(x) 2*(3*x.^2 -1)./(1+x.^2)^3;
for i =1:length(N)
  nodos=linspace(-5,5,N(i)+1);
  k= length(nodos);
  valores{1}=[f(nodos(1)), df(nodos(1)), ddf(nodos(1))];
  valores{k}=[f(nodos(k)), df(nodos(k)), ddf(nodos(k))];
  for j=2: k-1
    valores{j} = f(nodos(j))
  endfor
  %valores{2:k-1} = f(nodos(2: k-1))
  %valores   no funciona por ser celda

endfor
rmpath('../Biblioteca')
