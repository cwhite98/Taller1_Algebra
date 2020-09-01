numCond = [];
determinante = [];
numCondRob = [];
determinanteRob = [];
max = 100;
for n=1:max
    H = hilb(n);
    numCond(n) = cond(H);
    determinante(n) = det(H);
    hilbRobusta = cov1para14(H, 0.5);
    numCondRob(n) = cond(hilbRobusta);
    determinanteRob(n) = det(hilbRobusta)
    
end


figure
plot([1:max],numCondRob)
title('Número condición robusto')
figure
plot([1:max],determinanteRob)
title('Determinante robusto')
figure; hold on
title('Hilbert Número Condición')
xlabel('n')
ylabel('Número de condición')
a1 = plot([1:max],numCond); M1 = 'numCond';
a2 = plot([1:max],numCondRob); M2 = 'numCondRob';
legend([a1;a2], M1, M2)
figure; hold on
title('Hilbert determinante')
xlabel('n')
ylabel('Determinante')
a1 = plot([1:max],determinante); M1 = 'determinante';
a2 = plot([1:max],determinanteRob); M2 = 'determinanteRob';
legend([a1;a2], M1, M2)

