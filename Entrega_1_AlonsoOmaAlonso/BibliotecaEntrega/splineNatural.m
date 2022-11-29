%% Autor: Antonio Pallarés / Teresa Signes (?), CN1V Curso 
%% Modificado por: Salvador Sánchez-Pedreño
%% Funcion que calcula los coeficientes del spline natural
%% Entradas:   
%%            - x = vector que contiene las abscisas de los puntos a interpolar (nodos). Deben estar ordenados
%%            - a = ordenadas de los puntos
%% x y a tienen dimensiones igual al número de nodos
%%            
%% Salida: 
%          - vectores b,c,d con los coeficientes de los polinomios centrados
%                             a_i+b_i*(x-x_i)+c_i*(x-x_i)^2+d_i*(x-x_i)^3
%%   b,d tienen dimensiones igual a n-1, es decir, el número de polinomios cúbicos
%%   c tiene dimensión n (una unidad más que b y d), por razones técnicas de la primera ecuación 
%% Variables:
%%  los vectores l, u y z son los del algoritmo LU. l se diemensiona a n+1, como c, por razones análogas.
%%  los vectores h y ds son: h(i)=x(i+1)-x(i), ds(i)=a(i+1)-a(i)
%
function [b,c,d]= splineNatural(x,a)
  n=length(x);
  if length(a)~=n
    error('dimensiones incompatibles');
  end
  n=n-1;
  b = zeros(1,n);
  c = zeros(1,n + 1);
  d = zeros(1,n);
  h = zeros(1,n);
  ds = zeros(1,n);
  l = zeros(1,n + 1);
  u = zeros(1,n);
  z = zeros(1,n);
  for i=1:n
    h(i)=x(i+1)-x(i);
    ds(i)=a(i+1)-a(i);
  endfor
  l(1)=1;
  for i=2:n
    l(i)=2*(h(i)+h(i-1))-h(i-1)*u(i-1);
    u(i)=h(i)/l(i);
    z(i)=((3*ds(i)/h(i)-3*ds(i-1)/h(i-1))-h(i-1)*z(i-1))/l(i);
  endfor
  l(n+1)=1;
  c(n+1)=0;
  for i=n:-1:1
    c(i) = z(i)- u(i) * c(i+1);
    b(i) = ds(i) / h(i) - h(i) * (c(i+1) + 2 * c(i)) / 3;
    d(i) = (c(i+1) - c(i)) / (3 * h(i));    
  endfor
endfunction