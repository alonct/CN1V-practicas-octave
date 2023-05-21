function [x, fx, npasos] = zeroshybrid(f, A, B, tol, maxit, imprime)
    %% ENTRADA:
        %% f es la función de la cual queremos encontrar la raíz.
        %% a y b extremos del intervalo inicial y que cumplen f(a)*f(b)<0.
        %% tol, maxit e imprime tienen el significado de siempre: tolerancia, 
        %%      máximo número de iteraciones e impresión de información extra.

    %% SALIDA:
        %% x es la aproximación obtenida y fx su imagen por f.
        %% npasos es el número de pasos requeridos para llegar hasta esa aproximación.

    fmt='%5u\t %+17.17f\t %+17.17f\t %+17.17f\t %+17.17f\t %c\n';

    a = zeros(1, maxit);
    b = zeros(1, maxit);
    x = zeros(1, maxit + 1);

    
    a(1) = A;
    b(1) = B;

    npasos = 1;

    if f(A)*f(B) >= 0
        display("El intervalo incial no es válido.")
        return;
    endif

    z = linspace(A, B, 200);
    figure(1)
    plot(z, f(z), [A, B], [0,0])
    hold on

    x(1) = a(1);
    x(2) = b(1);

    if imprime==1
        display("Iteración          x                      f(x)                     a                        b           S/B")
      endif

    while npasos <= maxit
        npasos += 1;
        i = npasos;
        deltax = f(x(i)) * (x(i) - x(i-1))/(f(x(i)) - f(x(i-1)));
        c = x(i) - deltax;

        if or(c<a(i-1), c>b(i-1))

            tipo = 0;

            %display("Parte 1")

            c = a(i-1) + (b(i-1) - a(i-1))/2;

            if f(a(i-1))*f(c) <0
                a(i) = a(i-1);
                b(i) = c;
                x(i) = a(i);
                x(i+1) = c;
            else
                a(i) = c;
                b(i) = b(i-1);
                x(i) = b(i);
                x(i+1) = c;
            endif

            plot(x(i), 0, '*', 'color', 'g')
            plot(x(i), f(x(i)), '*', 'color', 'g')
            plot([x(i) x(i)], [0, f(x(i))], 'color', "c")

        else

            tipo = 1;

            %display("Parte 2")

            if f(a(i-1))*f(c) <0
                a(i) = a(i-1);
                b(i) = c;
                x(i+1) = c;
            else
                a(i) = c;
                b(i) = b(i-1);
                x(i+1) = c;
            endif

            plot(x(i), 0, 'o', 'color', 'r')
            plot(x(i), f(x(i)), 'o', 'color', 'r')
            plot([x(i) x(i)], [0, f(x(i))], 'color', "m")

        endif

        if and((abs(deltax)<=tol*(1+abs(x(i+1)))),(abs(f(x(i+1)))<=tol) )            
            display("...\n");
            fx = f(x(i+1))
            x = x(i+1)
            npasos
            display("...END\n");
            return;
        endif

        if imprime == 1

            if tipo == 1
                printf(fmt, i-1, x(i), f(x(i)), a(i-1), b(i-1), 'S');
            else
                printf(fmt, i-1, x(i), f(x(i)), a(i-1), b(i-1), 'B');
            endif
        endif

    endwhile

    fx = f(x(maxit+1));
    x = x(maxit+1);

endfunction