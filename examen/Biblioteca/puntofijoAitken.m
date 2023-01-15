function [aprox, valor, numIt, numEval] = puntofijoAitken(f, x0, tol, nmax, imprime)

  fmt='%5u\t %+17.17f\t %+17.17f\n';

  eval = @(x,y,z) x - (((y-x).^2)./((z-y)-(y-x)));

  npasos = 1;
  x(1) =x0;
  x(2) = f(x(1));
  x(3) = f(x(2));
  i = 3;

  acelerada = eval(x(1), x(2), x(3));
  facelerada = f(acelerada);

  max = nmax;

  if imprime==1
    printf("NumPasos, Acelerada, f(Acelerada)\n")
      printf(fmt, npasos, acelerada, facelerada)
    endif

  while npasos < max
    if(abs(facelerada - acelerada) <= tol)
      break
    endif

    npasos++;
    i++;

    x(i) = f(x(i-1));
    acelerada = eval(x(i), x(i-1), x(i-2));
    facelerada = f(acelerada);

    if imprime==1
      printf(fmt, npasos, acelerada, facelerada)
    endif
  endwhile

  aprox = x(i);
  valor = f(x(i));
  numIt = npasos;
  numEval = 4 + (npasos-1)*2;

  endfunction
