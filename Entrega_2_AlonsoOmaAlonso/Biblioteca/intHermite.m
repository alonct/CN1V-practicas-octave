function ret = intHermite(f, devf, a, b, n)

  h = (b-a)/n;
  x = linspace(a, b, n+1);

  sumf = 0;
  for i=2:n
    sumf += f(x(i));
  endfor

  sumdev = 0;
  for i =1:n
    sumdev += devf(x(i));
  endfor

  ret = h*((2/3)*f(x(1)) + sumf + (1/3)*f(x(n+1)))+((h^2)/6)*sumdev;

  endfunction
