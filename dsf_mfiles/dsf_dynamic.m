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

residual = zeros(39, 1);
ACx__ = y(6)*params(42)/2*(y(22)/y(6)-params(17)-params(25))^2;
ACn__ = y(5)*params(41)/2*(y(21)/y(5)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(23)/y(10)-params(18)-params(25))^params(47)*(y(23)-params(76)*(params(25)+params(18))))/y(23);
compn__ = (1-params(56)-params(55))*y(31)^(-params(21))/(params(55)*y(34)^(1-params(21))+params(56)*y(33)^(1-params(21))+y(31)^(1-params(21))*(1-params(56)-params(55)));
DD__ = y(23)*y(32)*abcap__+(1+y(39))*y(3)/(1+params(25))-y(14)+params(38)*(1+y(9))*y(4)/(1+params(25))-params(38)*y(15)+y(29)*(1+y(7))*y(1)/(1+params(25))-y(29)*y(12)+params(70)-(y(16)+y(17))*params(31)-(y(19)+y(28))-y(11)*params(39);
DDo__ = params(70)+params(14)*(y(39)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(18)*(1-params(32))/(y(16)+y(17));
T_target__ = params(70)-y(18)*params(32);
uazuaz__ = params(74)/y(48);
uaz_b__ = y(29)*params(74)/y(48);
uaz__ = params(74)*y(32)/params(46)/y(48);
int_repayment__ = x(it_, 34)+x(it_, 35)+x(it_, 36);
T14 = params(4)*(y(37)/params(51))^params(65);
T18 = T14*y(11)^params(49);
T23 = y(6)^(params(73)+params(8));
T27 = y(27)^(1-params(8));
T36 = params(2)*(y(36)/params(50))^params(64);
T39 = T36*y(11)^params(48);
T44 = y(5)^(params(72)+params(7));
T48 = y(26)^(1-params(7));
T95 = params(55)*y(34)^(1-params(21))+params(56)*y(33)^(1-params(21));
T100 = T95+(1-params(55)-params(56))*y(31)^(1-params(21));
T108 = y(16)/y(29);
T109 = y(51)/y(55)/T108;
T130 = y(30)/y(56);
T131 = (1+y(38))*y(55)/y(29)*T130;
T139 = 1+params(42)*(y(22)/y(6)-params(17)-params(25));
T150 = params(42)*(y(54)/y(25)-params(17)-params(25));
T155 = params(42)/2;
T167 = 1+params(41)*(y(21)/y(5)-params(16)-params(25));
T178 = params(41)*(y(53)/y(24)-params(16)-params(25));
T183 = params(41)/2;
T256 = (1+y(23)/y(10)-params(18)-params(25))^params(47);
T267 = (1-params(56)-params(55))*y(31)^(-params(21));
T269 = T95+y(31)^(1-params(21))*(1-params(56)-params(55));
T373 = exp(params(23)*(y(14)/y(48)+params(38)*y(15)/y(48)-params(14)/params(74)-params(38)*params(15)/params(74)));
T474 = y(3)/(1+params(25));
T601 = getPowerDeriv(T109,1/params(66),1);
T633 = 1+y(5)*T183*1/y(5)*2*(y(21)/y(5)-params(16)-params(25));
T654 = 1+y(6)*T155*1/y(6)*2*(y(22)/y(6)-params(17)-params(25));
T670 = getPowerDeriv(1+y(23)/y(10)-params(18)-params(25),params(47),1);
T677 = (y(23)*(T256+(y(23)-params(76)*(params(25)+params(18)))*1/y(10)*T670)-(params(76)*(params(25)+params(18))+T256*(y(23)-params(76)*(params(25)+params(18)))))/(y(23)*y(23));
T701 = T183*(y(21)/y(5)-params(16)-params(25))^2+y(5)*T183*2*(y(21)/y(5)-params(16)-params(25))*(-y(21))/(y(5)*y(5));
T732 = T155*(y(22)/y(6)-params(17)-params(25))^2+y(6)*T155*2*(y(22)/y(6)-params(17)-params(25))*(-y(22))/(y(6)*y(6));
T805 = (1+y(38))*y(55)/y(29)*1/y(56);
T812 = (1+y(38))*y(55)/y(29)*(-y(30))/(y(56)*y(56));
T825 = getPowerDeriv(T100,1/(1-params(21)),1);
T925 = (-(params(3)/(1+params(3))/(1+y(20))));
T946 = (-params(74))/(y(48)*y(48));
T961 = (-(y(29)*params(74)))/(y(48)*y(48));
T1002 = (y(23)-params(76)*(params(25)+params(18)))*T670*(-y(23))/(y(10)*y(10))/y(23);
T1026 = (-(1/uazuaz__));
lhs =y(37);
rhs =T18*T23*T27;
residual(1)= lhs-rhs;
lhs =y(36);
rhs =T39*T44*T48;
residual(2)= lhs-rhs;
lhs =y(30);
rhs =y(35)+params(1)*y(31);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =y(35)+y(31)*params(5);
residual(4)= lhs-rhs;
lhs =y(33);
rhs =1+x(it_, 25)+x(it_, 26)+x(it_, 27);
residual(5)= lhs-rhs;
lhs =y(34);
rhs =1+x(it_, 28)+x(it_, 29)+x(it_, 30);
residual(6)= lhs-rhs;
lhs =y(35);
rhs =1+x(it_, 31)+x(it_, 32)+x(it_, 33);
residual(7)= lhs-rhs;
lhs =y(29);
rhs =T100^(1/(1-params(21)));
residual(8)= lhs-rhs;
lhs =T109^(1/params(66));
rhs =params(11)*(1+y(20))*(1+y(38))/((1+y(52))*(1+params(25)));
residual(9)= lhs-rhs;
lhs =T131*T139;
rhs =y(58)/y(56)+1-params(17)+T150*(1+y(54)/y(25)-params(17))-T155*(y(54)/y(25)-params(17)-params(25))^2;
residual(10)= lhs-rhs;
lhs =T131*T167;
rhs =y(57)/y(56)+1-params(16)+T178*(1+y(53)/y(24)-params(16))-T183*(y(53)/y(24)-params(16)-params(25))^2;
residual(11)= lhs-rhs;
lhs =1+y(41);
rhs =y(55)*(1+y(38))*(1-params(22)*(y(13)-params(13)))/y(29);
residual(12)= lhs-rhs;
lhs =(1+params(25))*y(25);
rhs =y(22)+y(6)*(1-params(17));
residual(13)= lhs-rhs;
lhs =(1+params(25))*y(24);
rhs =y(21)+y(5)*(1-params(16));
residual(14)= lhs-rhs;
lhs =(1+params(25))*y(49);
rhs =y(23)+(1-params(18))*y(10);
residual(15)= lhs-rhs;
lhs =y(50);
rhs =params(60)*params(76)+params(59)*(y(49)-params(76));
residual(16)= lhs-rhs;
lhs =y(36)*(1-params(7))*y(31)/y(26);
rhs =y(47);
residual(17)= lhs-rhs;
lhs =y(37)*(1-params(8))*y(33)/y(27);
rhs =y(47);
residual(18)= lhs-rhs;
lhs =y(36)*params(7)*y(31)/y(5);
rhs =y(43);
residual(19)= lhs-rhs;
lhs =y(37)*params(8)*y(33)/y(6);
rhs =y(44);
residual(20)= lhs-rhs;
lhs =y(36);
rhs =compn__*(y(16)+y(17))+params(1)*(y(22)+y(21)+ACx__+ACn__)+y(23)*params(5)*abcap__;
residual(21)= lhs-rhs;
lhs =y(27)+y(26);
rhs =(1+params(3))*params(37);
residual(22)= lhs-rhs;
lhs =y(13)+y(14)+params(38)*y(15);
rhs =y(16)+y(17)+y(30)*(y(22)+y(21)+ACx__+ACn__)+y(23)*y(32)*abcap__+(1+y(39))*y(3)/(1+params(25))+params(38)*(1+y(9))*y(4)/(1+params(25))+(1+y(8))*y(2)/(1+params(25))+params(22)/2*(y(13)-params(13))^2-y(36)*y(31)-y(37)*y(33)-(y(19)+y(28))-y(40);
residual(23)= lhs-rhs;
lhs =y(17);
rhs =(params(37)*y(47)*params(3)+params(3)/(1+params(3))*(y(40)+y(46)))/(1+y(20));
residual(24)= lhs-rhs;
lhs =y(45);
rhs =(y(36)*params(48)*y(31)+y(37)*params(49)*y(33))/(y(11)*y(32));
residual(25)= lhs-rhs;
lhs =y(42);
rhs =params(58)+params(43)*T373;
residual(26)= lhs-rhs;
lhs =y(41);
rhs =y(42)+params(40);
residual(27)= lhs-rhs;
lhs =y(48);
rhs =y(36)*y(31)+y(37)*y(33);
residual(28)= lhs-rhs;
lhs =y(18);
rhs =DD__-DDo__;
residual(29)= lhs-rhs;
lhs =y(46);
rhs =T_target__;
residual(30)= lhs-rhs;
lhs =y(20);
rhs =h_target__;
residual(31)= lhs-rhs;
lhs =y(14);
rhs =params(25)*params(14)/(1+params(25))+T474+x(it_, 4)/uazuaz__+x(it_, 5)/uazuaz__+x(it_, 6)/uazuaz__;
residual(32)= lhs-rhs;
lhs =y(12);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(it_, 10)/uaz_b__+x(it_, 11)/uaz_b__+x(it_, 12)/uaz_b__;
residual(33)= lhs-rhs;
lhs =y(15);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(it_, 7)/uazuaz__+x(it_, 8)/uazuaz__+x(it_, 9)/uazuaz__;
residual(34)= lhs-rhs;
lhs =y(23)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(35)= lhs-rhs;
lhs =y(19)*uazuaz__;
rhs =params(29)+x(it_, 13)+x(it_, 14)+x(it_, 15);
residual(36)= lhs-rhs;
lhs =y(28)*uazuaz__;
rhs =params(44)+x(it_, 16)+x(it_, 17)+x(it_, 18);
residual(37)= lhs-rhs;
lhs =y(40)*uazuaz__;
rhs =params(54)+x(it_, 37)+x(it_, 38)+x(it_, 39);
residual(38)= lhs-rhs;
lhs =y(39)*y(3)/(1+params(25));
rhs =int_repayment__/uazuaz__;
residual(39)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(39, 97);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-(T27*T18*getPowerDeriv(y(6),params(73)+params(8),1)));
  g1(1,27)=(-(T18*T23*getPowerDeriv(y(27),1-params(8),1)));
  g1(1,37)=1-T27*T23*y(11)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(37)/params(51),params(65),1);
  g1(1,11)=(-(T27*T23*T14*getPowerDeriv(y(11),params(49),1)));
  g1(2,5)=(-(T48*T39*getPowerDeriv(y(5),params(72)+params(7),1)));
  g1(2,26)=(-(T39*T44*getPowerDeriv(y(26),1-params(7),1)));
  g1(2,36)=1-T48*T44*y(11)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(36)/params(50),params(64),1);
  g1(2,11)=(-(T48*T44*T36*getPowerDeriv(y(11),params(48),1)));
  g1(3,30)=1;
  g1(3,31)=(-params(1));
  g1(3,35)=(-1);
  g1(4,31)=(-params(5));
  g1(4,32)=1;
  g1(4,35)=(-1);
  g1(5,33)=1;
  g1(5,83)=(-1);
  g1(5,84)=(-1);
  g1(5,85)=(-1);
  g1(6,34)=1;
  g1(6,86)=(-1);
  g1(6,87)=(-1);
  g1(6,88)=(-1);
  g1(7,35)=1;
  g1(7,89)=(-1);
  g1(7,90)=(-1);
  g1(7,91)=(-1);
  g1(8,29)=1;
  g1(8,31)=(-((1-params(55)-params(56))*getPowerDeriv(y(31),1-params(21),1)*T825));
  g1(8,33)=(-(T825*params(56)*getPowerDeriv(y(33),1-params(21),1)));
  g1(8,34)=(-(T825*params(55)*getPowerDeriv(y(34),1-params(21),1)));
  g1(9,16)=(-(y(51)/y(55)*1/y(29)))/(T108*T108)*T601;
  g1(9,51)=T601*1/y(55)/T108;
  g1(9,20)=(-(params(11)*(1+y(38))/((1+y(52))*(1+params(25)))));
  g1(9,52)=(-((-(params(11)*(1+y(20))*(1+y(38))*(1+params(25))))/((1+y(52))*(1+params(25))*(1+y(52))*(1+params(25)))));
  g1(9,29)=T601*(-(y(51)/y(55)*(-y(16))/(y(29)*y(29))))/(T108*T108);
  g1(9,55)=T601*(-y(51))/(y(55)*y(55))/T108;
  g1(9,38)=(-(params(11)*(1+y(20))/((1+y(52))*(1+params(25)))));
  g1(10,22)=T131*params(42)*1/y(6);
  g1(10,54)=(-((1+y(54)/y(25)-params(17))*params(42)*1/y(25)+T150*1/y(25)-T155*1/y(25)*2*(y(54)/y(25)-params(17)-params(25))));
  g1(10,6)=T131*params(42)*(-y(22))/(y(6)*y(6));
  g1(10,25)=(-((1+y(54)/y(25)-params(17))*params(42)*(-y(54))/(y(25)*y(25))+T150*(-y(54))/(y(25)*y(25))-T155*2*(y(54)/y(25)-params(17)-params(25))*(-y(54))/(y(25)*y(25))));
  g1(10,29)=T139*T130*(1+y(38))*(-y(55))/(y(29)*y(29));
  g1(10,55)=T139*T130*(1+y(38))*1/y(29);
  g1(10,30)=T139*T805;
  g1(10,56)=T139*T812-(-y(58))/(y(56)*y(56));
  g1(10,38)=T139*y(55)/y(29)*T130;
  g1(10,58)=(-(1/y(56)));
  g1(11,21)=T131*params(41)*1/y(5);
  g1(11,53)=(-((1+y(53)/y(24)-params(16))*params(41)*1/y(24)+T178*1/y(24)-T183*1/y(24)*2*(y(53)/y(24)-params(16)-params(25))));
  g1(11,5)=T131*params(41)*(-y(21))/(y(5)*y(5));
  g1(11,24)=(-((1+y(53)/y(24)-params(16))*params(41)*(-y(53))/(y(24)*y(24))+T178*(-y(53))/(y(24)*y(24))-T183*2*(y(53)/y(24)-params(16)-params(25))*(-y(53))/(y(24)*y(24))));
  g1(11,29)=T167*T130*(1+y(38))*(-y(55))/(y(29)*y(29));
  g1(11,55)=T167*T130*(1+y(38))*1/y(29);
  g1(11,30)=T167*T805;
  g1(11,56)=T167*T812-(-y(57))/(y(56)*y(56));
  g1(11,38)=T167*y(55)/y(29)*T130;
  g1(11,57)=(-(1/y(56)));
  g1(12,13)=(-(y(55)*(1+y(38))*(-params(22))/y(29)));
  g1(12,29)=(-((-(y(55)*(1+y(38))*(1-params(22)*(y(13)-params(13)))))/(y(29)*y(29))));
  g1(12,55)=(-((1+y(38))*(1-params(22)*(y(13)-params(13)))/y(29)));
  g1(12,38)=(-(y(55)*(1-params(22)*(y(13)-params(13)))/y(29)));
  g1(12,41)=1;
  g1(13,22)=(-1);
  g1(13,6)=(-(1-params(17)));
  g1(13,25)=1+params(25);
  g1(14,21)=(-1);
  g1(14,5)=(-(1-params(16)));
  g1(14,24)=1+params(25);
  g1(15,23)=(-1);
  g1(15,10)=(-(1-params(18)));
  g1(15,49)=1+params(25);
  g1(16,49)=(-params(59));
  g1(16,50)=1;
  g1(17,26)=(-(y(36)*(1-params(7))*y(31)))/(y(26)*y(26));
  g1(17,31)=y(36)*(1-params(7))/y(26);
  g1(17,36)=(1-params(7))*y(31)/y(26);
  g1(17,47)=(-1);
  g1(18,27)=(-(y(37)*(1-params(8))*y(33)))/(y(27)*y(27));
  g1(18,33)=y(37)*(1-params(8))/y(27);
  g1(18,37)=(1-params(8))*y(33)/y(27);
  g1(18,47)=(-1);
  g1(19,5)=(-(y(36)*params(7)*y(31)))/(y(5)*y(5));
  g1(19,31)=y(36)*params(7)/y(5);
  g1(19,36)=params(7)*y(31)/y(5);
  g1(19,43)=(-1);
  g1(20,6)=(-(y(37)*params(8)*y(33)))/(y(6)*y(6));
  g1(20,33)=y(37)*params(8)/y(6);
  g1(20,37)=params(8)*y(33)/y(6);
  g1(20,44)=(-1);
  g1(21,16)=(-compn__);
  g1(21,17)=(-compn__);
  g1(21,21)=(-(params(1)*T633));
  g1(21,22)=(-(params(1)*T654));
  g1(21,23)=(-(params(5)*abcap__+y(23)*params(5)*T677));
  g1(21,5)=(-(params(1)*T701));
  g1(21,6)=(-(params(1)*T732));
  g1(21,31)=(-((y(16)+y(17))*(T269*(1-params(56)-params(55))*getPowerDeriv(y(31),(-params(21)),1)-T267*(1-params(56)-params(55))*getPowerDeriv(y(31),1-params(21),1))/(T269*T269)));
  g1(21,33)=(-((y(16)+y(17))*(-(T267*params(56)*getPowerDeriv(y(33),1-params(21),1)))/(T269*T269)));
  g1(21,34)=(-((y(16)+y(17))*(-(T267*params(55)*getPowerDeriv(y(34),1-params(21),1)))/(T269*T269)));
  g1(21,36)=1;
  g1(21,10)=(-(y(23)*params(5)*T1002));
  g1(22,26)=1;
  g1(22,27)=1;
  g1(23,2)=(-((1+y(8))/(1+params(25))));
  g1(23,13)=1-params(22)/2*2*(y(13)-params(13));
  g1(23,3)=(-((1+y(39))/(1+params(25))));
  g1(23,14)=1;
  g1(23,4)=(-(params(38)*(1+y(9))/(1+params(25))));
  g1(23,15)=params(38);
  g1(23,16)=(-1);
  g1(23,17)=(-1);
  g1(23,19)=1;
  g1(23,21)=(-(y(30)*T633));
  g1(23,22)=(-(y(30)*T654));
  g1(23,23)=(-(y(32)*abcap__+y(23)*y(32)*T677));
  g1(23,5)=(-(y(30)*T701));
  g1(23,6)=(-(y(30)*T732));
  g1(23,28)=1;
  g1(23,30)=(-(y(22)+y(21)+ACx__+ACn__));
  g1(23,31)=y(36);
  g1(23,32)=(-(y(23)*abcap__));
  g1(23,33)=y(37);
  g1(23,36)=y(31);
  g1(23,37)=y(33);
  g1(23,39)=(-T474);
  g1(23,40)=1;
  g1(23,8)=(-(y(2)/(1+params(25))));
  g1(23,9)=(-(params(38)*y(4)/(1+params(25))));
  g1(23,10)=(-(y(23)*y(32)*T1002));
  g1(24,17)=1;
  g1(24,20)=(-((-(params(37)*y(47)*params(3)+params(3)/(1+params(3))*(y(40)+y(46))))/((1+y(20))*(1+y(20)))));
  g1(24,40)=T925;
  g1(24,46)=T925;
  g1(24,47)=(-(params(3)*params(37)/(1+y(20))));
  g1(25,31)=(-(y(36)*params(48)/(y(11)*y(32))));
  g1(25,32)=(-((-(y(11)*(y(36)*params(48)*y(31)+y(37)*params(49)*y(33))))/(y(11)*y(32)*y(11)*y(32))));
  g1(25,33)=(-(y(37)*params(49)/(y(11)*y(32))));
  g1(25,36)=(-(params(48)*y(31)/(y(11)*y(32))));
  g1(25,37)=(-(params(49)*y(33)/(y(11)*y(32))));
  g1(25,45)=1;
  g1(25,11)=(-((-(y(32)*(y(36)*params(48)*y(31)+y(37)*params(49)*y(33))))/(y(11)*y(32)*y(11)*y(32))));
  g1(26,14)=(-(params(43)*T373*params(23)*1/y(48)));
  g1(26,15)=(-(params(43)*T373*params(23)*params(38)/y(48)));
  g1(26,42)=1;
  g1(26,48)=(-(params(43)*T373*params(23)*((-y(14))/(y(48)*y(48))+(-(params(38)*y(15)))/(y(48)*y(48)))));
  g1(27,41)=1;
  g1(27,42)=(-1);
  g1(28,31)=(-y(36));
  g1(28,33)=(-y(37));
  g1(28,36)=(-y(31));
  g1(28,37)=(-y(33));
  g1(28,48)=1;
  g1(29,1)=(-(y(29)*(1+y(7))/(1+params(25))));
  g1(29,12)=y(29);
  g1(29,3)=(-((1+y(39))/(1+params(25))));
  g1(29,14)=1;
  g1(29,4)=(-(params(38)*(1+y(9))/(1+params(25))));
  g1(29,15)=params(38);
  g1(29,16)=params(31);
  g1(29,17)=params(31);
  g1(29,18)=1;
  g1(29,19)=1;
  g1(29,23)=(-(y(32)*abcap__+y(23)*y(32)*T677));
  g1(29,28)=1;
  g1(29,29)=(-((1+y(7))*y(1)/(1+params(25))-y(12)));
  g1(29,32)=(-(y(23)*abcap__));
  g1(29,7)=(-(y(29)*y(1)/(1+params(25))));
  g1(29,39)=(-(T474-params(14)/(1+params(25))));
  g1(29,9)=(-(params(38)*y(4)/(1+params(25))));
  g1(29,10)=(-(y(23)*y(32)*T1002));
  g1(29,11)=params(39);
  g1(30,18)=params(32);
  g1(30,46)=1;
  g1(31,16)=(-((-(y(18)*(1-params(32))))/((y(16)+y(17))*(y(16)+y(17)))));
  g1(31,17)=(-((-(y(18)*(1-params(32))))/((y(16)+y(17))*(y(16)+y(17)))));
  g1(31,18)=(-((1-params(32))/(y(16)+y(17))));
  g1(31,20)=1;
  g1(32,3)=(-(1/(1+params(25))));
  g1(32,14)=1;
  g1(32,48)=(-((-(x(it_, 4)*T946))/(uazuaz__*uazuaz__)+(-(x(it_, 5)*T946))/(uazuaz__*uazuaz__)+(-(x(it_, 6)*T946))/(uazuaz__*uazuaz__)));
  g1(32,62)=T1026;
  g1(32,63)=T1026;
  g1(32,64)=T1026;
  g1(33,1)=(-(1/(1+params(25))));
  g1(33,12)=1;
  g1(33,29)=(-((-(params(74)/y(48)*x(it_, 10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(48)*x(it_, 11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(48)*x(it_, 12)))/(uaz_b__*uaz_b__)));
  g1(33,48)=(-((-(x(it_, 10)*T961))/(uaz_b__*uaz_b__)+(-(x(it_, 11)*T961))/(uaz_b__*uaz_b__)+(-(x(it_, 12)*T961))/(uaz_b__*uaz_b__)));
  g1(33,68)=(-(1/uaz_b__));
  g1(33,69)=(-(1/uaz_b__));
  g1(33,70)=(-(1/uaz_b__));
  g1(34,4)=(-(1/(1+params(25))));
  g1(34,15)=1;
  g1(34,48)=(-((-(x(it_, 7)*T946))/(uazuaz__*uazuaz__)+(-(x(it_, 8)*T946))/(uazuaz__*uazuaz__)+(-(x(it_, 9)*T946))/(uazuaz__*uazuaz__)));
  g1(34,65)=T1026;
  g1(34,66)=T1026;
  g1(34,67)=T1026;
  g1(35,23)=uaz__;
  g1(35,32)=y(23)*params(74)*1/params(46)/y(48);
  g1(35,48)=y(23)*(-(params(74)*y(32)/params(46)))/(y(48)*y(48));
  g1(35,59)=(-1);
  g1(35,60)=(-1);
  g1(35,61)=(-1);
  g1(36,19)=uazuaz__;
  g1(36,48)=y(19)*T946;
  g1(36,71)=(-1);
  g1(36,72)=(-1);
  g1(36,73)=(-1);
  g1(37,28)=uazuaz__;
  g1(37,48)=y(28)*T946;
  g1(37,74)=(-1);
  g1(37,75)=(-1);
  g1(37,76)=(-1);
  g1(38,40)=uazuaz__;
  g1(38,48)=y(40)*T946;
  g1(38,95)=(-1);
  g1(38,96)=(-1);
  g1(38,97)=(-1);
  g1(39,3)=y(39)/(1+params(25));
  g1(39,39)=T474;
  g1(39,48)=(-((-(int_repayment__*T946))/(uazuaz__*uazuaz__)));
  g1(39,92)=T1026;
  g1(39,93)=T1026;
  g1(39,94)=T1026;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],39,9409);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],39,912673);
end
end
