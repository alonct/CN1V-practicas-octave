%% Autor: A. Pallarés, Curso 2020-21, Ingeniería Química
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2021-22
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
    for j=n+1:-1:i+1
      coefNewton(j)=(coefNewton(j)-coefNewton(j-1))/(x(j)-x(j-i));
    end
  end
end
