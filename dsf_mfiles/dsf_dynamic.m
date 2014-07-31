function [residual, g1, g2, g3] = dsf_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(38, 1);
ACx__ = y(7)*params(42)/2*(y(27)/y(7)-params(17)-params(25))^2;
ACn__ = y(6)*params(41)/2*(y(26)/y(6)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(28)/y(13)-params(18)-params(25))^params(47)*(y(28)-params(76)*(params(25)+params(18))))/y(28);
compn__ = (1-params(56)-params(55))*y(37)^(-params(21))/(params(55)*x(it_, 27)^(1-params(21))+params(56)*x(it_, 26)^(1-params(21))+y(37)^(1-params(21))*(1-params(56)-params(55)));
DD__ = y(28)*y(38)*abcap__+(1+y(42))*y(3)/(1+params(25))-y(17)+params(38)*(1+y(12))*y(4)/(1+params(25))-params(38)*y(18)+y(35)*(1+y(10))*y(1)/(1+params(25))-y(35)*y(15)+params(70)-(y(20)+y(21))*params(31)-(y(23)+y(34))-y(14)*params(39);
DDo__ = params(70)+params(14)*(y(42)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(22)*(1-params(32))/(y(20)+y(21));
T_target__ = params(70)-y(22)*params(32);
uazuaz__ = params(74)/y(50);
uaz_b__ = y(35)*params(74)/y(50);
uaz__ = params(74)*y(38)/params(46)/y(50);
int_repayment__ = x(it_, 30)+x(it_, 31);
T14 = params(4)*(y(40)/params(51))^params(65);
T18 = T14*y(14)^params(49);
T23 = y(7)^(params(73)+params(8));
T27 = y(32)^(1-params(8));
T36 = params(2)*(y(39)/params(50))^params(64);
T39 = T36*y(14)^params(48);
T44 = y(6)^(params(72)+params(7));
T48 = y(31)^(1-params(7));
T74 = params(55)*x(it_, 27)^(1-params(21))+params(56)*x(it_, 26)^(1-params(21));
T79 = T74+(1-params(55)-params(56))*y(37)^(1-params(21));
T87 = y(20)/y(35);
T88 = y(53)/y(57)/T87;
T109 = y(36)/y(58);
T110 = (1+y(41))*y(57)/y(35)*T109;
T118 = 1+params(42)*(y(27)/y(7)-params(17)-params(25));
T129 = params(42)*(y(56)/y(30)-params(17)-params(25));
T134 = params(42)/2;
T146 = 1+params(41)*(y(26)/y(6)-params(16)-params(25));
T157 = params(41)*(y(55)/y(29)-params(16)-params(25));
T162 = params(41)/2;
T235 = (1+y(28)/y(13)-params(18)-params(25))^params(47);
T246 = (1-params(56)-params(55))*y(37)^(-params(21));
T248 = T74+y(37)^(1-params(21))*(1-params(56)-params(55));
T352 = exp(params(23)*(y(17)/y(50)+params(38)*y(18)/y(50)-params(14)/params(74)-params(38)*params(15)/params(74)));
T464 = y(3)/(1+params(25));
T588 = getPowerDeriv(T88,1/params(66),1);
T620 = 1+y(6)*T162*1/y(6)*2*(y(26)/y(6)-params(16)-params(25));
T641 = 1+y(7)*T134*1/y(7)*2*(y(27)/y(7)-params(17)-params(25));
T657 = getPowerDeriv(1+y(28)/y(13)-params(18)-params(25),params(47),1);
T664 = (y(28)*(T235+(y(28)-params(76)*(params(25)+params(18)))*1/y(13)*T657)-(params(76)*(params(25)+params(18))+T235*(y(28)-params(76)*(params(25)+params(18)))))/(y(28)*y(28));
T688 = T162*(y(26)/y(6)-params(16)-params(25))^2+y(6)*T162*2*(y(26)/y(6)-params(16)-params(25))*(-y(26))/(y(6)*y(6));
T719 = T134*(y(27)/y(7)-params(17)-params(25))^2+y(7)*T134*2*(y(27)/y(7)-params(17)-params(25))*(-y(27))/(y(7)*y(7));
T792 = (1+y(41))*y(57)/y(35)*1/y(58);
T799 = (1+y(41))*y(57)/y(35)*(-y(36))/(y(58)*y(58));
T812 = getPowerDeriv(T79,1/(1-params(21)),1);
T906 = (-(params(3)/(1+params(3))/(1+y(25))));
T921 = (-params(74))/(y(50)*y(50));
T936 = (-(y(35)*params(74)))/(y(50)*y(50));
T976 = (y(28)-params(76)*(params(25)+params(18)))*T657*(-y(28))/(y(13)*y(13))/y(28);
T1000 = (-(1/uazuaz__));
lhs =y(40);
rhs =T18*T23*T27;
residual(1)= lhs-rhs;
lhs =y(39);
rhs =T39*T44*T48;
residual(2)= lhs-rhs;
lhs =y(36);
rhs =x(it_, 28)+params(1)*y(37);
residual(3)= lhs-rhs;
lhs =y(38);
rhs =x(it_, 28)+y(37)*params(5);
residual(4)= lhs-rhs;
lhs =y(35);
rhs =T79^(1/(1-params(21)));
residual(5)= lhs-rhs;
lhs =T88^(1/params(66));
rhs =params(11)*(1+y(25))*(1+y(41))/((1+y(54))*(1+params(25)));
residual(6)= lhs-rhs;
lhs =T110*T118;
rhs =y(60)/y(58)+1-params(17)+T129*(1+y(56)/y(30)-params(17))-T134*(y(56)/y(30)-params(17)-params(25))^2;
residual(7)= lhs-rhs;
lhs =T110*T146;
rhs =y(59)/y(58)+1-params(16)+T157*(1+y(55)/y(29)-params(16))-T162*(y(55)/y(29)-params(16)-params(25))^2;
residual(8)= lhs-rhs;
lhs =1+y(43);
rhs =y(57)*(1+y(41))*(1-params(22)*(y(16)-params(13)))/y(35);
residual(9)= lhs-rhs;
lhs =(1+params(25))*y(30);
rhs =y(27)+y(7)*(1-params(17));
residual(10)= lhs-rhs;
lhs =(1+params(25))*y(29);
rhs =y(26)+y(6)*(1-params(16));
residual(11)= lhs-rhs;
lhs =(1+params(25))*y(51);
rhs =y(28)+(1-params(18))*y(13);
residual(12)= lhs-rhs;
lhs =y(52);
rhs =params(60)*params(76)+params(59)*(y(51)-params(76));
residual(13)= lhs-rhs;
lhs =y(39)*(1-params(7))*y(37)/y(31);
rhs =y(49);
residual(14)= lhs-rhs;
lhs =y(40)*(1-params(8))*x(it_, 26)/y(32);
rhs =y(49);
residual(15)= lhs-rhs;
lhs =y(39)*params(7)*y(37)/y(6);
rhs =y(45);
residual(16)= lhs-rhs;
lhs =y(40)*params(8)*x(it_, 26)/y(7);
rhs =y(46);
residual(17)= lhs-rhs;
lhs =y(39);
rhs =compn__*(y(20)+y(21))+params(1)*(y(27)+y(26)+ACx__+ACn__)+y(28)*params(5)*abcap__;
residual(18)= lhs-rhs;
lhs =y(32)+y(31);
rhs =(1+params(3))*params(37);
residual(19)= lhs-rhs;
lhs =y(16)+y(17)+params(38)*y(18);
rhs =y(20)+y(21)+y(36)*(y(27)+y(26)+ACx__+ACn__)+y(28)*y(38)*abcap__+(1+y(42))*y(3)/(1+params(25))+params(38)*(1+y(12))*y(4)/(1+params(25))+(1+y(11))*y(2)/(1+params(25))+params(22)/2*(y(16)-params(13))^2-y(39)*y(37)-y(40)*x(it_, 26)-(y(23)+y(34))-x(it_, 25);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =(params(37)*y(49)*params(3)+params(3)/(1+params(3))*(x(it_, 25)+y(48)))/(1+y(25));
residual(21)= lhs-rhs;
lhs =y(47);
rhs =(y(39)*params(48)*y(37)+y(40)*params(49)*x(it_, 26))/(y(14)*y(38));
residual(22)= lhs-rhs;
lhs =y(44);
rhs =params(58)+params(43)*T352;
residual(23)= lhs-rhs;
lhs =y(43);
rhs =y(44)+params(40);
residual(24)= lhs-rhs;
lhs =y(50);
rhs =y(39)*y(37)+y(40)*x(it_, 26);
residual(25)= lhs-rhs;
lhs =y(24);
rhs =params(25)+(y(39)-y(8))/y(8)+(y(40)-y(9))/y(9);
residual(26)= lhs-rhs;
lhs =y(22);
rhs =DD__-DDo__;
residual(27)= lhs-rhs;
lhs =y(48);
rhs =T_target__;
residual(28)= lhs-rhs;
lhs =y(25);
rhs =h_target__;
residual(29)= lhs-rhs;
lhs =y(17);
rhs =params(25)*params(14)/(1+params(25))+T464+x(it_, 4)/uazuaz__+x(it_, 5)/uazuaz__+x(it_, 6)/uazuaz__;
residual(30)= lhs-rhs;
lhs =y(33);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5);
residual(31)= lhs-rhs;
lhs =y(19);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5)+y(5);
residual(32)= lhs-rhs;
lhs =y(15);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(it_, 10)/uaz_b__+x(it_, 11)/uaz_b__+x(it_, 12)/uaz_b__;
residual(33)= lhs-rhs;
lhs =y(18);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(it_, 7)/uazuaz__+x(it_, 8)/uazuaz__+x(it_, 9)/uazuaz__;
residual(34)= lhs-rhs;
lhs =y(28)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(35)= lhs-rhs;
lhs =y(23)*uazuaz__;
rhs =params(29)+x(it_, 13)+x(it_, 14)+x(it_, 15);
residual(36)= lhs-rhs;
lhs =y(34)*uazuaz__;
rhs =params(44)+x(it_, 16)+x(it_, 17)+x(it_, 18);
residual(37)= lhs-rhs;
lhs =y(42)*y(3)/(1+params(25));
rhs =int_repayment__/uazuaz__;
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 91);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-(T27*T18*getPowerDeriv(y(7),params(73)+params(8),1)));
  g1(1,32)=(-(T18*T23*getPowerDeriv(y(32),1-params(8),1)));
  g1(1,40)=1-T27*T23*y(14)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(40)/params(51),params(65),1);
  g1(1,14)=(-(T27*T23*T14*getPowerDeriv(y(14),params(49),1)));
  g1(2,6)=(-(T48*T39*getPowerDeriv(y(6),params(72)+params(7),1)));
  g1(2,31)=(-(T39*T44*getPowerDeriv(y(31),1-params(7),1)));
  g1(2,39)=1-T48*T44*y(14)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(39)/params(50),params(64),1);
  g1(2,14)=(-(T48*T44*T36*getPowerDeriv(y(14),params(48),1)));
  g1(3,36)=1;
  g1(3,37)=(-params(1));
  g1(3,88)=(-1);
  g1(4,37)=(-params(5));
  g1(4,38)=1;
  g1(4,88)=(-1);
  g1(5,35)=1;
  g1(5,37)=(-((1-params(55)-params(56))*getPowerDeriv(y(37),1-params(21),1)*T812));
  g1(5,86)=(-(T812*params(56)*getPowerDeriv(x(it_, 26),1-params(21),1)));
  g1(5,87)=(-(T812*params(55)*getPowerDeriv(x(it_, 27),1-params(21),1)));
  g1(6,20)=(-(y(53)/y(57)*1/y(35)))/(T87*T87)*T588;
  g1(6,53)=T588*1/y(57)/T87;
  g1(6,25)=(-(params(11)*(1+y(41))/((1+y(54))*(1+params(25)))));
  g1(6,54)=(-((-(params(11)*(1+y(25))*(1+y(41))*(1+params(25))))/((1+y(54))*(1+params(25))*(1+y(54))*(1+params(25)))));
  g1(6,35)=T588*(-(y(53)/y(57)*(-y(20))/(y(35)*y(35))))/(T87*T87);
  g1(6,57)=T588*(-y(53))/(y(57)*y(57))/T87;
  g1(6,41)=(-(params(11)*(1+y(25))/((1+y(54))*(1+params(25)))));
  g1(7,27)=T110*params(42)*1/y(7);
  g1(7,56)=(-((1+y(56)/y(30)-params(17))*params(42)*1/y(30)+T129*1/y(30)-T134*1/y(30)*2*(y(56)/y(30)-params(17)-params(25))));
  g1(7,7)=T110*params(42)*(-y(27))/(y(7)*y(7));
  g1(7,30)=(-((1+y(56)/y(30)-params(17))*params(42)*(-y(56))/(y(30)*y(30))+T129*(-y(56))/(y(30)*y(30))-T134*2*(y(56)/y(30)-params(17)-params(25))*(-y(56))/(y(30)*y(30))));
  g1(7,35)=T118*T109*(1+y(41))*(-y(57))/(y(35)*y(35));
  g1(7,57)=T118*T109*(1+y(41))*1/y(35);
  g1(7,36)=T118*T792;
  g1(7,58)=T118*T799-(-y(60))/(y(58)*y(58));
  g1(7,41)=T118*y(57)/y(35)*T109;
  g1(7,60)=(-(1/y(58)));
  g1(8,26)=T110*params(41)*1/y(6);
  g1(8,55)=(-((1+y(55)/y(29)-params(16))*params(41)*1/y(29)+T157*1/y(29)-T162*1/y(29)*2*(y(55)/y(29)-params(16)-params(25))));
  g1(8,6)=T110*params(41)*(-y(26))/(y(6)*y(6));
  g1(8,29)=(-((1+y(55)/y(29)-params(16))*params(41)*(-y(55))/(y(29)*y(29))+T157*(-y(55))/(y(29)*y(29))-T162*2*(y(55)/y(29)-params(16)-params(25))*(-y(55))/(y(29)*y(29))));
  g1(8,35)=T146*T109*(1+y(41))*(-y(57))/(y(35)*y(35));
  g1(8,57)=T146*T109*(1+y(41))*1/y(35);
  g1(8,36)=T146*T792;
  g1(8,58)=T146*T799-(-y(59))/(y(58)*y(58));
  g1(8,41)=T146*y(57)/y(35)*T109;
  g1(8,59)=(-(1/y(58)));
  g1(9,16)=(-(y(57)*(1+y(41))*(-params(22))/y(35)));
  g1(9,35)=(-((-(y(57)*(1+y(41))*(1-params(22)*(y(16)-params(13)))))/(y(35)*y(35))));
  g1(9,57)=(-((1+y(41))*(1-params(22)*(y(16)-params(13)))/y(35)));
  g1(9,41)=(-(y(57)*(1-params(22)*(y(16)-params(13)))/y(35)));
  g1(9,43)=1;
  g1(10,27)=(-1);
  g1(10,7)=(-(1-params(17)));
  g1(10,30)=1+params(25);
  g1(11,26)=(-1);
  g1(11,6)=(-(1-params(16)));
  g1(11,29)=1+params(25);
  g1(12,28)=(-1);
  g1(12,13)=(-(1-params(18)));
  g1(12,51)=1+params(25);
  g1(13,51)=(-params(59));
  g1(13,52)=1;
  g1(14,31)=(-(y(39)*(1-params(7))*y(37)))/(y(31)*y(31));
  g1(14,37)=y(39)*(1-params(7))/y(31);
  g1(14,39)=(1-params(7))*y(37)/y(31);
  g1(14,49)=(-1);
  g1(15,32)=(-(y(40)*(1-params(8))*x(it_, 26)))/(y(32)*y(32));
  g1(15,40)=(1-params(8))*x(it_, 26)/y(32);
  g1(15,49)=(-1);
  g1(15,86)=y(40)*(1-params(8))/y(32);
  g1(16,6)=(-(y(39)*params(7)*y(37)))/(y(6)*y(6));
  g1(16,37)=y(39)*params(7)/y(6);
  g1(16,39)=params(7)*y(37)/y(6);
  g1(16,45)=(-1);
  g1(17,7)=(-(y(40)*params(8)*x(it_, 26)))/(y(7)*y(7));
  g1(17,40)=params(8)*x(it_, 26)/y(7);
  g1(17,46)=(-1);
  g1(17,86)=y(40)*params(8)/y(7);
  g1(18,20)=(-compn__);
  g1(18,21)=(-compn__);
  g1(18,26)=(-(params(1)*T620));
  g1(18,27)=(-(params(1)*T641));
  g1(18,28)=(-(params(5)*abcap__+y(28)*params(5)*T664));
  g1(18,6)=(-(params(1)*T688));
  g1(18,7)=(-(params(1)*T719));
  g1(18,37)=(-((y(20)+y(21))*(T248*(1-params(56)-params(55))*getPowerDeriv(y(37),(-params(21)),1)-T246*(1-params(56)-params(55))*getPowerDeriv(y(37),1-params(21),1))/(T248*T248)));
  g1(18,39)=1;
  g1(18,13)=(-(y(28)*params(5)*T976));
  g1(18,86)=(-((y(20)+y(21))*(-(T246*params(56)*getPowerDeriv(x(it_, 26),1-params(21),1)))/(T248*T248)));
  g1(18,87)=(-((y(20)+y(21))*(-(T246*params(55)*getPowerDeriv(x(it_, 27),1-params(21),1)))/(T248*T248)));
  g1(19,31)=1;
  g1(19,32)=1;
  g1(20,2)=(-((1+y(11))/(1+params(25))));
  g1(20,16)=1-params(22)/2*2*(y(16)-params(13));
  g1(20,3)=(-((1+y(42))/(1+params(25))));
  g1(20,17)=1;
  g1(20,4)=(-(params(38)*(1+y(12))/(1+params(25))));
  g1(20,18)=params(38);
  g1(20,20)=(-1);
  g1(20,21)=(-1);
  g1(20,23)=1;
  g1(20,26)=(-(y(36)*T620));
  g1(20,27)=(-(y(36)*T641));
  g1(20,28)=(-(y(38)*abcap__+y(28)*y(38)*T664));
  g1(20,6)=(-(y(36)*T688));
  g1(20,7)=(-(y(36)*T719));
  g1(20,34)=1;
  g1(20,36)=(-(y(27)+y(26)+ACx__+ACn__));
  g1(20,37)=y(39);
  g1(20,38)=(-(y(28)*abcap__));
  g1(20,39)=y(37);
  g1(20,40)=x(it_, 26);
  g1(20,42)=(-T464);
  g1(20,11)=(-(y(2)/(1+params(25))));
  g1(20,12)=(-(params(38)*y(4)/(1+params(25))));
  g1(20,13)=(-(y(28)*y(38)*T976));
  g1(20,85)=1;
  g1(20,86)=y(40);
  g1(21,21)=1;
  g1(21,25)=(-((-(params(37)*y(49)*params(3)+params(3)/(1+params(3))*(x(it_, 25)+y(48))))/((1+y(25))*(1+y(25)))));
  g1(21,48)=T906;
  g1(21,49)=(-(params(3)*params(37)/(1+y(25))));
  g1(21,85)=T906;
  g1(22,37)=(-(y(39)*params(48)/(y(14)*y(38))));
  g1(22,38)=(-((-(y(14)*(y(39)*params(48)*y(37)+y(40)*params(49)*x(it_, 26))))/(y(14)*y(38)*y(14)*y(38))));
  g1(22,39)=(-(params(48)*y(37)/(y(14)*y(38))));
  g1(22,40)=(-(params(49)*x(it_, 26)/(y(14)*y(38))));
  g1(22,47)=1;
  g1(22,14)=(-((-(y(38)*(y(39)*params(48)*y(37)+y(40)*params(49)*x(it_, 26))))/(y(14)*y(38)*y(14)*y(38))));
  g1(22,86)=(-(y(40)*params(49)/(y(14)*y(38))));
  g1(23,17)=(-(params(43)*T352*params(23)*1/y(50)));
  g1(23,18)=(-(params(43)*T352*params(23)*params(38)/y(50)));
  g1(23,44)=1;
  g1(23,50)=(-(params(43)*T352*params(23)*((-y(17))/(y(50)*y(50))+(-(params(38)*y(18)))/(y(50)*y(50)))));
  g1(24,43)=1;
  g1(24,44)=(-1);
  g1(25,37)=(-y(39));
  g1(25,39)=(-y(37));
  g1(25,40)=(-x(it_, 26));
  g1(25,50)=1;
  g1(25,86)=(-y(40));
  g1(26,24)=1;
  g1(26,8)=(-(((-y(8))-(y(39)-y(8)))/(y(8)*y(8))));
  g1(26,39)=(-(1/y(8)));
  g1(26,9)=(-(((-y(9))-(y(40)-y(9)))/(y(9)*y(9))));
  g1(26,40)=(-(1/y(9)));
  g1(27,1)=(-(y(35)*(1+y(10))/(1+params(25))));
  g1(27,15)=y(35);
  g1(27,3)=(-((1+y(42))/(1+params(25))));
  g1(27,17)=1;
  g1(27,4)=(-(params(38)*(1+y(12))/(1+params(25))));
  g1(27,18)=params(38);
  g1(27,20)=params(31);
  g1(27,21)=params(31);
  g1(27,22)=1;
  g1(27,23)=1;
  g1(27,28)=(-(y(38)*abcap__+y(28)*y(38)*T664));
  g1(27,34)=1;
  g1(27,35)=(-((1+y(10))*y(1)/(1+params(25))-y(15)));
  g1(27,38)=(-(y(28)*abcap__));
  g1(27,10)=(-(y(35)*y(1)/(1+params(25))));
  g1(27,42)=(-(T464-params(14)/(1+params(25))));
  g1(27,12)=(-(params(38)*y(4)/(1+params(25))));
  g1(27,13)=(-(y(28)*y(38)*T976));
  g1(27,14)=params(39);
  g1(28,22)=params(32);
  g1(28,48)=1;
  g1(29,20)=(-((-(y(22)*(1-params(32))))/((y(20)+y(21))*(y(20)+y(21)))));
  g1(29,21)=(-((-(y(22)*(1-params(32))))/((y(20)+y(21))*(y(20)+y(21)))));
  g1(29,22)=(-((1-params(32))/(y(20)+y(21))));
  g1(29,25)=1;
  g1(30,3)=(-(1/(1+params(25))));
  g1(30,17)=1;
  g1(30,50)=(-((-(x(it_, 4)*T921))/(uazuaz__*uazuaz__)+(-(x(it_, 5)*T921))/(uazuaz__*uazuaz__)+(-(x(it_, 6)*T921))/(uazuaz__*uazuaz__)));
  g1(30,64)=T1000;
  g1(30,65)=T1000;
  g1(30,66)=T1000;
  g1(31,33)=1;
  g1(31,64)=(-1);
  g1(31,65)=(-1);
  g1(31,66)=(-1);
  g1(32,5)=(-1);
  g1(32,19)=1;
  g1(32,64)=(-1);
  g1(32,65)=(-1);
  g1(32,66)=(-1);
  g1(33,1)=(-(1/(1+params(25))));
  g1(33,15)=1;
  g1(33,35)=(-((-(params(74)/y(50)*x(it_, 10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(50)*x(it_, 11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(50)*x(it_, 12)))/(uaz_b__*uaz_b__)));
  g1(33,50)=(-((-(x(it_, 10)*T936))/(uaz_b__*uaz_b__)+(-(x(it_, 11)*T936))/(uaz_b__*uaz_b__)+(-(x(it_, 12)*T936))/(uaz_b__*uaz_b__)));
  g1(33,70)=(-(1/uaz_b__));
  g1(33,71)=(-(1/uaz_b__));
  g1(33,72)=(-(1/uaz_b__));
  g1(34,4)=(-(1/(1+params(25))));
  g1(34,18)=1;
  g1(34,50)=(-((-(x(it_, 7)*T921))/(uazuaz__*uazuaz__)+(-(x(it_, 8)*T921))/(uazuaz__*uazuaz__)+(-(x(it_, 9)*T921))/(uazuaz__*uazuaz__)));
  g1(34,67)=T1000;
  g1(34,68)=T1000;
  g1(34,69)=T1000;
  g1(35,28)=uaz__;
  g1(35,38)=y(28)*params(74)*1/params(46)/y(50);
  g1(35,50)=y(28)*(-(params(74)*y(38)/params(46)))/(y(50)*y(50));
  g1(35,61)=(-1);
  g1(35,62)=(-1);
  g1(35,63)=(-1);
  g1(36,23)=uazuaz__;
  g1(36,50)=y(23)*T921;
  g1(36,73)=(-1);
  g1(36,74)=(-1);
  g1(36,75)=(-1);
  g1(37,34)=uazuaz__;
  g1(37,50)=y(34)*T921;
  g1(37,76)=(-1);
  g1(37,77)=(-1);
  g1(37,78)=(-1);
  g1(38,3)=y(42)/(1+params(25));
  g1(38,42)=T464;
  g1(38,50)=(-((-(int_repayment__*T921))/(uazuaz__*uazuaz__)));
  g1(38,90)=T1000;
  g1(38,91)=T1000;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,8281);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,753571);
end
end
