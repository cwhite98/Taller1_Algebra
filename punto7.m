%summary(fileID);

data = readtable('portfolio100.txt');
datarray = data{:,:};
date = datarray(:, 1);
datarray = datarray(:, 2: end);

media = mean(datarray);

S = cov(datarray);
SPara = cov1para(datarray);
[idx,dm,mm,Ss,wval0,ndir]= kur_main(datarray);

dHabitual = (datarray-media) * inv(S) *(datarray-media)';
dHabitual = diag(dHabitual).^(1/2);

dPara = (datarray-media) * inv(SPara) *(datarray-media)';
dPara = diag(dPara).^(1/2);

dKur = (datarray-mm) * inv(Ss) *(datarray-mm)';
dKur = diag(dKur).^(1/2);

mahalanobis = mahal(datarray,datarray).^(1/2)


%%%%%%%%%%%%% MAHALANOBIS %%%%%%%%%%%%%%%%%%%%
subplot(4,1,1)
Chabit=chi2inv(0.95,6)
I=find(mahalanobis>Chabit)
I2=find(mahalanobis<Chabit)
plot(datarray(I2,:),datarray(I2, :), 'ob')
hold on
plot(datarray(I,: ),datarray(I, :), '+r')

%%%%%%%%%%%%%%% COV1PARA %%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,2)
Cpara=chi2inv(0.95,6)
IPara=find(dPara>Cpara)
I2Para=find(dPara<Cpara)
plot(datarray(I2Para, :),datarray(I2Para, :), 'ob')
hold on
plot(datarray(IPara, :),datarray(IPara, :), '+r')

%%%%%%%%%%%%%%% KUR %%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(4,1,3)
Ckur=chi2inv(0.95,6)
IKur=find(dKur>Ckur)
I2Kur=find(dKur<Ckur)
plot(datarray(I2Kur, :),datarray(I2Kur,:), 'ob')
hold on
plot(datarray(IKur, :),datarray(IKur,:), '+r')

% idx para todos
idx_habitual = zeros(668, 1);
idx_habitual(I,:) = 1;

idx_para = zeros(668, 1);
idx_para(IPara,:) = 1;

idx_kur = zeros(668, 1);
idx_kur(IKur,:) = 1;

% comparando los idx
idx_totales = zeros(668, 1);
c_0 = 0;
c_1 = 0;
c_2 = 0;
c_3 = 0;
for i=1:668
    idx_totales(i,1) = idx_habitual(i,1) + idx_para(i,1) + idx_kur(i,1);
    if idx_totales(i,1) == 0
        c_0 = c_0 + 1;
    end
    if idx_totales(i,1) == 1
        c_1 = c_1 + 1;
    end
    if idx_totales(i,1) == 2
        c_2 = c_2 + 1;
    end
    if idx_totales(i,1) == 3
        c_3 = c_3 + 1;
    end
end
c_0
c_1
c_2
c_3 
subplot(4,1,4)
scatter(date, idx_totales)
