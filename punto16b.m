n = 12;
x = 1:n;
V = fliplr(vander(x));
x = x';
b = V * x;

% Se resuelve el sistema de la forma x = V^-1 * b
x_ = inv(V) * b;
d_x_ = norm(x_ - x)

% Mejora 1: calculando la inversa de H con \ en vez de inv()
x_mejor = V\b;
d_x_mejor = norm(x_mejor - x)

% Mejora 2: pseudoinversa vista en clase
%x_pseudo = (inv(V'*V))*V'*b; 
%x_pseudo = (V'*V)\V'*b;
x_pseudo = V\eye(n) * b;
d_x_pseudo = norm(x_pseudo - x)