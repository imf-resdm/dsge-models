var n w mc int r dm m a pi y;

varexo e_e0 e_e1 e_e2 
       e_em0 e_em1 e_em2;

parameters beta rho torn v phi rhom nstar istar;
load params.mat;
for ii=1:length(M_.params)
    param_name = M_.param_names(ii, :);
    eval(['M_.params(ii)=' param_name ';']);
end

model(linear);
pi = ((1-phi)*(1-phi*beta)/phi)*mc + beta*pi(+1);
w = mc + a;
(torn*nstar/(1-nstar))*n = -y + w;
y(+1) = y + r;
-v*m = -y + (1/istar - 1/(1+istar))*int;
dm + pi = rhom*dm(-1) + rhom*pi(-1) + e_em0 + e_em1 + e_em2;
dm = m - m(-1);
r = int - pi(+1);
y = a + n;
a = rho*a(-1) + e_e0 + e_e1 + e_e2;
end;

initval;
n = 0;
y = 0;
a = 0;
dm = 0;
m =0;
r = 0;
int = 0;
pi = 0;
w = 0;
mc = 0;
end;

@#include "shocks.mod"

steady;

simul(periods=1000);