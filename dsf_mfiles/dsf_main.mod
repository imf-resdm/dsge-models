var      qx qn ynom growth_plot,
         kx kn,
         L_x L_n,
         ix in,
         rx rn w,
         pk pz pn p,
         h T,
         z ze iz Rz,
         GAP,
         bstar b dc d dplot netbwconc,
         e eh,
         r r_d rext rextg grants oilr tot totmm rer;
	 
varexo e_iz0 e_iz1 e_iz2
    e_d0 e_d1 e_d2
    e_dc0 e_dc1 e_dc2
    e_grants0 e_grants1 e_grants2
    e_oilr0 e_oilr1 e_oilr2
    e_hbar0 e_hbar1 e_hbar2
    e_Tbar0 e_Tbar1 e_Tbar2
    remit px pm pmm dc_target int_repayment0 int_repayment1;    

parameters  beta beta_t,
            delta_x delta_n delta_z,
            alpha_k alpha_z alpha_x alpha_n,
            a_k a_z a_n a_x,
            psi_x psi_n,
            xi_x xi_n,
            nu_x nu_n,
            sigma_x sigma_n,
            gama_n gama_x gama_m rho_x rho_m,
            tau omega g epsilon eta phi miu s s_s rstar nu etag nug a_ratio VA_n m,
            share_bstar share_b share_d,
            lambda lambda1 lambda2 lambda3 lambda4,
            Tbar hbar theta_hbar theta_Tbar,
            R_zo yo ho fo ro To d_o bo zo P_zo Lo r_dco dco eo eho grantso oilro remito zeo q_xo q_no bstaro;
         
load params.mat;          

for i=1:length(M_.params)
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end   

%% Model
model;
//%------------------------------------------------------------------------
//%              Helping variables 
//%------------------------------------------------------------------------
//%- Adjustment costs in changing the capital stock
#Robx =(nu_x/2)*kx(-1)*((ix/kx(-1)) - delta_x - g)^2; 
#Robn =(nu_n/2)*kn(-1)*((in/kn(-1)) - delta_n - g)^2;

//%- Analogue of (1-rho_x-rho_m)*(pn/p)^(-epsilon)  
#compn = (1-rho_x-rho_m)*pn^(-epsilon)/(rho_m*pm^(1-epsilon)+rho_x*px^(1-epsilon)+(1-rho_x-rho_m)*pn^(1-epsilon));

//%- |Jimz| - enters the equality: Jimz*iz = I_z = H*(iz-izo)+izo; 
//%- |phi| - determines the severity of the absorptive capacity constraint in the public sector;
//'#Jimz =(1+iz/z(-1) - delta_z - g)^phi; 
/*
%- The specification below is best.  It says that the absorptive capacity constraint
%- only affects the cost of new, additional investment. Dividing by iz at the end
%- cancels out the iz that multiplies Jimz elsewhere in the model.
*/
#Jimz =(((1+iz/z(-1) - delta_z - g)^phi)*(iz - (delta_z+g)*zo) + (delta_z+g)*zo)/iz; 

//%------------------------------------------------------------------------
//%            Actual equations 
//%------------------------------------------------------------------------
//%- Cobb-Douglas technologies of the firms in each sector
qx = a_x*(qx/q_xo)^sigma_x*(ze(-1)^psi_x)*(kx(-1)^(xi_x + alpha_x))*(L_x^(1 - alpha_x));
qn = a_n*(qn/q_no)^sigma_n*(ze(-1)^psi_n)*(kn(-1)^(xi_n + alpha_n))*(L_n^(1 - alpha_n));

//%- Supply prices of pvt and public capital
pk = pmm + a_k*pn;
pz = pmm + a_z*pn;

//%- CPI (relative) associated with CES consumption basket
p = (rho_m*pm^(1-epsilon) + rho_x*px^(1-epsilon) + (1-rho_m-rho_x)*pn^(1-epsilon))^(1/(1-epsilon));

//%- First-order conditions of the consumers' maximization problem
((e(+1)/p(+1))/(e/p))^(1/tau) = beta_t*(1+h)*(1+r)/((1+h(+1))*(1+g));
(1+r)*(p(+1)/p)*(pk/pk(+1))*(1 + nu_x*((ix/kx(-1))-delta_x-g)) = (rx(+1)/pk(+1)) + (1-delta_x) + nu_x*((ix(+1)/kx)-delta_x-g)*((ix(+1)/kx)+1-delta_x) - (nu_x/2)*(((ix(+1)/kx)-delta_x-g)^2);
(1+r)*(p(+1)/p)*(pk/pk(+1))*(1 + nu_n*((in/kn(-1))-delta_n-g)) = (rn(+1)/pk(+1)) + (1-delta_n) + nu_n*((in(+1)/kn)-delta_n-g)*((in(+1)/kn)+1-delta_n) - (nu_n/2)*(((in(+1)/kn)-delta_n-g)^2);
1+rext=(1-eta*(bstar-bstaro))*(1+r)*p(+1)/p;

//%- Law of motion of pvt capital in each sector
(1+g)*kx = ix + (1-delta_x)*kx(-1);
(1+g)*kn = in + (1-delta_n)*kn(-1);

//%- Law of motion of public capital
(1+g)*z = iz + (1-delta_z)*z(-1);
ze = s_s*zo + s*(z-zo);

//%- Marginal product of capital and labor in each sector (i.e. T and NT); wage is equal across the sectors;
pn*(1-alpha_n)*qn/L_n = w;
px*(1-alpha_x)*qx/L_x = w;
pn*alpha_n*qn/kn(-1) = rn;
px*alpha_x*qx/kx(-1) = rx;

//%- Market clearing conditions
qn = compn*(e+eh) + a_k*(ix+in+Robx+Robn) + a_z*Jimz*iz;
L_x + L_n = (1+a_ratio)*Lo;

//%- Market clearing: acounting identity - growth in the country's net foreign debt equals the national spending less national income
d + m*dc + bstar = (e+eh) + pk*(ix+in+Robx+Robn) + pz*Jimz*iz + (1+r_d)*d(-1)/(1+g)+ (1+rextg(-1))*m*dc(-1)/(1+g) + (1+rext(-1))*bstar(-1)/(1+g) + (eta/2)*(bstar-bstaro)^2 - (pn*qn) - (px*qx) - (grants+oilr) - remit;

//%- Non-savers' budget constraint
eh = (a_ratio*w*Lo+(a_ratio/(1+a_ratio))*(T+remit))/(1+h);

//%- Gross return on infrastructure (note, pn*qn=VA_n)
Rz = (psi_n*pn*qn+psi_x*px*qx)/(pz*ze(-1));

//%- RIRs
//%- |rextg| - in paper named |r_dc|
//%- |rstar| - in paper named |r_f|
//%- |rext|  - in paper named |r*|
//%- |nu|    - public debt risk premium
rextg = rstar+nug*exp(etag*(d/ynom+m*dc/ynom-d_o/yo-m*dco/yo));
rext = rextg+nu;

//%- Nominal GDP
ynom = pn*qn + px*qx;
growth_plot = (qn-qn(-1))/qn(-1) + (qx-qx(-1))/qx(-1) + g; % growth_plot is created just to plot the path of actual GDP growth

//%------------------------------------------------------------------------
//%         Fiscal GAP and adjustment via transfers (T) and taxes (h) 
//%------------------------------------------------------------------------
//%- Note: e+eh = p*c (sum of expenditures of savers(e) & non-savers(eh) equals overall value of consumption)
#DD = ((1+r_d)*d(-1)/(1+g) - d) + ((1+rextg(-1))*m*dc(-1)/(1+g) - m*dc) + ((1+r(-1))*p*b(-1)/(1+g) - p*b) + (pz*Jimz*iz) + To - ho*(e+eh) - (grants+oilr) - miu*ze(-1);
#DDo = (r_d-g)*d_o/(1+g) + (rstar+nug-g)*m*dco/(1+g) + (ro-g)*bo/(1+g) + P_zo*(delta_z+g)*zo + To - ho*(eo+eho) - (grantso+oilro) - miu*zeo;

//%- Defining the targets (h_target and T_target)
#h_target = ho + (1-lambda)*GAP/(e+eh);
#T_target = To - lambda*GAP;
#T1 = T(-1) + lambda3*(T_target-T(-1)) - lambda4*(dc(-1)-dc_target);
#h1 = h(-1) + lambda1*(h_target-h(-1)) + lambda2*(dc(-1)-dc_target)/(pn*qn + px*qx);

//%- Fiscal gap
@#if exogenous
   //%- I. For concessional debt only
   GAP = DD - DDo;
@#else
   //%- II. For endogenous borrowing only
   (h-ho)*(e+eh) - (T-To) = DD;
   GAP = (m*dc-m*dc(-1)) + (p*b-p*b(-1)) + (h-ho)*(e+eh) - (T-To);
@#endif

//%------------ Different specifications of taxes and transfers -----------
//%- (0) Transfers and taxes at the target level
@#if exogenous
   T = T_target;
   h = h_target;
@#endif

//%- (1) Exogenous path for taxes (hbar_staggered) and/or ceiling for taxes (h_capped). 
#hbar_staggered = ho + e_hbar0 + e_hbar1 + e_hbar2;
#h_capped = min(h1,hbar);
@#if endogenous_commercial || endogenous_domestic
   h = theta_hbar*h_capped + (1-theta_hbar)*hbar_staggered;
@#endif

//%- (2) Assume that public sector wages equal 5% of initial GDP.
//'T = max(T_target, To + 1*5*(w-1));

//%- (3) Places a floor on how much transfers can fall as a pct of initial GDP (This works only in combination with (1).  The other way of specifying a floor on T does not work in combination with the ceiling for h)
//'T = max(T1,Tbar);  

//%- (4) Exogenous path for transfers (Tbar_staggered) and/or floor for transfers (T_capped).
#Tbar_staggered = To + e_Tbar0 + e_Tbar1 + e_Tbar2;
#T_capped = max(T1,Tbar);
@#if endogenous_commercial || endogenous_domestic
   T = theta_Tbar*T_capped + (1-theta_Tbar)*Tbar_staggered;
@#endif

//%- (5) Other specifications
//'T = max(T_target, To*p/p(-1));

//%------------------------------------------------------------------------
//%         Creating exogenous profiles 
//%------------------------------------------------------------------------
//%- Exogenous domestic borrowing
@#if exogenous
   b = bo;
@#endif
@#if endogenous_commercial
   b = bo;
   //'#uaz_b = p/1*yo/ynom;
   //'b = bo*g/(1+g) - shockneg0_b/uaz_b + shock0_b/uaz_b + shock1_b/uaz_b + b(-1)/(1+g);
@#endif

//%- Exogenous concessional borrowing
#uazuaz = yo/ynom;
d = d_o*g/(1+g) + d(-1)/(1+g) + e_d0/uazuaz + e_d1/uazuaz + e_d2/uazuaz;
netbwconc = e_d0 + e_d1 + e_d2;
dplot = e_d0 + e_d1 + e_d2 + dplot(-1); 

//%- Exogenous commercial borrowing
@#if exogenous
   dc = e_dc0/uazuaz + e_dc1/uazuaz + e_dc2/uazuaz + dc(-1)/(1+g);
@#endif
@#if endogenous_domestic
   dc = dco;
@#endif

//%- Exogenous public investment
#uaz = pz/P_zo*yo/ynom;
iz*uaz = (delta_z+g)*zo + e_iz0 + e_iz1 + e_iz2;

//%- Exogenous grants and oil revenues
grants*uazuaz = grantso + e_grants0 + e_grants1 + e_grants2;
oilr*uazuaz = oilro + e_oilr0 + e_oilr1 + e_oilr2;

//%------------------------------------------------------------------------
//%         Defining some additional variables 
//%------------------------------------------------------------------------
//%- Interest repayment on concessional debt
#foo = d(-1)/(1+g);
#int_repayment = int_repayment0 + int_repayment1;
r_d*foo = int_repayment/uazuaz;

//%- Real exchange rate
rer = pn/px;

//%- Terms of trade
tot = px/pm;
totmm = px/pmm;

end;

%% Initial values
load steady_state_values.mat;

options_.maxit = itermax;

initval;

T = T_ini;
qx = q_x_ini;
qn = q_n_ini; 
kx = k_x_ini; 
kn = k_n_ini; 
L_x = L_x_ini;
L_n = L_n_ini; 
z = z_ini;
ze = ze_ini; 
pk = P_k_ini; 
pz = P_z_ini; 
e = e_ini; 
eh = eh_ini;
w = w_ini;
pn = P_n_ini; 
p = P_ini; 
ix = i_x_ini; 
in = i_n_ini; 
h = h_ini; 
rx = r_x_ini; 
rn = r_n_ini; 
iz = i_z_ini; 
r = r_ini; 
bstar = bstar_ini;  
Rz = R_z_ini;
b = bo;
d = d_o;
dc = dco;
dplot = d_o;
//'Include the line below if you add exogenous domestic borrowing to this scenario.
//'shock0_b = bo*g/(1+g);
e_dc0=dco*g/(1+g);
remit=remito;
grants=grantso;
oilr = oilro;
ynom = yo;
growth_plot = g;
netbwconc = 0;
rextg =rstar+nug;
rext = rextg+nu;
px=1;
pm=1;
pmm=1;
rer = P_n_ini/px;
tot = px/pm;
totmm = px/pmm;
r_d=0;
GAP=0;
dc_target = dco;

end;

%steady(solve_algo=5);

steady;

resid(1)

check;
%------------------------
