clear all
addpath('./Biblioteca')
output_precision(16)
fmt='%5u\t %+17.17f\t %+17.17f\n';

g = 9.807;
T0 = (2*pi)/sqrt(g);

a = 0;
b = 3;

f = @(x,alpha) 1./sqrt(1-((sin(alpha/2)).^2.*(sin(x)).^2));

abcisas = linspace(0,3,200);
figure (1)
for k=1:length(abcisas)
    fz = @(x) f(x,abcisas(k));
    y(k) = 2*(1/pi)*simpson(fz, 0, pi/2, 20);
endfor
plot(abcisas, y)

function [alpha_1, ga1, numpasos] = secante_mod(x0, x1, tol, maxit)
    numpasos = 1;
    imprime = 1;
    fmt='%5u\t %+17.17f\t %+17.17f\n';

    f = @(x,alpha) 1./sqrt(1-((sin(alpha/2)).^2.*(sin(x)).^2));
    g = 9.807;

    alpha_0 = x0;
    g0 = @(x) f(x, alpha_0);
    ga0 = simpson(g0, 0, pi/2, 100) * (2/pi) -1.5; %% Restamos 1.5 porque es donde queremos hallar la raíz.

    alpha_1 = x1;
    g1 = @(x) f(x, alpha_1);
    ga1 = simpson(g1, 0, pi/2, 100) * (2/pi) -1.5;

    if (imprime == 1) 
      printf(fmt,numpasos,alpha_1,ga1)
    endif

    while numpasos <= maxit
        numpasos += 1;
        if (abs(ga1 - ga0))<eps
            disp('Pendiente = 0');
            return;
        endif

        d = ga1 * (alpha_1 - alpha_0)/(ga1 - ga0);

        alpha_0 = alpha_1;
        ga0 = ga1;

        alpha_1 = alpha_1 - d;
        g1 = @(x) f(x, alpha_1);
        ga1 = simpson(g1, 0, pi/2, 100) * (2/pi)-1.5;

        if (imprime == 1) 
            printf(fmt,numpasos,alpha_1,ga1)
        endif

        if and((abs(d)<=tol*(1+abs(alpha_1))), abs(ga1)<=tol)
            return;
        endif

    endwhile
    disp('No hay convergencia.');
    return;
endfunction

figure(2)

x0 = 3;
x1 = 2.5;

[alpha, ga, numpasos] = secante_mod(x0, x1, 1E-14, 20);

plot(abcisas, y, [0, pi], [1.5, 1.5])
hold on
plot(alpha,ga+1.5,'*')

printf('La aproximación obtenida en %3u pasos es: %15.15e\n',numpasos,alpha)

%% Una de las ventajas de usar el método de la secante es, que al ser convexa la función el método converge a la raíz muy rápidamente.