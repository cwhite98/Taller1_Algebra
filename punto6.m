data = randn(1000,2);
mediaX = mean(data);

% d(Xi,Xj) = [(Xi-Xj)^T M^-1 (Xi-Xj)]^1/2
 
SHabitual = cov(data);
dHabitual = (data-mediaX) * inv(SHabitual) * (data-mediaX)';
dHabitual = diag(dHabitual).^(1/2)


SCov1 = cov1para(data);
dCov1 = (data-mediaX) * inv(SCov1) *(data-mediaX)';
dCov1 = diag(dCov1).^(1/2)
 

[idx,dm,mm,Ss,wval0,ndir]= kur_main(data);
dKur = (data - mm) * inv(Ss) *(data - mm)';
dKur = diag(dKur).^(1/2)


%%%% Validación %%%%

condHabitual = cond(SHabitual);
cond1para = cond(SCov1);
condKur = cond(Ss);

detHabitual = det(SHabitual);
det1para = det(SCov1);
detKur = det(Ss);