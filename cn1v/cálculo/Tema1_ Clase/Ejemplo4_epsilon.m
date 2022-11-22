%Autor: A. Pallarés 
%Modificaciones de: S. Sánchez-Pedreño
%%
pause   
display('El epsilon de máquina')
display('En precisión simple')
%% el menor numero b tal que 1+b > 1
     a = single(1); 
     b=single(1); 
     while a+b ~= a
         b=b/2; 
     end
       fprintf('Epsilon de maquina = %d',2*b);
     
pause        
%% eps es una función de octave-matlab que proporciona el epsilon de máquina   
     
     fprintf('\nOctave tiene una función para indicar el valor de eps:')
     fprintf('\neps = %d', eps(1,"single"));
     
     pause
     fprintf("\nComparaciones  0=falso, 1 =verdadero")
     fprintf('\n(1+eps/2 == 1) = %d\n\n\n',((1+eps(1,"single")/2) == 1));
     
display('En precisión doble')
%% el menor numero b tal que 1+b > 1
     a = 1; 
     b=1; 
     while a+b ~= a
         b=b/2; 
     end
       fprintf('Epsilon de maquina = %d',2*b);
     
pause        
%% eps es una función de octave-matlab que proporciona el epsilon de máquina   
     
     fprintf('\nOctave tiene una función para indicar el valor de eps:')
     fprintf('\neps = %d', eps);
     
     pause
     fprintf("\nComparaciones  0=falso, 1 =verdadero")
     fprintf('\n(1+eps/2 == 1) = %d\n',((1+eps/2) == 1));
     fprintf('\n(1+eps == 1) = %d\n',((1+eps) == 1));
     
     
     