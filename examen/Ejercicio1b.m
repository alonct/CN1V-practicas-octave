clear all
addpath('./Biblioteca')

% n = 2^k

f = @(x) (1-x).^(3/2);

devf = @(x) (-1).*(3/2).*((1-x).^(1/2));

a = 0;
b = 1;

vreal = 2/5;

k = linspace(0, 14, 15);

for i=1:15
  N = 2^(k(i))

  trap = trapecio(f, a, b, N)
  eTrap(i) = abs(trap-vreal);

  simp = simpson(f, a, b, N)
  eSimp(i) = abs(simp-vreal);

  herm = intHermite(f, devf, a, b, N)
  eHerm(i) = abs(herm-vreal);
  printf("----------------------\n")
endfor

printf("\n Tabla 2 \n\n")

for i=1:15
  N = 2^(k(i))

  if i < 15
    cTrap = eTrap(i)/eTrap(i+1);
    cSimp = eSimp(i)/eSimp(i+1);
    cHerm = eHerm(i)/eHerm(i+1);

    printf(sprintf('Trapecio:\nError absoluto: %u, Cociente sucesivo: %u\n', eTrap(i), cTrap))
    printf(sprintf('Simpson:\nError absoluto: %u, Cociente sucesivo: %u\n', eSimp(i), cSimp))
    printf(sprintf('Hermite:\nError absoluto: %u, Cociente sucesivo: %u\n', eHerm(i), cHerm))
  endif

  if i == 15
    printf(sprintf('Trapecio:\nError absoluto: %u\n', eTrap(i)))
    printf(sprintf('Simpson:\nError absoluto: %u\n', eSimp(i)))
    printf(sprintf('Hermite:\nError absoluto: %u\n', eHerm(i)))
  endif

  printf("----------------------\n")
  endfor
