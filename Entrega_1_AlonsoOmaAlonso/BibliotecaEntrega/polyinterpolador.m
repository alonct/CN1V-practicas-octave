%% Autor: A. Pallarés, Curso 2020-21, Ingeniería Química
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2021-22
%% Devuelve los coeficientes del polinomio interpolador escrito en la forma estándar
%% a(n)x^n+...a(1)x+a(0) 
%% Variables esperadas: 
%%    coefNewton = vector de coeficientes de polinomio interpolador en la forma de Newton (orden ascendente)
%%    nodos = vector de nodos de la inerpolación 
%% Salida: 
%%    vector de coeficientes en orden decreciente de la potencia: 
%%    es el orden adecuado, por ejemplo, para la función polyout()


function  a = polyinterpolador (coefNewton, nodos)
  n=length(coefNewton)-1;
  a=zeros(1,n+1);
  for i=n+1:-1:1
    for k=n+2-i:-1:2
      a(k)=a(k-1)-a(k)*nodos(i);
    end
    a(1)=coefNewton(i)-a(1)*nodos(i);
  end
  a=flip(a);
 

end