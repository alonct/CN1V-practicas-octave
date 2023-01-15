addpath('./Biblioteca')

f = @(x) x;
dev = @(x) 1;
h = intHermite(f, dev, 0, 1, 10)

