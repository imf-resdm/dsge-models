function [residual, g1, g2, g3] = DSA_Exogenous_Debt_fast_scaling_up_dynamic(y, x, params, steady_state, it_)
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
Robx__ = params(38)/2*y(3)*(y(21)/y(3)-params(3)-params(16))^2;
Robn__ = params(39)/2*y(4)*(y(22)/y(4)-params(4)-params(16))^2;
compn__ = (1-params(22)-params(23))*y(28)^(-params(17))/(params(23)*x(it_, 15)^(1-params(17))+params(22)*x(it_, 14)^(1-params(17))+(1-params(22)-params(23))*y(28)^(1-params(17)));
Jimz__ = ((params(16)+params(5))*params(45)+(1+y(42)/y(5)-params(5)-params(16))^params(26)*(y(42)-(params(16)+params(5))*params(45)))/y(42);
gap__ = y(42)*y(27)*Jimz__+params(42)+(y(14)-params(16))*y(11)/(1+params(16))+(1+params(28))*y(8)/(1+params(16))+y(29)*(y(9)-params(16))*y(7)/(1+params(16))-y(35)-(y(37)+y(38))*params(27)-y(10)*y(52)-y(47);
T9 = params(38)/2;
T21 = params(39)/2;
T39 = (1-params(22)-params(23))*y(28)^(-params(17));
T47 = params(23)*x(it_, 15)^(1-params(17))+params(22)*x(it_, 14)^(1-params(17));
T50 = T47+(1-params(22)-params(23))*y(28)^(1-params(17));
T60 = (1+y(42)/y(5)-params(5)-params(16))^params(26);
T106 = params(49)*(y(15)/params(68))^params(65);
T110 = T106*y(10)^params(9);
T114 = y(3)^(params(12)+params(14));
T118 = y(19)^(1-params(14));
T127 = params(48)*(y(16)/params(69))^params(66);
T130 = T127*y(10)^params(10);
T134 = y(4)^(params(11)+params(15));
T138 = y(20)^(1-params(15));
T156 = T47+y(28)^(1-params(17))*(1-params(23)-params(22));
T164 = y(37)/y(29);
T165 = y(61)/y(59)/T164;
T184 = y(26)/y(58);
T185 = (1+y(36))*y(59)/y(29)*T184;
T187 = 1+params(38)*(y(21)/y(3)-params(3)-params(16));
T198 = params(38)*(y(54)/y(17)-params(3)-params(16));
T208 = 1+params(39)*(y(22)/y(4)-params(4)-params(16));
T219 = params(39)*(y(55)/y(18)-params(4)-params(16));
T456 = exp(params(71)*(y(35)/y(44)+params(50)*y(41)/y(44)-params(43)/params(25)-params(50)*params(52)/params(25)));
T539 = T9*(y(21)/y(3)-params(3)-params(16))^2+T9*y(3)*(-y(21))/(y(3)*y(3))*2*(y(21)/y(3)-params(3)-params(16));
T571 = T21*(y(22)/y(4)-params(4)-params(16))^2+T21*y(4)*(-y(22))/(y(4)*y(4))*2*(y(22)/y(4)-params(4)-params(16));
T604 = 1+T9*y(3)*2*(y(21)/y(3)-params(3)-params(16))*1/y(3);
T622 = 1+T21*y(4)*2*(y(22)/y(4)-params(4)-params(16))*1/y(4);
T640 = (1+y(36))*y(59)/y(29)*1/y(58);
T647 = (1+y(36))*y(59)/y(29)*(-y(26))/(y(58)*y(58));
T672 = getPowerDeriv(T156,1/(1-params(17)),1);
T700 = getPowerDeriv(T165,1/params(8),1);
T745 = getPowerDeriv(1+y(42)/y(5)-params(5)-params(16),params(26),1);
T748 = (y(42)-(params(16)+params(5))*params(45))*(-y(42))/(y(5)*y(5))*T745/y(42);
T822 = (-(((y(37)+y(38))*(1-params(53))*(-params(27))-gap__*(1-params(53)))/((y(37)+y(38))*(y(37)+y(38)))));
T827 = (-(params(63)/(1+params(63))/(1+y(30))));
T868 = (y(42)*(T60+(y(42)-(params(16)+params(5))*params(45))*T745*1/y(5))-((params(16)+params(5))*params(45)+T60*(y(42)-(params(16)+params(5))*params(45))))/(y(42)*y(42));
lhs =y(15);
rhs =T110*T114*T118;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =T130*T134*T138;
residual(2)= lhs-rhs;
lhs =y(26);
rhs =x(it_, 16)+y(28)*params(36);
residual(3)= lhs-rhs;
lhs =y(27);
rhs =x(it_, 16)+y(28)*params(37);
residual(4)= lhs-rhs;
lhs =y(29);
rhs =T156^(1/(1-params(17)));
residual(5)= lhs-rhs;
lhs =T165^(1/params(8));
rhs =params(2)*(1+y(30))*(1+y(36))/((1+params(16))*(1+y(60)));
residual(6)= lhs-rhs;
lhs =T185*T187;
rhs =y(56)/y(58)+1-params(3)+T198*(1+y(54)/y(17)-params(3))-T9*(y(54)/y(17)-params(3)-params(16))^2;
residual(7)= lhs-rhs;
lhs =T185*T208;
rhs =y(57)/y(58)+1-params(4)+T219*(1+y(55)/y(18)-params(4))-T21*(y(55)/y(18)-params(4)-params(16))^2;
residual(8)= lhs-rhs;
lhs =1+y(46);
rhs =y(59)*(1+y(36))*(1-params(21)*(y(32)-params(70)))/y(29);
residual(9)= lhs-rhs;
lhs =(1+params(16))*y(17);
rhs =y(21)+y(3)*(1-params(3));
residual(10)= lhs-rhs;
lhs =(1+params(16))*y(18);
rhs =y(22)+y(4)*(1-params(4));
residual(11)= lhs-rhs;
lhs =y(16)*y(28)*(1-params(15))/y(20);
rhs =y(23);
residual(12)= lhs-rhs;
lhs =y(15)*x(it_, 14)*(1-params(14))/y(19);
rhs =y(23);
residual(13)= lhs-rhs;
lhs =y(16)*y(28)*params(15)/y(4);
rhs =y(25);
residual(14)= lhs-rhs;
lhs =y(15)*x(it_, 14)*params(14)/y(3);
rhs =y(24);
residual(15)= lhs-rhs;
lhs =compn__*(y(37)+y(38))+params(36)*(y(21)+y(22)+Robx__+Robn__)+y(42)*params(37)*Jimz__;
rhs =y(16);
residual(16)= lhs-rhs;
lhs =y(19)+y(20);
rhs =(1+params(63))*params(47);
residual(17)= lhs-rhs;
lhs =y(38);
rhs =(params(47)*y(23)*params(63)+params(63)/(1+params(63))*(y(39)+x(it_, 11)))/(1+y(30));
residual(18)= lhs-rhs;
lhs =y(34);
rhs =params(44);
residual(19)= lhs-rhs;
lhs =y(52);
rhs =params(34)+params(5)*params(46)*(x(it_, 12)+x(it_, 13));
residual(20)= lhs-rhs;
lhs =y(39);
rhs =params(42)-params(53)*gap__;
residual(21)= lhs-rhs;
lhs =y(30);
rhs =params(27)+gap__*(1-params(53))/(y(37)+y(38));
residual(22)= lhs-rhs;
lhs =(1+params(16))*y(31);
rhs =y(42)+y(5)*(1-params(5));
residual(23)= lhs-rhs;
lhs =y(32)+y(35)+params(50)*y(41);
rhs =(1+params(28))*y(8)/(1+params(16))+y(42)*y(27)*Jimz__+y(37)+y(38)+y(26)*(y(21)+y(22)+Robx__+Robn__)+y(11)*params(50)*(1+y(14))/(1+params(16))+(1+y(13))*y(6)/(1+params(16))+params(21)/2*(y(32)-params(70))^2-y(28)*y(16)-x(it_, 14)*y(15)-y(47)-x(it_, 11);
residual(24)= lhs-rhs;
lhs =y(33);
rhs =(y(16)*y(28)*params(10)+y(15)*x(it_, 14)*params(9))/(y(10)*y(27));
residual(25)= lhs-rhs;
lhs =y(40);
rhs =params(45)*params(60)+params(35)*(y(31)-params(45));
residual(26)= lhs-rhs;
lhs =y(35);
rhs =params(16)*params(43)/(1+params(16))+x(it_, 3)+x(it_, 8)-x(it_, 4)-x(it_, 5)+y(8)/(1+params(16));
residual(27)= lhs-rhs;
lhs =y(43);
rhs =x(it_, 3)+x(it_, 8)-x(it_, 4)-x(it_, 5)+y(12);
residual(28)= lhs-rhs;
lhs =y(41);
rhs =params(16)*params(52)/(1+params(16))+x(it_, 6)+x(it_, 9)+x(it_, 7)+y(11)/(1+params(16));
residual(29)= lhs-rhs;
lhs =y(45);
rhs =x(it_, 3)+x(it_, 8)-x(it_, 4)-x(it_, 5);
residual(30)= lhs-rhs;
lhs =y(42);
rhs =(params(16)+params(5))*params(45)+x(it_, 1)+x(it_, 2);
residual(31)= lhs-rhs;
lhs =y(44);
rhs =y(28)*y(16)+x(it_, 14)*y(15);
residual(32)= lhs-rhs;
lhs =y(48);
rhs =params(29)+params(72)*T456;
residual(33)= lhs-rhs;
lhs =y(46);
rhs =y(48)+params(67);
residual(34)= lhs-rhs;
lhs =y(47);
rhs =params(61)+x(it_, 10);
residual(35)= lhs-rhs;
lhs =y(51);
rhs =y(28)/x(it_, 14);
residual(36)= lhs-rhs;
lhs =y(49);
rhs =x(it_, 14)/x(it_, 15);
residual(37)= lhs-rhs;
lhs =y(50);
rhs =x(it_, 14)/x(it_, 16);
residual(38)= lhs-rhs;
lhs =y(53);
rhs =params(16)+y(16)/y(2)-1+y(15)/y(1)-1;
residual(39)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(39, 77);

  %
  % Jacobian matrix
  %

  g1(1,15)=1-T118*T114*y(10)^params(9)*params(49)*1/params(68)*getPowerDeriv(y(15)/params(68),params(65),1);
  g1(1,3)=(-(T118*T110*getPowerDeriv(y(3),params(12)+params(14),1)));
  g1(1,19)=(-(T110*T114*getPowerDeriv(y(19),1-params(14),1)));
  g1(1,10)=(-(T118*T114*T106*getPowerDeriv(y(10),params(9),1)));
  g1(2,16)=1-T138*T134*y(10)^params(10)*params(48)*1/params(69)*getPowerDeriv(y(16)/params(69),params(66),1);
  g1(2,4)=(-(T138*T130*getPowerDeriv(y(4),params(11)+params(15),1)));
  g1(2,20)=(-(T130*T134*getPowerDeriv(y(20),1-params(15),1)));
  g1(2,10)=(-(T138*T134*T127*getPowerDeriv(y(10),params(10),1)));
  g1(3,26)=1;
  g1(3,28)=(-params(36));
  g1(3,77)=(-1);
  g1(4,27)=1;
  g1(4,28)=(-params(37));
  g1(4,77)=(-1);
  g1(5,28)=(-((1-params(23)-params(22))*getPowerDeriv(y(28),1-params(17),1)*T672));
  g1(5,29)=1;
  g1(5,75)=(-(T672*params(22)*getPowerDeriv(x(it_, 14),1-params(17),1)));
  g1(5,76)=(-(T672*params(23)*getPowerDeriv(x(it_, 15),1-params(17),1)));
  g1(6,29)=(-(y(61)/y(59)*(-y(37))/(y(29)*y(29))))/(T164*T164)*T700;
  g1(6,59)=T700*(-y(61))/(y(59)*y(59))/T164;
  g1(6,30)=(-(params(2)*(1+y(36))/((1+params(16))*(1+y(60)))));
  g1(6,60)=(-((-((1+params(16))*params(2)*(1+y(30))*(1+y(36))))/((1+params(16))*(1+y(60))*(1+params(16))*(1+y(60)))));
  g1(6,36)=(-(params(2)*(1+y(30))/((1+params(16))*(1+y(60)))));
  g1(6,37)=T700*(-(y(61)/y(59)*1/y(29)))/(T164*T164);
  g1(6,61)=T700*1/y(59)/T164;
  g1(7,3)=T185*params(38)*(-y(21))/(y(3)*y(3));
  g1(7,17)=(-((1+y(54)/y(17)-params(3))*params(38)*(-y(54))/(y(17)*y(17))+T198*(-y(54))/(y(17)*y(17))-T9*(-y(54))/(y(17)*y(17))*2*(y(54)/y(17)-params(3)-params(16))));
  g1(7,21)=T185*params(38)*1/y(3);
  g1(7,54)=(-((1+y(54)/y(17)-params(3))*params(38)*1/y(17)+T198*1/y(17)-T9*2*(y(54)/y(17)-params(3)-params(16))*1/y(17)));
  g1(7,56)=(-(1/y(58)));
  g1(7,26)=T187*T640;
  g1(7,58)=T187*T647-(-y(56))/(y(58)*y(58));
  g1(7,29)=T187*T184*(1+y(36))*(-y(59))/(y(29)*y(29));
  g1(7,59)=T187*T184*(1+y(36))*1/y(29);
  g1(7,36)=T187*y(59)/y(29)*T184;
  g1(8,4)=T185*params(39)*(-y(22))/(y(4)*y(4));
  g1(8,18)=(-((1+y(55)/y(18)-params(4))*params(39)*(-y(55))/(y(18)*y(18))+T219*(-y(55))/(y(18)*y(18))-T21*(-y(55))/(y(18)*y(18))*2*(y(55)/y(18)-params(4)-params(16))));
  g1(8,22)=T185*params(39)*1/y(4);
  g1(8,55)=(-((1+y(55)/y(18)-params(4))*params(39)*1/y(18)+T219*1/y(18)-T21*2*(y(55)/y(18)-params(4)-params(16))*1/y(18)));
  g1(8,57)=(-(1/y(58)));
  g1(8,26)=T208*T640;
  g1(8,58)=T208*T647-(-y(57))/(y(58)*y(58));
  g1(8,29)=T208*T184*(1+y(36))*(-y(59))/(y(29)*y(29));
  g1(8,59)=T208*T184*(1+y(36))*1/y(29);
  g1(8,36)=T208*y(59)/y(29)*T184;
  g1(9,29)=(-((-(y(59)*(1+y(36))*(1-params(21)*(y(32)-params(70)))))/(y(29)*y(29))));
  g1(9,59)=(-((1+y(36))*(1-params(21)*(y(32)-params(70)))/y(29)));
  g1(9,32)=(-(y(59)*(1+y(36))*(-params(21))/y(29)));
  g1(9,36)=(-(y(59)*(1-params(21)*(y(32)-params(70)))/y(29)));
  g1(9,46)=1;
  g1(10,3)=(-(1-params(3)));
  g1(10,17)=1+params(16);
  g1(10,21)=(-1);
  g1(11,4)=(-(1-params(4)));
  g1(11,18)=1+params(16);
  g1(11,22)=(-1);
  g1(12,16)=y(28)*(1-params(15))/y(20);
  g1(12,20)=(-(y(16)*y(28)*(1-params(15))))/(y(20)*y(20));
  g1(12,23)=(-1);
  g1(12,28)=y(16)*(1-params(15))/y(20);
  g1(13,15)=x(it_, 14)*(1-params(14))/y(19);
  g1(13,19)=(-(y(15)*x(it_, 14)*(1-params(14))))/(y(19)*y(19));
  g1(13,23)=(-1);
  g1(13,75)=y(15)*(1-params(14))/y(19);
  g1(14,16)=y(28)*params(15)/y(4);
  g1(14,4)=(-(y(16)*y(28)*params(15)))/(y(4)*y(4));
  g1(14,25)=(-1);
  g1(14,28)=y(16)*params(15)/y(4);
  g1(15,15)=x(it_, 14)*params(14)/y(3);
  g1(15,3)=(-(y(15)*x(it_, 14)*params(14)))/(y(3)*y(3));
  g1(15,24)=(-1);
  g1(15,75)=y(15)*params(14)/y(3);
  g1(16,16)=(-1);
  g1(16,3)=params(36)*T539;
  g1(16,4)=params(36)*T571;
  g1(16,21)=params(36)*T604;
  g1(16,22)=params(36)*T622;
  g1(16,28)=(y(37)+y(38))*(T50*(1-params(22)-params(23))*getPowerDeriv(y(28),(-params(17)),1)-T39*(1-params(22)-params(23))*getPowerDeriv(y(28),1-params(17),1))/(T50*T50);
  g1(16,5)=y(42)*params(37)*T748;
  g1(16,37)=compn__;
  g1(16,38)=compn__;
  g1(16,42)=params(37)*Jimz__+y(42)*params(37)*T868;
  g1(16,75)=(y(37)+y(38))*(-(T39*params(22)*getPowerDeriv(x(it_, 14),1-params(17),1)))/(T50*T50);
  g1(16,76)=(y(37)+y(38))*(-(T39*params(23)*getPowerDeriv(x(it_, 15),1-params(17),1)))/(T50*T50);
  g1(17,19)=1;
  g1(17,20)=1;
  g1(18,23)=(-(params(63)*params(47)/(1+y(30))));
  g1(18,30)=(-((-(params(47)*y(23)*params(63)+params(63)/(1+params(63))*(y(39)+x(it_, 11))))/((1+y(30))*(1+y(30)))));
  g1(18,38)=1;
  g1(18,39)=T827;
  g1(18,72)=T827;
  g1(19,34)=1;
  g1(20,52)=1;
  g1(20,73)=(-(params(5)*params(46)));
  g1(20,74)=(-(params(5)*params(46)));
  g1(21,27)=params(53)*y(42)*Jimz__;
  g1(21,29)=params(53)*(y(9)-params(16))*y(7)/(1+params(16));
  g1(21,5)=params(53)*y(42)*y(27)*T748;
  g1(21,7)=params(53)*y(29)*(y(9)-params(16))/(1+params(16));
  g1(21,8)=params(53)*(1+params(28))/(1+params(16));
  g1(21,35)=(-params(53));
  g1(21,9)=params(53)*y(29)*y(7)/(1+params(16));
  g1(21,37)=params(53)*(-params(27));
  g1(21,38)=params(53)*(-params(27));
  g1(21,39)=1;
  g1(21,10)=params(53)*(-y(52));
  g1(21,11)=params(53)*(y(14)-params(16))/(1+params(16));
  g1(21,42)=params(53)*(y(27)*Jimz__+y(42)*y(27)*T868);
  g1(21,47)=(-params(53));
  g1(21,14)=params(53)*y(11)/(1+params(16));
  g1(21,52)=params(53)*(-y(10));
  g1(22,27)=(-((1-params(53))*y(42)*Jimz__/(y(37)+y(38))));
  g1(22,29)=(-((1-params(53))*(y(9)-params(16))*y(7)/(1+params(16))/(y(37)+y(38))));
  g1(22,30)=1;
  g1(22,5)=(-((1-params(53))*y(42)*y(27)*T748/(y(37)+y(38))));
  g1(22,7)=(-((1-params(53))*y(29)*(y(9)-params(16))/(1+params(16))/(y(37)+y(38))));
  g1(22,8)=(-((1-params(53))*(1+params(28))/(1+params(16))/(y(37)+y(38))));
  g1(22,35)=(-((-(1-params(53)))/(y(37)+y(38))));
  g1(22,9)=(-((1-params(53))*y(29)*y(7)/(1+params(16))/(y(37)+y(38))));
  g1(22,37)=T822;
  g1(22,38)=T822;
  g1(22,10)=(-((1-params(53))*(-y(52))/(y(37)+y(38))));
  g1(22,11)=(-((1-params(53))*(y(14)-params(16))/(1+params(16))/(y(37)+y(38))));
  g1(22,42)=(-((1-params(53))*(y(27)*Jimz__+y(42)*y(27)*T868)/(y(37)+y(38))));
  g1(22,47)=(-((-(1-params(53)))/(y(37)+y(38))));
  g1(22,14)=(-((1-params(53))*y(11)/(1+params(16))/(y(37)+y(38))));
  g1(22,52)=(-((1-params(53))*(-y(10))/(y(37)+y(38))));
  g1(23,5)=(-(1-params(5)));
  g1(23,31)=1+params(16);
  g1(23,42)=(-1);
  g1(24,15)=x(it_, 14);
  g1(24,16)=y(28);
  g1(24,3)=(-(y(26)*T539));
  g1(24,4)=(-(y(26)*T571));
  g1(24,21)=(-(y(26)*T604));
  g1(24,22)=(-(y(26)*T622));
  g1(24,26)=(-(y(21)+y(22)+Robx__+Robn__));
  g1(24,27)=(-(y(42)*Jimz__));
  g1(24,28)=y(16);
  g1(24,5)=(-(y(42)*y(27)*T748));
  g1(24,6)=(-((1+y(13))/(1+params(16))));
  g1(24,32)=1-params(21)/2*2*(y(32)-params(70));
  g1(24,8)=(-((1+params(28))/(1+params(16))));
  g1(24,35)=1;
  g1(24,37)=(-1);
  g1(24,38)=(-1);
  g1(24,11)=(-(params(50)*(1+y(14))/(1+params(16))));
  g1(24,41)=params(50);
  g1(24,42)=(-(y(27)*Jimz__+y(42)*y(27)*T868));
  g1(24,13)=(-(y(6)/(1+params(16))));
  g1(24,47)=1;
  g1(24,14)=(-(params(50)*y(11)/(1+params(16))));
  g1(24,72)=1;
  g1(24,75)=y(15);
  g1(25,15)=(-(x(it_, 14)*params(9)/(y(10)*y(27))));
  g1(25,16)=(-(y(28)*params(10)/(y(10)*y(27))));
  g1(25,27)=(-((-(y(10)*(y(16)*y(28)*params(10)+y(15)*x(it_, 14)*params(9))))/(y(10)*y(27)*y(10)*y(27))));
  g1(25,28)=(-(y(16)*params(10)/(y(10)*y(27))));
  g1(25,33)=1;
  g1(25,10)=(-((-(y(27)*(y(16)*y(28)*params(10)+y(15)*x(it_, 14)*params(9))))/(y(10)*y(27)*y(10)*y(27))));
  g1(25,75)=(-(y(15)*params(9)/(y(10)*y(27))));
  g1(26,31)=(-params(35));
  g1(26,40)=1;
  g1(27,8)=(-(1/(1+params(16))));
  g1(27,35)=1;
  g1(27,64)=(-1);
  g1(27,65)=1;
  g1(27,66)=1;
  g1(27,69)=(-1);
  g1(28,12)=(-1);
  g1(28,43)=1;
  g1(28,64)=(-1);
  g1(28,65)=1;
  g1(28,66)=1;
  g1(28,69)=(-1);
  g1(29,11)=(-(1/(1+params(16))));
  g1(29,41)=1;
  g1(29,67)=(-1);
  g1(29,68)=(-1);
  g1(29,70)=(-1);
  g1(30,45)=1;
  g1(30,64)=(-1);
  g1(30,65)=1;
  g1(30,66)=1;
  g1(30,69)=(-1);
  g1(31,42)=1;
  g1(31,62)=(-1);
  g1(31,63)=(-1);
  g1(32,15)=(-x(it_, 14));
  g1(32,16)=(-y(28));
  g1(32,28)=(-y(16));
  g1(32,44)=1;
  g1(32,75)=(-y(15));
  g1(33,35)=(-(params(72)*T456*params(71)*1/y(44)));
  g1(33,41)=(-(params(72)*T456*params(71)*params(50)/y(44)));
  g1(33,44)=(-(params(72)*T456*params(71)*((-y(35))/(y(44)*y(44))+(-(params(50)*y(41)))/(y(44)*y(44)))));
  g1(33,48)=1;
  g1(34,46)=1;
  g1(34,48)=(-1);
  g1(35,47)=1;
  g1(35,71)=(-1);
  g1(36,28)=(-(1/x(it_, 14)));
  g1(36,51)=1;
  g1(36,75)=(-((-y(28))/(x(it_, 14)*x(it_, 14))));
  g1(37,49)=1;
  g1(37,75)=(-(1/x(it_, 15)));
  g1(37,76)=(-((-x(it_, 14))/(x(it_, 15)*x(it_, 15))));
  g1(38,50)=1;
  g1(38,75)=(-(1/x(it_, 16)));
  g1(38,77)=(-((-x(it_, 14))/(x(it_, 16)*x(it_, 16))));
  g1(39,1)=(-((-y(15))/(y(1)*y(1))));
  g1(39,15)=(-(1/y(1)));
  g1(39,2)=(-((-y(16))/(y(2)*y(2))));
  g1(39,16)=(-(1/y(2)));
  g1(39,53)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],39,5929);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],39,456533);
end
end
