%% Autor: Antonio Pallarés, curso 2020-21 
% Funcion para calcular las diferencias divididas en la interpolación de Hermite
% Entrada:   
%     x = vector que contiene las abscisas de los n+1 puntos a interpolar (nodos)
%
%     y = valores de la funcion en los n+1 nodos de interpolacion
% El numéro de nodos de interpolacion (n+1), lo obtiene a partir de la longitud de x.
% Salida: 
%     difdiv = la tabla de diferencias divididas
%     coefNewton = coeficientes del polinomio interpolador en la forma de Newton.

function [difdiv,coefNewton]=dif_divHermite(x,y)
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
  difdiv=zeros(n+1,n+2);
  coefNewton=zeros(1,n+1);
  for i=1:m
    for j=aux(i):aux(i+1)-1
      difdiv(j,1)=x(i);
      difdiv(j,2)=y{i}(1);
    endfor
  endfor
  coefNewton(1)=difdiv(1,2); 


for k=3:n+2
    for i=m:-1:1
      for j=aux(i+1)-1:-1:max(aux(i),k-1)
        if difdiv(j-k+2,1)==difdiv(j,1)
          difdiv(j,k)=y{i}(k-1)/factorial(k-2);
        else
          difdiv(j,k)=(difdiv(j,k-1)-difdiv(j-1,k-1))/(difdiv(j,1)-difdiv(j-k+2,1));
        endif
      endfor
    endfor
    coefNewton(k-1)=difdiv(k-1,k);
 endfor  

endfunction
