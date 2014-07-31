var qx qn kx kn lx L_n ix in w rx rn  pk pz pn p h z bstar Rz b d r e eh T ze dc iz dplot ynom netbwconc rext grants rextg tot totmm rer miu2 growth;


varexo iz_shock iz_shocka borrowd borrowdneg borrowdnega borrowdc borrowdcneg borrowda borrowdca grants_shock remit f_shock1 f_shock2  px pm pmm;

parameters beta beta_t delta_x delta_n delta_z alpha_k alpha_z tau psi_x psi_n xi_n xi_x omega alpha_x alpha_n g epsilon gama_n gama_x gama_m eta rho_x rho_m R_zo yo phi ho r_do rstar share_bstar share_b share_d fo miu s a_k a_z nu_x nu_n VA_n ro To do bo zo P_zo Lo a_n a_x m r_dco dco lambda lambda1 lambda2 lambda3 lambda4 eo eho s_s grantso remito a_ratio zeo  sigma_x sigma_n nu q_xo q_no bstaro etag nug;

load dsa_params.mat;          

for i=1:length(M_.params)
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end   



model;


#Robx =(nu_x/2)*kx(-1)*((ix/kx(-1)) - delta_x - g)^2; 

#Robn =(nu_n/2)*kn(-1)*((in/kn(-1)) - delta_n - g)^2; 

#compn = (1-rho_x-rho_m)*pn^(-epsilon)/(rho_m*pm^(1-epsilon)+rho_x*px^(1-epsilon)+(1-rho_x-rho_m)*pn^(1-epsilon));

//#Jimz =(1+iz/z(-1) - delta_z - g)^phi; 

/*
  The specification below is best.  It says that the absorptive capacity constraint
only affects the cost of new, additional investment. Dividing by iz at the end
cancels out the iz that multiplies Jimz elsewhere in the model.
*/
#Jimz =(((1+iz/z(-1) - delta_z - g)^phi)*(iz - (delta_z + g)*zo) + (delta_z + g)*zo)/iz; 

#DDo= (r_do-g)*do/(1+g) + (ro-g)*bo/(1+g)+ (rstar+nug-g)*m*dco/(1+g) + P_zo*(delta_z+g)*zo-miu*zeo-grantso;

qx = a_x*(qx/q_xo)^sigma_x*(ze(-1)^psi_x)*(kx(-1)^(xi_x + alpha_x))*(lx^(1 - alpha_x));

qn = a_n*(qn/q_no)^sigma_n*(ze(-1)^psi_n)*(kn(-1)^(xi_n + alpha_n))*(L_n^(1 - alpha_n));

pk = pmm + a_k*pn;

pz = pmm + a_z*pn;

p = (rho_m*pm^(1-epsilon)+rho_x*px^(1-epsilon) + (1-rho_m-rho_x)*(pn^(1 - epsilon)))^(1/(1 - epsilon));

((e(+1)/p(+1))/(e/p))^(1/tau) = beta_t*(1+h)*(1+r)/((1+h(+1))*(1+g));

(1 + r)*(p(+1)/p)*(pk/pk(+1))*(1 + nu_x*((ix/kx(-1)) - delta_x - g)) = (rx(+1)/pk(+1))+ (1 - delta_x) + nu_x*((ix(+1)/kx) - delta_x - g)*((ix(+1)/kx) + 1 - delta_x)-(nu_x/2)*(((ix(+1)/kx) - delta_x - g)^2);

(1 + r)*(p(+1)/p)*(pk/pk(+1))*(1 + nu_n*((in/kn(-1)) - delta_n - g)) = (rn(+1)/pk(+1))+ (1 - delta_n) + nu_n*((in(+1)/kn) - delta_n - g)*((in(+1)/kn) + 1 - delta_n)-(nu_n/2)*(((in(+1)/kn) - delta_n - g)^2);


1+rext=(1-eta*(bstar-bstaro))*(1+r)*p(+1)/p;

(1 + g)*kx = ix + (1 - delta_x)*kx(-1);

(1 + g)*kn = in + (1 - delta_n)*kn(-1);

pn*(1 - alpha_n)*qn/L_n = w;

px*(1 - alpha_x)*qx/lx = w;

pn*alpha_n*qn/kn(-1) = rn;

px*alpha_x*qx/kx(-1) = rx;

compn*(e+eh) + a_k *(ix+in+Robx+Robn)+a_z*Jimz*iz = qn;

lx + L_n = (1+a_ratio)*Lo;

eh = (a_ratio*w*Lo+(a_ratio/(1+a_ratio))*(T+remit))/(1+h);

b = bo;

miu2 = miu + (f_shock1 + f_shock2)*P_zo*delta_z;

//#T1 = To -lambda*(pz*Jimz*iz + (1+rextg(-1))*dc(-1)/(1+g)+(1+r_do)*d(-1)/(1+g) + (1 + r(-1))*p*b(-1)/(1+g)- dc - d - p*b -ho*(e+eh-eo-eho) - miu2*ze(-1)-grants-DDo);

#gap = pz*Jimz*iz + To + (rextg(-1)-g)*dc(-1)/(1+g)+(1+r_do)*d(-1)/(1+g) + (r(-1)-g)*p*b(-1)/(1+g) - d - ho*(e+eh) - miu2*ze(-1)-grants;

#T1 = To - lambda*gap;

//Specification below assumes that public sector wages equal 5% of initial GDP.
//T = max(T1, To + 1*5*(w-1));

//T = max(T1, To);

//T = max(T1, To*p/p(-1));

T = To - lambda*gap;

//T = To -lambda*(pz*Jimz*iz + (1+rextg(-1))*dc(-1)/(1+g)+(1+r_do)*d(-1)/(1+g) + (1 + r(-1))*p*b(-1)/(1+g)- dc - d - p*b -ho*(e+eh-eo-eho) - miu2*ze(-1)-grants-DDo);

//h*(e+eh)-ho*(eo+eho)=(pz*Jimz*iz + (1+rextg(-1))*dc(-1)/(1+g)+(1+r_do)*d(-1)/(1+g) + (1+r(-1))*p*b(-1)/(1+g) - dc - d - p*b + T - To - miu2*ze(-1)-grants-DDo);

//Use the specification below only when T is not constrained.

h = ho + (1 - lambda)*gap/(e + eh);

(1 + g)*z = iz + (1 - delta_z)*z(-1);

d + m*dc + bstar= e +eh + pk*(ix + in + Robx + Robn)+ pz*Jimz*iz + (1+r_do)*d(-1)/(1+g)+ m*(1+rextg(-1))*dc(-1)/(1+g) + (1+rext(-1))*bstar(-1)/(1+g)+(eta/2)*(bstar-bstaro)^2- (pn*qn) - px*qx-grants-remit;

Rz = (psi_n*pn*qn+psi_x*px*qx)/(pz*ze(-1));


ze = s_s*zo + s*(z - zo);


d = do*g/(1+g) + borrowd + borrowda - borrowdneg - borrowdnega + d(-1)/(1+g);

//dplot is created just to plot the path of actual d, not d deflated by trend growth.

dplot = borrowd + borrowda - borrowdneg - borrowdnega + dplot(-1);

dc = dco*g/(1+g) +borrowdc + borrowdca + borrowdcneg + dc(-1)/(1+g);


netbwconc = borrowd + borrowda - borrowdneg - borrowdnega;

iz=(delta_z+g)*zo+iz_shock + iz_shocka;

ynom = pn*qn + px*qx;

rextg = rstar+nug*exp(etag*(d/ynom+m*dc/ynom-do/yo-m*dco/yo));

rext = rextg+nu;

grants=grantso+grants_shock;

rer = pn/px;

tot = px/pm;

totmm = px/pmm;

growth = (qn/qn(-1)-1)+(qx/qx(-1)-1)+g;

end;

load steady_state_values.mat;


initval;
T = T_ini;
qx = q_x_ini;
qn = q_n_ini; 
kx = k_x_ini; 
kn = k_n_ini; 
lx = L_x_ini;
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
d = do;
dc = dco;
dplot = do;
//Include the line below if you add exogenous domestic borrowing to this scenario.
//borrowb = bo*g/(1+g);
//borrowdc=dco*g/(1+g);
//borrowd=do*g/(1+g);
remit=remito;
grants=grantso;
ynom = yo;
netbwconc = 0;
rextg =rstar+nug;
rext = rextg+nu;
px=1;
pm=1;
pmm=1;
rer = P_n_ini/px;
tot = px/pm;
totmm = px/pmm;
miu2 = miu;
growth = g;
end;

%steady(solve_algo=5);

steady;

resid(1)

check;

shocks;

var iz_shocka;
periods 1 2  3  4  5  6 7 8; 
values  2.5 3.5 3.5 3.3 2.9 2.5 2.2 2 ;
//values  3 4 4 3.8 3.4 2.7 2.5 2.2 ;
//values  3.6 5 4.5 4 3.5 3 2.5 2.2 2 2 ;


var iz_shock;
periods 9:1000;
values 1.5;


var grants_shock;
periods 1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;
values 0.4	0.4	0.4	0.4	0.4	0.4	0.4	0.4	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2;
//values 1.2	1.26	1	0.8	0.6	0.4	0.4	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1	0.1;


var borrowd;
periods  1 2 3 4 5 6 7 8;
values  4	5	4	3	2	 1	0.75 0.5;

//values 4	5	4	3	2	 1	0.75 0.5;

//periods 1 2 3 4 5 6 7 8 9 10 11 12 13;
//values  6 6.3 5 4 3 2 1 0.5 0 0 0 0 0;


var borrowdneg;
periods 1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;
values 0	0	0	0	0	0	0	0 1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	1.0125	0	0	0;

 

var remit;
periods 1:1000;
values remito;

/*
var f_shock1;
periods 1	2	3	4	5	6	7	8	9	10;
values .05 .10 .15 .20 .25 .30 .35 .40 .45 .50;

var f_shock2;
periods 11:1000;
values .5;
*/

/*
var f_shock1;
periods 1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20;
values 0.025	0.05	0.075	0.1	0.125	0.15	0.175	0.2	0.225	0.25	0.275	0.3	0.325	0.35	0.375	0.4	0.425	0.45	0.475 0.5;

var f_shock2;
periods 21:1000;
values .5;
*/



var px;
periods 1:1000;
values 1;

var pm;
periods 1:1000;
values 1;


end;

simul(periods = 1000);