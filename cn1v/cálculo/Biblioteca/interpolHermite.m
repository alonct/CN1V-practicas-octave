%% Autor: Antonio Pallarés, curso 2020-21 
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Variables: 
%%   x = vector de nodos
%%   y = debe ser una celda de una única columna y tantas filas como nodos. cada fila contiene los datos en el nodo correspondiente
%% Salida:
%%  coefNewton = los coeficientes de la forma de Newton del polinomio intepolador de Hermite
%%  nodos_rep = vector de nodos repetidos, a partir de este se puede evaluar el polinomio con la función polyinterpolador_eval.m


function [coefNewton,nodos_rep] = interpolHermite (x, y)
  m=length(x);
  if length(y) ~= m
    error('Las dimensiones de x e y no coinciden');
  end
  l=zeros(1,m);
  aux=ones(1,m+1);
  for i=1:m
    l(i)=length(y{i});
    aux(i+1)=aux(i)+l(i);
  endfor
  n=aux(m+1)-2;
  nodos_rep=zeros(1,n+1);
  coefNewton=zeros(1,n+1);
  for i=1:m
    for j=aux(i):aux(i+1)-1
      nodos_rep(j)=x(i);
     % coefNewton(j)=y{i}(1); 
    endfor
  endfor
  for k=1:n+1
    for i=m:-1:1
      for j=aux(i+1)-1:-1:max(aux(i),k)
        if nodos_rep(j-k+1)==nodos_rep(j)
          coefNewton(j)=y{i}(k)/factorial(k-1);
        else
          coefNewton(j)=(coefNewton(j)-coefNewton(j-1))/(nodos_rep(j)-nodos_rep(j-k+1));
        endif
      endfor
    endfor
  endfor  

end