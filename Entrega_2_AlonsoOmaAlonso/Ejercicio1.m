
n = 0
z = 1/10^n
f = @(x) z/x

x(1) = -010;
for i = 1:20
    x(i+1) = f(x(i))
endfor
