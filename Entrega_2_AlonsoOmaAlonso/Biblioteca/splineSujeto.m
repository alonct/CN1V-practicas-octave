%% Autor: Antonio Pallarés / Teresa Signes 
%% Modificado por: Salvador Sánchez-Pedreño
%% Funcion que calcula los coeficientes del spline sujeto
%% Entradas:   
%%            - x = vector que contiene las abscisas de los puntos a interpolar (nodos). Los nodos deben estar ordenados.
%%            - a = ordenadas de los puntos
%%            - tan_ini=  el valor de la derivada en el primer nodo
%%            - tan_fin=  el valor de la derivada en el último nodo
%% Salida: 
%%          - vectores b,c,d con los coeficientes de los polinomios centrados
%%                             a_i+b_i*(x-x_i)+c_i*(x-x_i)^2+d_i*(x-x_i)^3
%%
%%   b,d tienen dimensiones igual a n-1, es decir, el número de polinomios cúbicos
%%   c tiene dimensión n (una unidad más que b y d), por razones técnicas de la primera ecuación 
%% Variables:
%%  los vectores l, u y z son los del algoritmo LU. l se diemensiona a n+1, como c, por razones análogas.
%%  los vectores h y ds son: h(i)=x(i+1)-x(i), ds(i)=a(i+1)-a(i)
%
%
function [b,c,d]= splineSujeto(x,a,tan_ini,tan_fin)
  n=length(x);
  if length(a)~=n
    error('dimensiones incompatibles');
  end
  n=n-1;
  b = zeros(1,n + 1);
  c = zeros(1,n + 1);
  d = zeros(1,n + 1);
  h = zeros(1,n);
  ds = zeros(1,n);
  l = zeros(1,n + 1);
  u = zeros(1,n);
  z = zeros(1,n);
  for i=1:n
    h(i)=x(i+1)-x(i);
    ds(i)=a(i+1)-a(i);
  end
  l(1)=2*h(1); % cambio con respecto al spline natural
  u(1)=0.5; % cambio con respecto al spline natural
  z(1)=(3*ds(1)/h(1) -3 * tan_ini)/l(1); % cambio con respecto al spline natural
  for i=2:n
    l(i)=2*(h(i)+h(i-1))-h(i-1)*u(i-1);
    u(i)=h(i)/l(i);
    z(i)=((3*ds(i)/h(i)-3*ds(i-1)/h(i-1))-h(i-1)*z(i-1))/l(i);
  end
  l(n+1)=h(n)*(2- u(n)); % cambio con respecto al spline natural
  z(n+1) = ((3 * tan_fin - 3 * ds(n)/h(n)) - h(n)*z(n)) / l(n+1); % cambio con respecto al spline natural
  c(n+1)=z(n+1);  % cambio con respecto al spline natural
  for i=n:-1:1
    c(i) = z(i)- u(i) * c(i+1);
    b(i) = ds(i) / h(i) - h(i) * (c(i+1) + 2 * c(i)) / 3;
    d(i) = (c(i+1) - c(i)) / (3 * h(i));
  end
  
end
