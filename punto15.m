n = 12
x = 1:n;
x = x';
H = hilb(n);
b = H * x;

% resolviendo el sistema de la forma x = H^-1 * b
x_ = inv(H) * b;
d_x_ = norm(x_ - x);

% Conclusion: como la matriz H es una matriz muy mal acondicionada por su
% alto numero de condicion y determinante muy cercano a 0, haciendo que
% computacionalmente calcular la matriz inversa arrastre mucho error lo que
% se propaga tambien al calculo de la x a partir de x = H^-1 * b

% Tratando de mejorar el problema calculando la inversa de H con \ en vez de inv()
x_mejor = H\b;
d_x_mejor = norm(x_mejor - x);

% Tratando de mejorar el problema con la pseudoinversa vista en clase
%x_pseudo = (inv(H'*H))*H'*b;
x_pseudo = (H'*H)\H'*b;
%x_pseudo = H\eye(n) * b;
d_x_pseudo = norm(x_pseudo - x);


% Conclusion: para una matriz de Hilbert de 12x12 y resolviendo el sistema 
% de la forma x = H^-1 * b, se puede apreciar que calculando la inversa de
% H con la funcion inv() da una distancia entre x y x_ mas grande que
% usando \. Esto se debe a que en matlab inv(A)*b es mas lento y 
% menos preciso que A\b.
% 
% Segun la documentacion de matlab: rara vez es necesario formar la inversa 
% explícita de una matriz. Se presenta un uso indebido frecuente de inv al 
% resolver el sistema de ecuaciones lineales Ax = b. Una forma de resolver 
% la ecuación es con x = inv(A)*b. Una manera mejor, desde el punto de vista 
% del tiempo de ejecución y la precisión numérica, es utilizar el operador 
% de barra invertida de matriz x = A\b. Esto produce la solución usando la 
% eliminación gaussiana, sin formar explícitamente la inversa.
% 
% Se intentó usar la pseudoinversa vista en clase, pero el resultado fue
% mucho peor para la matriz H de 12x12, la distancia entre la x dada y la x
% calculada fue de 35.51, mientras que con el punto expresado anteriormente
% la distancia de fue de 0.13
% %