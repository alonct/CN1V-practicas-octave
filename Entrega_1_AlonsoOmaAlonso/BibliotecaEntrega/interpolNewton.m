%% Autor: A. Pallarés, Curso 2020-21, 
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2022-23
%% La función calcula los coeficientes de la forma de Newton del polinomio intepolador
%% y los devuelve en orden creciente de la potencia
%% Las variables son los vectores de nodos (x) y ordenadas (y) para  interpolar


function coefNewton = interpolNewton (x, y)
  n=length(x)-1;
  if length(y) ~= n+1
    error('Las dimensiones de x e y no coinciden');
  end
  coefNewton=y;
  for i=1:n
      coefNewton(i+1:n+1)=(coefNewton(i+1:n+1)-coefNewton(i:n))./(x(i+1:n+1)-x(1:n+1-i));
  end
end