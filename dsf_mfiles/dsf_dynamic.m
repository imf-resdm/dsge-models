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

residual = zeros(35, 1);
ACx__ = y(6)*params(42)/2*(y(22)/y(6)-params(17)-params(25))^2;
ACn__ = y(5)*params(41)/2*(y(21)/y(5)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(23)/y(10)-params(18)-params(25))^params(47)*(y(23)-params(76)*(params(25)+params(18))))/y(23);
compn__ = (1-params(56)-params(55))*y(31)^(-params(21))/(params(55)*x(it_, 27)^(1-params(21))+params(56)*x(it_, 26)^(1-params(21))+y(31)^(1-params(21))*(1-params(56)-params(55)));
DD__ = y(23)*y(32)*abcap__+(1+y(36))*y(3)/(1+params(25))-y(14)+params(38)*(1+y(9))*y(4)/(1+params(25))-params(38)*y(15)+y(29)*(1+y(7))*y(1)/(1+params(25))-y(29)*y(12)+params(70)-(y(16)+y(17))*params(31)-(y(19)+y(28))-y(11)*params(39);
DDo__ = params(70)+params(14)*(y(36)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(18)*(1-params(32))/(y(16)+y(17));
T_target__ = params(70)-y(18)*params(32);
uazuaz__ = params(74)/y(44);
uaz_b__ = y(29)*params(74)/y(44);
uaz__ = params(74)*y(32)/params(46)/y(44);
int_repayment__ = x(it_, 30)+x(it_, 31);
T14 = params(4)*(y(34)/params(51))^params(65);
T18 = T14*y(11)^params(49);
T23 = y(6)^(params(73)+params(8));
T27 = y(27)^(1-params(8));
T36 = params(2)*(y(33)/params(50))^params(64);
T39 = T36*y(11)^params(48);
T44 = y(5)^(params(72)+params(7));
T48 = y(26)^(1-params(7));
T74 = params(55)*x(it_, 27)^(1-params(21))+params(56)*x(it_, 26)^(1-params(21));
T79 = T74+(1-params(55)-params(56))*y(31)^(1-params(21));
T87 = y(16)/y(29);
T88 = y(47)/y(51)/T87;
T109 = y(30)/y(52);
T110 = (1+y(35))*y(51)/y(29)*T109;
T118 = 1+params(42)*(y(22)/y(6)-params(17)-params(25));
T129 = params(42)*(y(50)/y(25)-params(17)-params(25));
T134 = params(42)/2;
T146 = 1+params(41)*(y(21)/y(5)-params(16)-params(25));
T157 = params(41)*(y(49)/y(24)-params(16)-params(25));
T162 = params(41)/2;
T235 = (1+y(23)/y(10)-params(18)-params(25))^params(47);
T246 = (1-params(56)-params(55))*y(31)^(-params(21));
T248 = T74+y(31)^(1-params(21))*(1-params(56)-params(55));
T352 = exp(params(23)*(y(14)/y(44)+params(38)*y(15)/y(44)-params(14)/params(74)-params(38)*params(15)/params(74)));
T454 = y(3)/(1+params(25));
T570 = getPowerDeriv(T88,1/params(66),1);
T602 = 1+y(5)*T162*1/y(5)*2*(y(21)/y(5)-params(16)-params(25));
T623 = 1+y(6)*T134*1/y(6)*2*(y(22)/y(6)-params(17)-params(25));
T639 = getPowerDeriv(1+y(23)/y(10)-params(18)-params(25),params(47),1);
T646 = (y(23)*(T235+(y(23)-params(76)*(params(25)+params(18)))*1/y(10)*T639)-(params(76)*(params(25)+params(18))+T235*(y(23)-params(76)*(params(25)+params(18)))))/(y(23)*y(23));
T670 = T162*(y(21)/y(5)-params(16)-params(25))^2+y(5)*T162*2*(y(21)/y(5)-params(16)-params(25))*(-y(21))/(y(5)*y(5));
T701 = T134*(y(22)/y(6)-params(17)-params(25))^2+y(6)*T134*2*(y(22)/y(6)-params(17)-params(25))*(-y(22))/(y(6)*y(6));
T774 = (1+y(35))*y(51)/y(29)*1/y(52);
T781 = (1+y(35))*y(51)/y(29)*(-y(30))/(y(52)*y(52));
T794 = getPowerDeriv(T79,1/(1-params(21)),1);
T874 = (-(params(3)/(1+params(3))/(1+y(20))));
T889 = (-params(74))/(y(44)*y(44));
T904 = (-(y(29)*params(74)))/(y(44)*y(44));
T944 = (y(23)-params(76)*(params(25)+params(18)))*T639*(-y(23))/(y(10)*y(10))/y(23);
T968 = (-(1/uazuaz__));
lhs =y(34);
rhs =T18*T23*T27;
residual(1)= lhs-rhs;
lhs =y(33);
rhs =T39*T44*T48;
residual(2)= lhs-rhs;
lhs =y(30);
rhs =x(it_, 28)+params(1)*y(31);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =x(it_, 28)+y(31)*params(5);
residual(4)= lhs-rhs;
lhs =y(29);
rhs =T79^(1/(1-params(21)));
residual(5)= lhs-rhs;
lhs =T88^(1/params(66));
rhs =params(11)*(1+y(20))*(1+y(35))/((1+y(48))*(1+params(25)));
residual(6)= lhs-rhs;
lhs =T110*T118;
rhs =y(54)/y(52)+1-params(17)+T129*(1+y(50)/y(25)-params(17))-T134*(y(50)/y(25)-params(17)-params(25))^2;
residual(7)= lhs-rhs;
lhs =T110*T146;
rhs =y(53)/y(52)+1-params(16)+T157*(1+y(49)/y(24)-params(16))-T162*(y(49)/y(24)-params(16)-params(25))^2;
residual(8)= lhs-rhs;
lhs =1+y(37);
rhs =y(51)*(1+y(35))*(1-params(22)*(y(13)-params(13)))/y(29);
residual(9)= lhs-rhs;
lhs =(1+params(25))*y(25);
rhs =y(22)+y(6)*(1-params(17));
residual(10)= lhs-rhs;
lhs =(1+params(25))*y(24);
rhs =y(21)+y(5)*(1-params(16));
residual(11)= lhs-rhs;
lhs =(1+params(25))*y(45);
rhs =y(23)+(1-params(18))*y(10);
residual(12)= lhs-rhs;
lhs =y(46);
rhs =params(60)*params(76)+params(59)*(y(45)-params(76));
residual(13)= lhs-rhs;
lhs =y(33)*(1-params(7))*y(31)/y(26);
rhs =y(43);
residual(14)= lhs-rhs;
lhs =y(34)*(1-params(8))*x(it_, 26)/y(27);
rhs =y(43);
residual(15)= lhs-rhs;
lhs =y(33)*params(7)*y(31)/y(5);
rhs =y(39);
residual(16)= lhs-rhs;
lhs =y(34)*params(8)*x(it_, 26)/y(6);
rhs =y(40);
residual(17)= lhs-rhs;
lhs =y(33);
rhs =compn__*(y(16)+y(17))+params(1)*(y(22)+y(21)+ACx__+ACn__)+y(23)*params(5)*abcap__;
residual(18)= lhs-rhs;
lhs =y(27)+y(26);
rhs =(1+params(3))*params(37);
residual(19)= lhs-rhs;
lhs =y(13)+y(14)+params(38)*y(15);
rhs =y(16)+y(17)+y(30)*(y(22)+y(21)+ACx__+ACn__)+y(23)*y(32)*abcap__+(1+y(36))*y(3)/(1+params(25))+params(38)*(1+y(9))*y(4)/(1+params(25))+(1+y(8))*y(2)/(1+params(25))+params(22)/2*(y(13)-params(13))^2-y(33)*y(31)-y(34)*x(it_, 26)-(y(19)+y(28))-x(it_, 25);
residual(20)= lhs-rhs;
lhs =y(17);
rhs =(params(37)*y(43)*params(3)+params(3)/(1+params(3))*(x(it_, 25)+y(42)))/(1+y(20));
residual(21)= lhs-rhs;
lhs =y(41);
rhs =(y(33)*params(48)*y(31)+y(34)*params(49)*x(it_, 26))/(y(11)*y(32));
residual(22)= lhs-rhs;
lhs =y(38);
rhs =params(58)+params(43)*T352;
residual(23)= lhs-rhs;
lhs =y(37);
rhs =y(38)+params(40);
residual(24)= lhs-rhs;
lhs =y(44);
rhs =y(33)*y(31)+y(34)*x(it_, 26);
residual(25)= lhs-rhs;
lhs =y(18);
rhs =DD__-DDo__;
residual(26)= lhs-rhs;
lhs =y(42);
rhs =T_target__;
residual(27)= lhs-rhs;
lhs =y(20);
rhs =h_target__;
residual(28)= lhs-rhs;
lhs =y(14);
rhs =params(25)*params(14)/(1+params(25))+T454+x(it_, 4)/uazuaz__+x(it_, 5)/uazuaz__+x(it_, 6)/uazuaz__;
residual(29)= lhs-rhs;
lhs =y(12);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(it_, 10)/uaz_b__+x(it_, 11)/uaz_b__+x(it_, 12)/uaz_b__;
residual(30)= lhs-rhs;
lhs =y(15);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(it_, 7)/uazuaz__+x(it_, 8)/uazuaz__+x(it_, 9)/uazuaz__;
residual(31)= lhs-rhs;
lhs =y(23)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(32)= lhs-rhs;
lhs =y(19)*uazuaz__;
rhs =params(29)+x(it_, 13)+x(it_, 14)+x(it_, 15);
residual(33)= lhs-rhs;
lhs =y(28)*uazuaz__;
rhs =params(44)+x(it_, 16)+x(it_, 17)+x(it_, 18);
residual(34)= lhs-rhs;
lhs =y(36)*y(3)/(1+params(25));
rhs =int_repayment__/uazuaz__;
residual(35)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(35, 85);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-(T27*T18*getPowerDeriv(y(6),params(73)+params(8),1)));
  g1(1,27)=(-(T18*T23*getPowerDeriv(y(27),1-params(8),1)));
  g1(1,34)=1-T27*T23*y(11)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(34)/params(51),params(65),1);
  g1(1,11)=(-(T27*T23*T14*getPowerDeriv(y(11),params(49),1)));
  g1(2,5)=(-(T48*T39*getPowerDeriv(y(5),params(72)+params(7),1)));
  g1(2,26)=(-(T39*T44*getPowerDeriv(y(26),1-params(7),1)));
  g1(2,33)=1-T48*T44*y(11)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(33)/params(50),params(64),1);
  g1(2,11)=(-(T48*T44*T36*getPowerDeriv(y(11),params(48),1)));
  g1(3,30)=1;
  g1(3,31)=(-params(1));
  g1(3,82)=(-1);
  g1(4,31)=(-params(5));
  g1(4,32)=1;
  g1(4,82)=(-1);
  g1(5,29)=1;
  g1(5,31)=(-((1-params(55)-params(56))*getPowerDeriv(y(31),1-params(21),1)*T794));
  g1(5,80)=(-(T794*params(56)*getPowerDeriv(x(it_, 26),1-params(21),1)));
  g1(5,81)=(-(T794*params(55)*getPowerDeriv(x(it_, 27),1-params(21),1)));
  g1(6,16)=(-(y(47)/y(51)*1/y(29)))/(T87*T87)*T570;
  g1(6,47)=T570*1/y(51)/T87;
  g1(6,20)=(-(params(11)*(1+y(35))/((1+y(48))*(1+params(25)))));
  g1(6,48)=(-((-(params(11)*(1+y(20))*(1+y(35))*(1+params(25))))/((1+y(48))*(1+params(25))*(1+y(48))*(1+params(25)))));
  g1(6,29)=T570*(-(y(47)/y(51)*(-y(16))/(y(29)*y(29))))/(T87*T87);
  g1(6,51)=T570*(-y(47))/(y(51)*y(51))/T87;
  g1(6,35)=(-(params(11)*(1+y(20))/((1+y(48))*(1+params(25)))));
  g1(7,22)=T110*params(42)*1/y(6);
  g1(7,50)=(-((1+y(50)/y(25)-params(17))*params(42)*1/y(25)+T129*1/y(25)-T134*1/y(25)*2*(y(50)/y(25)-params(17)-params(25))));
  g1(7,6)=T110*params(42)*(-y(22))/(y(6)*y(6));
  g1(7,25)=(-((1+y(50)/y(25)-params(17))*params(42)*(-y(50))/(y(25)*y(25))+T129*(-y(50))/(y(25)*y(25))-T134*2*(y(50)/y(25)-params(17)-params(25))*(-y(50))/(y(25)*y(25))));
  g1(7,29)=T118*T109*(1+y(35))*(-y(51))/(y(29)*y(29));
  g1(7,51)=T118*T109*(1+y(35))*1/y(29);
  g1(7,30)=T118*T774;
  g1(7,52)=T118*T781-(-y(54))/(y(52)*y(52));
  g1(7,35)=T118*y(51)/y(29)*T109;
  g1(7,54)=(-(1/y(52)));
  g1(8,21)=T110*params(41)*1/y(5);
  g1(8,49)=(-((1+y(49)/y(24)-params(16))*params(41)*1/y(24)+T157*1/y(24)-T162*1/y(24)*2*(y(49)/y(24)-params(16)-params(25))));
  g1(8,5)=T110*params(41)*(-y(21))/(y(5)*y(5));
  g1(8,24)=(-((1+y(49)/y(24)-params(16))*params(41)*(-y(49))/(y(24)*y(24))+T157*(-y(49))/(y(24)*y(24))-T162*2*(y(49)/y(24)-params(16)-params(25))*(-y(49))/(y(24)*y(24))));
  g1(8,29)=T146*T109*(1+y(35))*(-y(51))/(y(29)*y(29));
  g1(8,51)=T146*T109*(1+y(35))*1/y(29);
  g1(8,30)=T146*T774;
  g1(8,52)=T146*T781-(-y(53))/(y(52)*y(52));
  g1(8,35)=T146*y(51)/y(29)*T109;
  g1(8,53)=(-(1/y(52)));
  g1(9,13)=(-(y(51)*(1+y(35))*(-params(22))/y(29)));
  g1(9,29)=(-((-(y(51)*(1+y(35))*(1-params(22)*(y(13)-params(13)))))/(y(29)*y(29))));
  g1(9,51)=(-((1+y(35))*(1-params(22)*(y(13)-params(13)))/y(29)));
  g1(9,35)=(-(y(51)*(1-params(22)*(y(13)-params(13)))/y(29)));
  g1(9,37)=1;
  g1(10,22)=(-1);
  g1(10,6)=(-(1-params(17)));
  g1(10,25)=1+params(25);
  g1(11,21)=(-1);
  g1(11,5)=(-(1-params(16)));
  g1(11,24)=1+params(25);
  g1(12,23)=(-1);
  g1(12,10)=(-(1-params(18)));
  g1(12,45)=1+params(25);
  g1(13,45)=(-params(59));
  g1(13,46)=1;
  g1(14,26)=(-(y(33)*(1-params(7))*y(31)))/(y(26)*y(26));
  g1(14,31)=y(33)*(1-params(7))/y(26);
  g1(14,33)=(1-params(7))*y(31)/y(26);
  g1(14,43)=(-1);
  g1(15,27)=(-(y(34)*(1-params(8))*x(it_, 26)))/(y(27)*y(27));
  g1(15,34)=(1-params(8))*x(it_, 26)/y(27);
  g1(15,43)=(-1);
  g1(15,80)=y(34)*(1-params(8))/y(27);
  g1(16,5)=(-(y(33)*params(7)*y(31)))/(y(5)*y(5));
  g1(16,31)=y(33)*params(7)/y(5);
  g1(16,33)=params(7)*y(31)/y(5);
  g1(16,39)=(-1);
  g1(17,6)=(-(y(34)*params(8)*x(it_, 26)))/(y(6)*y(6));
  g1(17,34)=params(8)*x(it_, 26)/y(6);
  g1(17,40)=(-1);
  g1(17,80)=y(34)*params(8)/y(6);
  g1(18,16)=(-compn__);
  g1(18,17)=(-compn__);
  g1(18,21)=(-(params(1)*T602));
  g1(18,22)=(-(params(1)*T623));
  g1(18,23)=(-(params(5)*abcap__+y(23)*params(5)*T646));
  g1(18,5)=(-(params(1)*T670));
  g1(18,6)=(-(params(1)*T701));
  g1(18,31)=(-((y(16)+y(17))*(T248*(1-params(56)-params(55))*getPowerDeriv(y(31),(-params(21)),1)-T246*(1-params(56)-params(55))*getPowerDeriv(y(31),1-params(21),1))/(T248*T248)));
  g1(18,33)=1;
  g1(18,10)=(-(y(23)*params(5)*T944));
  g1(18,80)=(-((y(16)+y(17))*(-(T246*params(56)*getPowerDeriv(x(it_, 26),1-params(21),1)))/(T248*T248)));
  g1(18,81)=(-((y(16)+y(17))*(-(T246*params(55)*getPowerDeriv(x(it_, 27),1-params(21),1)))/(T248*T248)));
  g1(19,26)=1;
  g1(19,27)=1;
  g1(20,2)=(-((1+y(8))/(1+params(25))));
  g1(20,13)=1-params(22)/2*2*(y(13)-params(13));
  g1(20,3)=(-((1+y(36))/(1+params(25))));
  g1(20,14)=1;
  g1(20,4)=(-(params(38)*(1+y(9))/(1+params(25))));
  g1(20,15)=params(38);
  g1(20,16)=(-1);
  g1(20,17)=(-1);
  g1(20,19)=1;
  g1(20,21)=(-(y(30)*T602));
  g1(20,22)=(-(y(30)*T623));
  g1(20,23)=(-(y(32)*abcap__+y(23)*y(32)*T646));
  g1(20,5)=(-(y(30)*T670));
  g1(20,6)=(-(y(30)*T701));
  g1(20,28)=1;
  g1(20,30)=(-(y(22)+y(21)+ACx__+ACn__));
  g1(20,31)=y(33);
  g1(20,32)=(-(y(23)*abcap__));
  g1(20,33)=y(31);
  g1(20,34)=x(it_, 26);
  g1(20,36)=(-T454);
  g1(20,8)=(-(y(2)/(1+params(25))));
  g1(20,9)=(-(params(38)*y(4)/(1+params(25))));
  g1(20,10)=(-(y(23)*y(32)*T944));
  g1(20,79)=1;
  g1(20,80)=y(34);
  g1(21,17)=1;
  g1(21,20)=(-((-(params(37)*y(43)*params(3)+params(3)/(1+params(3))*(x(it_, 25)+y(42))))/((1+y(20))*(1+y(20)))));
  g1(21,42)=T874;
  g1(21,43)=(-(params(3)*params(37)/(1+y(20))));
  g1(21,79)=T874;
  g1(22,31)=(-(y(33)*params(48)/(y(11)*y(32))));
  g1(22,32)=(-((-(y(11)*(y(33)*params(48)*y(31)+y(34)*params(49)*x(it_, 26))))/(y(11)*y(32)*y(11)*y(32))));
  g1(22,33)=(-(params(48)*y(31)/(y(11)*y(32))));
  g1(22,34)=(-(params(49)*x(it_, 26)/(y(11)*y(32))));
  g1(22,41)=1;
  g1(22,11)=(-((-(y(32)*(y(33)*params(48)*y(31)+y(34)*params(49)*x(it_, 26))))/(y(11)*y(32)*y(11)*y(32))));
  g1(22,80)=(-(y(34)*params(49)/(y(11)*y(32))));
  g1(23,14)=(-(params(43)*T352*params(23)*1/y(44)));
  g1(23,15)=(-(params(43)*T352*params(23)*params(38)/y(44)));
  g1(23,38)=1;
  g1(23,44)=(-(params(43)*T352*params(23)*((-y(14))/(y(44)*y(44))+(-(params(38)*y(15)))/(y(44)*y(44)))));
  g1(24,37)=1;
  g1(24,38)=(-1);
  g1(25,31)=(-y(33));
  g1(25,33)=(-y(31));
  g1(25,34)=(-x(it_, 26));
  g1(25,44)=1;
  g1(25,80)=(-y(34));
  g1(26,1)=(-(y(29)*(1+y(7))/(1+params(25))));
  g1(26,12)=y(29);
  g1(26,3)=(-((1+y(36))/(1+params(25))));
  g1(26,14)=1;
  g1(26,4)=(-(params(38)*(1+y(9))/(1+params(25))));
  g1(26,15)=params(38);
  g1(26,16)=params(31);
  g1(26,17)=params(31);
  g1(26,18)=1;
  g1(26,19)=1;
  g1(26,23)=(-(y(32)*abcap__+y(23)*y(32)*T646));
  g1(26,28)=1;
  g1(26,29)=(-((1+y(7))*y(1)/(1+params(25))-y(12)));
  g1(26,32)=(-(y(23)*abcap__));
  g1(26,7)=(-(y(29)*y(1)/(1+params(25))));
  g1(26,36)=(-(T454-params(14)/(1+params(25))));
  g1(26,9)=(-(params(38)*y(4)/(1+params(25))));
  g1(26,10)=(-(y(23)*y(32)*T944));
  g1(26,11)=params(39);
  g1(27,18)=params(32);
  g1(27,42)=1;
  g1(28,16)=(-((-(y(18)*(1-params(32))))/((y(16)+y(17))*(y(16)+y(17)))));
  g1(28,17)=(-((-(y(18)*(1-params(32))))/((y(16)+y(17))*(y(16)+y(17)))));
  g1(28,18)=(-((1-params(32))/(y(16)+y(17))));
  g1(28,20)=1;
  g1(29,3)=(-(1/(1+params(25))));
  g1(29,14)=1;
  g1(29,44)=(-((-(x(it_, 4)*T889))/(uazuaz__*uazuaz__)+(-(x(it_, 5)*T889))/(uazuaz__*uazuaz__)+(-(x(it_, 6)*T889))/(uazuaz__*uazuaz__)));
  g1(29,58)=T968;
  g1(29,59)=T968;
  g1(29,60)=T968;
  g1(30,1)=(-(1/(1+params(25))));
  g1(30,12)=1;
  g1(30,29)=(-((-(params(74)/y(44)*x(it_, 10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(44)*x(it_, 11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(44)*x(it_, 12)))/(uaz_b__*uaz_b__)));
  g1(30,44)=(-((-(x(it_, 10)*T904))/(uaz_b__*uaz_b__)+(-(x(it_, 11)*T904))/(uaz_b__*uaz_b__)+(-(x(it_, 12)*T904))/(uaz_b__*uaz_b__)));
  g1(30,64)=(-(1/uaz_b__));
  g1(30,65)=(-(1/uaz_b__));
  g1(30,66)=(-(1/uaz_b__));
  g1(31,4)=(-(1/(1+params(25))));
  g1(31,15)=1;
  g1(31,44)=(-((-(x(it_, 7)*T889))/(uazuaz__*uazuaz__)+(-(x(it_, 8)*T889))/(uazuaz__*uazuaz__)+(-(x(it_, 9)*T889))/(uazuaz__*uazuaz__)));
  g1(31,61)=T968;
  g1(31,62)=T968;
  g1(31,63)=T968;
  g1(32,23)=uaz__;
  g1(32,32)=y(23)*params(74)*1/params(46)/y(44);
  g1(32,44)=y(23)*(-(params(74)*y(32)/params(46)))/(y(44)*y(44));
  g1(32,55)=(-1);
  g1(32,56)=(-1);
  g1(32,57)=(-1);
  g1(33,19)=uazuaz__;
  g1(33,44)=y(19)*T889;
  g1(33,67)=(-1);
  g1(33,68)=(-1);
  g1(33,69)=(-1);
  g1(34,28)=uazuaz__;
  g1(34,44)=y(28)*T889;
  g1(34,70)=(-1);
  g1(34,71)=(-1);
  g1(34,72)=(-1);
  g1(35,3)=y(36)/(1+params(25));
  g1(35,36)=T454;
  g1(35,44)=(-((-(int_repayment__*T889))/(uazuaz__*uazuaz__)));
  g1(35,84)=T968;
  g1(35,85)=T968;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],35,7225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],35,614125);
end
end
