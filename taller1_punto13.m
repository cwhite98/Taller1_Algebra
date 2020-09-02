data = readtable('portfolio100.txt');
datarray = data{:,:};
date = datarray(:, 1);
datarray = datarray(:, 2: end);

% matriz de covarianzas
S = cov(datarray);

% numero de condicion
C = cond(S);

% encogimiento para mejorar el numero de condicion
I = eye(100, 100);
lambda = 5;

% encogimiento de la matriz de covarianza usando cov
S_mejor = S + lambda * I;
C_mejor = cond(S_mejor);

% encogimiento de la matriz de covarianza usando cov1para
S_1para = cov1para(datarray);
C_1para = cond(S_1para);
S_mejor_1para = S_1para + lambda * I;
C_mejor_1para = cond(S_mejor_1para);

% encogimiento de la matriz de covarianza usando kurmain
[idx,dm,mm,Ss,wval0,ndir]= kur_main(datarray);
C_kur = cond(Ss);
S_mejor_kur = Ss + lambda * I;
C_mejor_kur = cond(S_mejor_kur);

% Conclusion
% - para cov: el numero de condicion pasó de ser 1.863e+03 a 416.760. Es
% decir aproximadamente se redujo un poco mas de la cuarta parte.
% - para cov1para: el numero de condicion pasó de ser 1.536e+03 a 406.764. Es
% decir aproximadamente se redujo un poco menos de la cuarta parte.
% - para kur_main: el numero de condicion pasó de ser 2.247e+03 a 290.231. Es
% decir aproximadamente se redujo casi que a la octava parte.
% %