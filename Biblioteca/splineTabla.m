%% Autor: Teresa Signes
%% Modificado por Salvador Sánchez-Pedreño
%% Funcion que imprime los distintos polinomios que componen el spline 
%% en la forma de combinaciones de potencias de (x-x_i)
%% Entradas:   
%            - x       = vector que contiene las abscisas de los puntos a interpolar (nodos)
%            - a,b,c,d = coeficientes del spline
%            
% Salida: 
%            - Tabla con los intervalos y el polinomio cúbico en el intervalo correspondiente.
%   
function S=splineTabla(x,a,b,c,d)
n=length(x);
disp('  Intervalo                    Spline ')
disp('-------------------------------------------------------------------------------------------------')  
for i=1:n-1
if  b(i)<0 sigb='-'; else sigb='+'; end
if  c(i)<0 sigc='-'; else sigc='+'; end
if  d(i)<0 sigd='-'; else sigd='+'; end
if  x(i)<0 sigx='+'; else sigx='-'; end

Sp=[num2str(a(i)) sigb num2str(abs(b(i))) '*(x' sigx num2str(abs(x(i))) ')' sigc num2str(abs(c(i))) '*(x' sigx  num2str(abs(x(i))) ')^2' sigd num2str(abs(d(i))) '*(x' sigx  num2str(abs(x(i))) ')^3'];
A=[x(i),x(i+1)];
fprintf('[%+5.2e %+5.2e]\t %s\n %s\n',A,Sp)
end
disp('-------------------------------------------------------------------------------------------------')   
