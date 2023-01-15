%% Autor: Antonio Pallarés 
%% Modificaciones de: salvador Sánchez-Pedreño 2021-22
%%  Calcula la aproximación a una integral con la regla compuesta de Simpson    
%%  Entrada:    - x son las abscisas de la regla de Simpson. LA LONGITUD DEL VECTOR DEBE SER IMPAR Y DEBEN SER EQUIESPACIADAS.
%%              - y es la imagen de la función en el vector de abscisas x             
%%                Los extremos de integración vienen dados por la primera y la última de las componentes de x
%%  Salida:     - int es el valor aproximado de la integral



function int=simpsonVect(x,y)
h=x(2)-x(1);
M=length(x)-1;% M es el número de intervalos de la particion definida por x TIENE QUE SER PAR.
if (rem(M,2)!=0)
  error('El número de abscisas debe ser impar');
endif  
int=y(1)+y(M+1);% f(a) + f(b) 
int=h/3*(int+4*sum(y(2:2:M))+2*sum(y(3:2:M-1)));

end



