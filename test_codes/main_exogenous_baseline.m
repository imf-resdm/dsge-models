%%% DSA Model

%%% Oct 24, 2012

% Baseline with only Concessional Borrowing. Presentation London

clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 1. CALIBRATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global beta beta_t delta_x delta_n delta_z alpha_k alpha_z tau psi_x psi_n xi_n xi_x omega alpha_x alpha_n g epsilon gama_n gama_x gama_m eta rho_x rho_m R_zo yo phi ho r_do rstar share_bstar share_b share_d fo s inc share_dc m r_dco incdc incb inciz lambda s_s a_ratio izy nxpsi share_remit  share_grants remito grantso zeo To sigma_x sigma_n nu etag nug;

%%%% EXPLICIT PARAMETERS


ro = 0.1;
g = 0.015;
tau = 0.34;
a_ratio = 1.5;
delta_x = 0.05;
delta_n = 0.05;
delta_z = 0.05;
alpha_k = 0.50;
alpha_z = 0.50;
xi_x = 0;
xi_n = 0;
sigma_x = 0;
sigma_n = 0;
omega = 2;
alpha_x =0.40;
alpha_n =0.55;
epsilon = 0.5;%1.5;
gama_x = 0.20;
gama_m = 0.37;
eta = 0.1;
etag = 0.0; % zero (the interest rate on public commercial debt is not affected by the total debt level) or one
R_zo = 0.30;
yo = 100;
phi = 0; 
ho = 0.15;
r_do = 0.0;
rstar = 0.04;
share_bstar = 0;
share_b = 0.2;
share_d = 0.5;
share_dc = 0;
share_remit = 0.04; %0;
share_grants = 0.05; %0;
m=1;
fo = 0.5;
s = 0.6;
s_s= 0.6;
r_dco = 0.06;%0.065;
lambda = 0;
lambda1 = 0.25;%.217;
lambda2 = 0.02;%0.02;%.02;
lambda3 = .25;
lambda4 = 0.02;%0.04;%.04;
nxpsi = 1;
izy = 0.06;



%%%%% IMPLICIT PARAMETERS AND SOME INITIAL VALUES
beta = ((1+g)^(1/tau))/(1+ro);

beta_t  = (beta*(1+g)^(1-1/tau));
gama_n = 1-gama_x-gama_m;
rho_x = gama_x;
rho_m = gama_m;
bo = share_b*yo;
bstaro = share_bstar*yo;
d_o = share_d*yo;
dco = share_dc*yo;
P_no = 1;
P_xo = 1;
P_mo = 1;
P_mmo = 1;
Po = 1;
wo = 1;
P_ko = 1/(1-alpha_k);        
P_zo = 1/(1-alpha_z);          
a_k = alpha_k/(1-alpha_k);
a_z = alpha_z/(1-alpha_z);
ro = ((1+g)^(1/tau))/beta-1;
r_xo = P_ko*(ro+delta_x);
r_no = P_ko*(ro+delta_n);
miu = fo*P_zo*delta_z;
nu_x = 1/((delta_x+g)*omega);
nu_n = 1/((delta_n + g)*omega);
zo = izy*yo/(P_zo*(delta_z+g));
zeo = s_s*zo;
remito = share_remit*yo;
grantso = share_grants*yo;
dploto = d_o;
nug = r_dco-rstar;
nu = ro-r_dco;


%%% Solving for VA_n, eo, eho, To, and psi_x

xn0 = [0.5 77 80 8 0.5]'; 

%%% Use Broyden Method to Solve the System of Equations

x = broyden('calibration',xn0,gama_n,a_k,delta_x,g,alpha_x,r_xo,yo,delta_n,alpha_n,r_no,a_z,delta_z,P_ko,P_zo,d_o,r_do,m,dco,r_dco,bstaro,rstar,R_zo,zo,remito,grantso,wo,nxpsi,a_ratio,ho,bo,ro,miu,zeo,s_s,nu,nug); 

x = real(x);

[f, xcal] = calibration(x,gama_n,a_k,delta_x,g,alpha_x,r_xo,yo,delta_n,alpha_n,r_no,a_z,delta_z,P_ko,P_zo,d_o,r_do,m,dco,r_dco,bstaro,rstar,R_zo,zo,remito,grantso,wo,nxpsi,a_ratio,ho,bo,ro,miu,zeo,s_s,nu,nug);
                            
VA_n  = xcal(1);
eo    = xcal(2);
eho   = xcal(3);
To    = xcal(4);
psi_x = xcal(5);


%%%% Using VA_n, eo, eho, To, and psi_x to calculate the rest of parameters and initial
%%%% values

psi_n = nxpsi*psi_x;
q_no  = VA_n*yo;
q_xo  = (1-VA_n)*yo;
k_no  = (alpha_n/r_no)*q_no;
k_xo  = (alpha_x/r_xo)*q_xo;
L_no  = ((1-alpha_n)/wo)*q_no;
L_xo  = ((1-alpha_x)/wo)*q_xo;
Lo    = (L_no+L_xo)/(1+a_ratio);
Lho   = a_ratio*Lo;
a_n   = q_no/(zeo^psi_n*k_no^(xi_n+alpha_n)*L_no^(1-alpha_n)); % These initial values are not affected by the other externalities as they were defined relative to the initial steady state
a_x   = q_xo/(zeo^psi_x*k_xo^(xi_x+alpha_x)*L_xo^(1-alpha_x)); % These initial values are not affected by the other externalities as they were defined relative to the initial steady state
i_zo  = (delta_z+g)*zo;


%%% Save parameters and some initial variables of variables (do, bo, To, and zo)
%%% that are considered exogenous to the model


save dsa_params.mat beta beta_t delta_x delta_n delta_z alpha_k alpha_z tau psi_x psi_n xi_n xi_x omega alpha_x alpha_n g epsilon gama_n gama_x gama_m m eta rho_x rho_m R_zo yo phi ho r_do rstar share_bstar share_b share_d fo s a_k a_z miu nu_x nu_n VA_n ro To d_o bo zo P_zo Lho a_n a_x m r_dco dco lambda lambda1 lambda2 lambda3 lambda4 eo eho s_s a_ratio izy nxpsi share_remit  share_grants remito  grantso i_zo Lo zeo sigma_x sigma_n nu q_xo q_no bstaro etag nug;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 2. CALCULATION OF INITIAL STEADY STATE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


inc = 1;
incdc = 1;
incb = 1;
inciz = 0;
incgrants = 1;
incremit = 1;
P_x = P_xo;
P_mm = P_mmo;
P_m = P_mo;

%%%initial guess

x0 = [ bstaro eo+eho (1-rho_x-rho_m)*(eo+eho) eo eho ho (delta_n+g)*k_no (delta_x+g)*k_xo k_no k_xo L_no L_xo  Po P_ko P_no P_zo ro r_no r_xo To q_no q_xo wo yo zo zeo]';

%%% Use Broyden Method to Solve the System of Equations

x = broyden('steady_state',x0,beta_t,delta_x,delta_n,delta_z,tau,psi_x,psi_n,xi_n,xi_x,alpha_x,alpha_n,g,epsilon,eta,ho,r_do,rstar,s,rho_x,rho_m,a_k,a_z,miu,ro,To,d_o,bo,zo,P_zo,P_x,P_mm,P_m,a_n,a_x,inc,m,r_dco,incdc,dco,incb,inciz,lambda,eo,eho,s_s,a_ratio,remito,grantso,i_zo,Lo,incgrants,incremit,sigma_x,sigma_n,nu,bstaro,q_no,q_xo,yo,etag,nug);

x = real(x);

[f, xss] = steady_state(x,beta_t,delta_x,delta_n,delta_z,tau,psi_x,psi_n,xi_n,xi_x,alpha_x,alpha_n,g,epsilon,eta,ho,r_do,rstar,s,rho_x,rho_m,a_k,a_z,miu,ro,To,d_o,bo,zo,P_zo,P_x,P_mm,P_m,a_n,a_x,inc,m,r_dco,incdc,dco,incb,inciz,lambda,eo,eho,s_s,a_ratio,remito,grantso,i_zo,Lo,incgrants,incremit,sigma_x,sigma_n,nu,bstaro,q_no,q_xo,yo,etag,nug);

bstar_ini = xss(1);
c_ini     = xss(2);
c_n_ini   = xss(3);
e_ini     = xss(4);
eh_ini    = xss(5);
h_ini     = xss(6);
i_n_ini   = xss(7);
i_x_ini   = xss(8);
k_n_ini   = xss(9);
k_x_ini   = xss(10);
L_n_ini   = xss(11);
L_x_ini   = xss(12);
P_ini     = xss(13);
P_k_ini   = xss(14);
P_n_ini   = xss(15);
P_z_ini   = xss(16);
r_ini     = xss(17);
r_n_ini   = xss(18);
r_x_ini   = xss(19);
T_ini     = xss(20);
q_n_ini   = xss(21);
q_x_ini   = xss(22);
w_ini     = xss(23);
y_ini     = xss(24);
z_ini     = xss(25);
ze_ini    = xss(26);

R_z_ini  = (psi_x*P_x*q_x_ini+psi_n*P_n_ini*q_n_ini)/(P_z_ini*ze_ini);
i_z_ini = (delta_z+g)*z_ini;
b_ini   = bo;
d_ini   = d_o;
dc_ini  = dco;

save steady_state_values.mat b_ini d_ini dc_ini bstar_ini c_ini e_ini eh_ini h_ini i_n_ini i_x_ini i_z_ini k_n_ini k_x_ini L_n_ini L_x_ini P_ini P_k_ini P_n_ini P_z_ini r_ini r_n_ini r_x_ini R_z_ini q_n_ini q_x_ini w_ini z_ini T_ini ze_ini

%xini = [b_ini d_ini dc_ini bstar_ini c_ini e_ini eh_ini h_ini i_n_ini i_x_ini i_z_ini k_n_ini k_x_ini L_n_ini L_x_ini P_ini P_k_ini P_n_ini P_z_ini r_ini r_n_ini r_x_ini R_z_ini q_n_ini q_x_ini w_ini z_ini ze_ini]'; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 3. CALCULATION OF FINAL STEADY STATE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
inc = 1;
incdc = 1;
incb = 1;
inciz = 1.5;
incgrants = 1;
incremit = 1;
P_x = P_xo;
P_mm = P_mmo;
P_m = P_mo;


%%%initial guess

x0 = [ bstaro eo+eho (1-rho_x-rho_m)*(eo+eho) eo eho ho (delta_n+g)*k_no (delta_x+g)*k_xo k_no k_xo L_no L_xo  Po P_ko P_no P_zo ro r_no r_xo To q_no q_xo wo yo zo zeo]';

%%% Use Broyden Method to Solve the System of Equations

x = broyden('steady_state',x0,beta_t,delta_x,delta_n,delta_z,tau,psi_x,psi_n,xi_n,xi_x,alpha_x,alpha_n,g,epsilon,eta,ho,r_do,rstar,s,rho_x,rho_m,a_k,a_z,miu,ro,To,d_o,bo,zo,P_zo,P_x,P_mm,P_m,a_n,a_x,inc,m,r_dco,incdc,dco,incb,inciz,lambda,eo,eho,s_s,a_ratio,remito,grantso,i_zo,Lo,incgrants,incremit,sigma_x,sigma_n,nu,bstaro,q_no,q_xo,yo,etag,nug);

x = real(x);

[f, xss] = steady_state(x,beta_t,delta_x,delta_n,delta_z,tau,psi_x,psi_n,xi_n,xi_x,alpha_x,alpha_n,g,epsilon,eta,ho,r_do,rstar,s,rho_x,rho_m,a_k,a_z,miu,ro,To,d_o,bo,zo,P_zo,P_x,P_mm,P_m,a_n,a_x,inc,m,r_dco,incdc,dco,incb,inciz,lambda,eo,eho,s_s,a_ratio,remito,grantso,i_zo,Lo,incgrants,incremit,sigma_x,sigma_n,nu,bstaro,q_no,q_xo,yo,etag,nug);

bstar_fin = xss(1);
c_fin     = xss(2);
c_n_fin   = xss(3);
e_fin     = xss(4);
eh_fin    = xss(5);
h_fin     = xss(6);
i_n_fin   = xss(7);
i_x_fin   = xss(8);
k_n_fin   = xss(9);
k_x_fin   = xss(10);
L_n_fin   = xss(11);
L_x_fin   = xss(12);
P_fin     = xss(13);
P_k_fin   = xss(14);
P_n_fin   = xss(15);
P_z_fin   = xss(16);
r_fin     = xss(17);
r_n_fin   = xss(18);
r_x_fin   = xss(19);
T_fin     = xss(20);
q_n_fin   = xss(21);
q_x_fin   = xss(22);
w_fin     = xss(23);
y_fin     = xss(24);
z_fin     = xss(25);
ze_fin    = xss(26);

R_z_fin  = (psi_x*P_x*q_x_fin+psi_n*P_n_fin*q_n_fin)/(P_z_fin*ze_fin);
i_z_fin = (delta_z+g)*z_fin;
b_fin   = incb*bo;
d_fin   = inc*d_o;
dc_fin  = incdc*dco;
grants =incgrants*grantso;
remit =incremit*remito;


save steady_state_values_fin.mat b_fin d_fin dc_fin bstar_fin c_fin e_fin eh_fin h_fin i_n_fin i_x_fin i_z_fin k_n_fin k_x_fin L_n_fin L_x_fin P_fin P_k_fin P_n_fin P_z_fin r_fin r_n_fin r_x_fin R_z_fin q_n_fin q_x_fin w_fin z_fin T_fin ze_fin

xfin = [b_fin d_fin dc_fin bstar_fin c_fin e_fin eh_fin h_fin i_n_fin i_x_fin i_z_fin k_n_fin k_x_fin L_n_fin L_x_fin P_fin P_k_fin P_n_fin P_z_fin r_fin r_n_fin r_x_fin R_z_fin q_n_fin q_x_fin w_fin z_fin ze_fin]'; 



dynare DSA_Exogenous_Debt_fast_scaling_up.mod noclearall



t=1:1:1000;

blag  =[bo b(1:1001)']'; 
dclag = [dco dc(1:1001)']';
dlag = [ d_o d(1:1001)']';
rextlag = [rstar+nu rext(1:1001)']'; 
rextglag = [rstar+nug rextg(1:1001)']'; 
rlag =[ro r(1:1001)']';
bstarlag  =[bstaro bstar(1:1001)']'; 

cad = d-dlag+dc-dclag+bstar-bstarlag-(r_do-g).*dlag./(1+g)-(rextglag-g).*dclag./(1+g)-(rextlag-g).*bstarlag./(1+g)- eta/2.*(bstar-bstaro).^2;
pfd = p.*(b-blag)+d-dlag+dc-dclag-(r_do-g).*dlag./(1+g)-(rextglag-g).*dclag./(1+g)-(rlag-g).*p.*blag/(1+g);

publicriskpremium = rextg - rstar;

t=1:1:1000;

NN = 30;

%figure(1)
%subplot(3,3,1); plot(t(1:NN),100.*(pz(1:NN).*iz(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*(netbwconc(1:NN)+(grants(1:NN)-grantso))./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14);title({'Investment and Borrowing (% of GDP)'},'FontSize',16);grid on; legend('Public Investment', 'Concessional Loans','FontSize',14);xlim([1 NN]); ylim([-2 25]);

% figure(2)
% subplot(3,3,1); plot(t(1:NN),100.*(pz(1:NN).*iz(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*(netbwconc(1:NN)+(grants(1:NN)-grantso))./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14);title({'Investment and Borrowing (% of GDP)'},'FontSize',16);grid on; legend('Public Investment', 'Concessional Loans','FontSize',6);xlim([1 NN]);ylim([-2 25]);
% subplot(3,3,2); plot(t(1:NN),(z(1:NN)-zo).*100./zo,'b','LineWidth',2.5); title('Public Capital','FontSize',16); grid on;xlim([1 NN]);
% figure(3)
% subplot(3,3,1); plot(t(1:NN),100.*(pz(1:NN).*iz(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*(netbwconc(1:NN)+(grants(1:NN)-grantso))./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14);title({'Investment and Borrowing (% of GDP)'},'FontSize',16);grid on; legend('Public Investment', 'Concessional Loans','FontSize',6);xlim([1 NN]);ylim([-2 25]);
% subplot(3,3,2); plot(t(1:NN),(z(1:NN)-zo).*100./zo,'b','LineWidth',2.5); title('Public Capital','FontSize',16); grid on;xlim([1 NN]);
% subplot(3,3,3); plot(t(1:NN),(kx(1:NN)+kn(1:NN)-k_x_ini -k_n_ini).*100./(k_x_ini + k_n_ini),'b','LineWidth',2.5); title('Private Capital','FontSize',16); grid on;xlim([1 NN]);
% subplot(3,3,4); plot(t(1:NN),((w(1:NN)./p(1:NN))-1).*100,'b','LineWidth',2.5); title('Wages','FontSize',16);grid on;xlim([1 NN]);
% subplot(3,3,5); plot(t(1:NN),100.*growth(1:NN),'b','LineWidth',2.5); title('Real GDP Growth (%)','FontSize',16);grid on;xlim([1 NN]);
% subplot(3,3,6); plot(t(1:NN),100.*(p(1:NN).*b(1:NN)+ d(1:NN)+ dc(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*d(1:NN)./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14); hold on; title({'Public Debt (% of GDP)'},'FontSize',16);grid on;legend('Total', 'Concessional','FontSize',6);xlim([1 NN]);ylim([40 110]);
figure(2)
subplot(3,3,1); plot(t(1:NN),100.*(pz(1:NN).*iz(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*(netbwconc(1:NN)+(grants(1:NN)-grantso))./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14);title({'Investment and Borrowing (% of GDP)'},'FontSize',16);grid on; legend('Public Investment', 'Concessional Loans','FontSize',14);xlim([1 NN]);ylim([-2 25]);
subplot(3,3,2); plot(t(1:NN),(z(1:NN)-zo).*100./zo,'b','LineWidth',2.5); title('Public Capital','FontSize',16); grid on;xlim([1 NN]);
subplot(3,3,3); plot(t(1:NN),(kx(1:NN)+kn(1:NN)-k_x_ini -k_n_ini).*100./(k_x_ini + k_n_ini),'b','LineWidth',2.5); title('Private Capital','FontSize',16); grid on;xlim([1 NN]);
%subplot(3,3,4); plot(t(1:NN),((w(1:NN)./p(1:NN))-1).*100,'b','LineWidth',2.5); title('Wages','FontSize',16);grid on;xlim([1 NN]);
subplot(3,3,4); plot(t(1:NN),100.*growth(1:NN),'b','LineWidth',2.5); title('Real GDP Growth (%)','FontSize',16);grid on;xlim([1 NN]);
subplot(3,3,5); plot(t(1:NN),100.*(p(1:NN).*b(1:NN)+ d(1:NN)+ dc(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*d(1:NN)./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14); hold on; title({'Public Debt (% of GDP)'},'FontSize',16);grid on;legend('Total', 'Concesional','FontSize',14);xlim([1 NN]);ylim([40 110]);
subplot(3,3,6); plot(t(1:NN),100.*h(1:NN),'b','LineWidth',2.5); title('VAT Rate (%)','FontSize',16);grid on;xlim([1 NN]);ylim([15 20]);
figure(3)
subplot(3,3,1); plot(t(1:NN),100.*(pz(1:NN).*iz(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*(netbwconc(1:NN)+(grants(1:NN)-grantso))./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14);title({'Investment and Borrowing (% of GDP)'},'FontSize',16);grid on; legend('Public Investment', 'Concessional Loans','FontSize',14);xlim([1 NN]);ylim([-2 25]);
subplot(3,3,2); plot(t(1:NN),(z(1:NN)-zo).*100./zo,'b','LineWidth',2.5); title('Public Capital','FontSize',16); grid on;xlim([1 NN]);
subplot(3,3,3); plot(t(1:NN),(kx(1:NN)+kn(1:NN)-k_x_ini -k_n_ini).*100./(k_x_ini + k_n_ini),'b','LineWidth',2.5); title('Private Capital','FontSize',16); grid on;xlim([1 NN]);
%subplot(3,3,4); plot(t(1:NN),((w(1:NN)./p(1:NN))-1).*100,'b','LineWidth',2.5); title('Wages','FontSize',16);grid on;xlim([1 NN]);
subplot(3,3,4); plot(t(1:NN),100.*growth(1:NN),'b','LineWidth',2.5); title('Real GDP Growth (%)','FontSize',16);grid on;xlim([1 NN]);
subplot(3,3,5); plot(t(1:NN),100.*(p(1:NN).*b(1:NN)+ d(1:NN)+ dc(1:NN))./ynom(1:NN),'b','LineWidth',2.5); hold on; plot(t(1:NN),100.*d(1:NN)./ynom(1:NN),'r.-','LineWidth',1,'MarkerSize',14); hold on; title({'Public Debt (% of GDP)'},'FontSize',16);grid on;legend('Total', 'Concessional','FontSize',14);xlim([1 NN]);ylim([40 110]);
subplot(3,3,6); plot(t(1:NN),100.*h(1:NN),'b','LineWidth',2.5); title('VAT Rate (%)','FontSize',16);grid on;xlim([1 NN]);ylim([15 20]);
subplot(3,3,7); plot(t(1:NN),100*r(1:NN),'b','LineWidth',2.5); title('Interest Rate (%)','FontSize',16);grid on;xlim([1 NN]);

subplot(3,3,8); plot(t(1:NN),(((e(1:NN)+eh(1:NN))./p(1:NN)) - eo - eho).*100/(eo +eho),'b','LineWidth',2.5); title('Consumption','FontSize',16);grid on; xlim([1 NN]);ylim([-3 7]);
subplot(3,3,9); plot(t(1:NN),(ix(1:NN)+in(1:NN)-i_x_ini-i_n_ini).*100./(i_x_ini+i_n_ini),'b','LineWidth',2.5); title('Private Investment','FontSize',16);grid on;xlim([1 NN]);ylim([-4 12]);
