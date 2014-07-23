# explicit parameters
beta = 0.99;
rho = 0.9;
torn = 1;
v = 1;
phi = 0.83;
rhom = 0.5;
nstar = 0.2;

# implicit parameters
istar = 1/beta-1;

save nk_params.mat beta rho torn v phi psi rhom nstar istar;
