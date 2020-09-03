numCond = [];
determinante = [];
numCondRob = [];
determinanteRob = [];
max = 50;
for n=1:max
    v = 1:1:n
    Vander = fliplr(vander(v))
    numCond(n) = cond(Vander);
    determinante(n) = det(Vander);
    vanderRobusta = cov1para14(Vander, 0.5);
    numCondRob(n) = cond(vanderRobusta);
    determinanteRob(n) = det(vanderRobusta)
end


figure
subplot(2,1,1)
plot([1:max],numCondRob)
title('Número condición robusto')
subplot(2,1,2)
plot([1:max],numCond)
title('Número condición')
figure
subplot(2,1,1)
plot([1:max],determinanteRob)
title('Determinante robusto')
subplot(2,1,2)
plot([1:max],determinante)
title('Determinante')
figure; hold on
title('Vandermonde Número Condición')
xlabel('n')
ylabel('Número de condición')
a1 = plot([1:max],numCond); M1 = 'numCond';
a2 = plot([1:max],numCondRob); M2 = 'numCondRob';
legend([a1;a2], M1, M2)
figure; hold on
title('Vandermonde determinante')
xlabel('n')
ylabel('Determinante')
a1 = plot([1:max],determinante); M1 = 'determinante';
a2 = plot([1:max],determinanteRob); M2 = 'determinanteRob';
legend([a1;a2], M1, M2)

