%% Autor: Antonio Pallarés, curso 2020-21 
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2021-22
% evalua el polinomio p(t) dado en la forma de Newton por los coeficientes  
% correspondientes a las abcisas del vector x_abcisas

function p_t = polyinterpolador_eval (coefNewton, x_abcisas, t)
  n=length(coefNewton)-1;
  m=length(t);
  p_t=coefNewton(n+1)*ones(1,m);
  dif=zeros(n,m);
  for i=1:n
    dif(i,:)=(t.-x_abcisas(i));
  end
  for i=n:-1:1
    p_t=p_t.*dif(i,:).+coefNewton(i);
  end
end