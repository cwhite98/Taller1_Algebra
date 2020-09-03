n = 12;
x = 1:n;
V = fliplr(vander(x));
x = x';
b = V * x;

% Se resuelve el sistema de la forma x = V^-1 * b
x_ = inv(V) * b;
d_x_ = norm(x_ - x)

% Como la matriz V es una matriz muy mal acondicionada porque tiene un 
% numero de condicion alto y determinante muy cercano a 0, en consecuencia 
% al calcular computacionalmente la matriz inversa, se arrastra mucho error  
% por lo que este tambien se propaga al calculo de x = V^-1 * b. 
% Es por esto que se deben implementar algunas técnicas de mejoras como: 

% Mejora 1: calculando la inversa de H con \ en vez de inv()
x_mejor = V\b;
d_x_mejor = norm(x_mejor - x)

% Mejora 2: pseudoinversa vista en clase
%x_pseudo = (inv(V'*V))*V'*b; 
%x_pseudo = (V'*V)\V'*b;
x_pseudo = V\eye(n) * b;
d_x_pseudo = norm(x_pseudo - x)