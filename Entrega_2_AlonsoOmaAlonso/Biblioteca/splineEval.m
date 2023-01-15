%% Autor: Antonio Pallarés
%% Modificado por Salvador Sánchez-Pedreño, CN1V 2021/22
% Funcion para evaluar el spline en t
% Entradas:   
%            - x       = vector que contiene las abscisas de los puntos a interpolar (nodos) ordenados de forma creciente.
%            - a,b,c,d = coeficientes del spline
%            - t       = valor donde se evaluar el spline, puede ser un valor o un vector de coordenadas.
% Salida: 
%            - valor = evaluación del spline en t 
%            

function valor = splineEval(x,a,b,c,d,t)
  n=length(x)-1;
  m=length(t);
  
for j=1:m
  if (t(j)<x(1) || t(j)>x(n+1)) valor(j)=0;
  else 
    for i=1:n
     if (t(j)<=x(i+1)) 
        aux=t(j)-x(i);
        valor(j)=a(i)+aux*(b(i)+aux*(c(i)+aux*d(i)));
        break;
     endif
    endfor
  endif
endfor
endfunction

