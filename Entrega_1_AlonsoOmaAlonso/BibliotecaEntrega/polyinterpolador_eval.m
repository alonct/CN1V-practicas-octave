%% Autor: Antonio Pallarés, curso 2020-21 
%% Modificaciones de Salvador Sánchez-Pedreño, CN1V, curso 2022-23
% evalua el polinomio p(t) dado en la forma de Newton por los coeficientes  
% correspondientes a las abcisas del vector x_abcisas

function p_t = polyinterpolador_eval (coefNewton, x_abcisas, t)
  n=length(coefNewton)-1;
  m=length(t);
  p_t=coefNewton(n+1)*ones(1,m);
  for i=n:-1:1
    p_t=p_t.*(t-x_abcisas(i))+coefNewton(i);
  end
end