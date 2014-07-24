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

residual = zeros(41, 1);
Robx__ = params(18)/2*y(3)*(y(25)/y(3)-params(3)-params(29))^2;
Robn__ = params(19)/2*y(4)*(y(26)/y(4)-params(4)-params(29))^2;
compn__ = (1-params(25)-params(26))*y(32)^(-params(30))/(params(26)*x(it_, 24)^(1-params(30))+params(25)*x(it_, 23)^(1-params(30))+(1-params(25)-params(26))*y(32)^(1-params(30)));
Jimz__ = ((params(29)+params(5))*params(63)+(1+y(38)/y(7)-params(5)-params(29))^params(32)*(y(38)-(params(29)+params(5))*params(63)))/y(38);
DD__ = y(38)*y(31)*Jimz__+(1+y(50))*y(12)/(1+params(29))-y(44)+params(42)*(1+y(16))*y(11)/(1+params(29))-params(42)*y(43)+y(33)*(1+y(14))*y(10)/(1+params(29))-y(33)*y(42)+params(60)-(y(47)+y(48))*params(57)-(y(53)+y(54))-y(8)*params(33);
h_target__ = params(57)+(1-params(46))*y(40)/(y(47)+y(48));
T_target__ = params(60)-params(46)*y(40);
T1__ = y(6)+params(49)*(T_target__-y(6))-params(50)*(y(11)-x(it_, 26));
h1__ = y(5)+params(47)*(h_target__-y(5))+(y(11)-x(it_, 26))*params(48)/(y(32)*y(18)+x(it_, 23)*y(17));
hbar_staggered__ = params(57)+x(it_, 16)+x(it_, 17)+x(it_, 18);
h_capped__ = min(h1__,params(52));
Tbar_staggered__ = params(60)+x(it_, 19)+x(it_, 20)+x(it_, 21);
T_capped__ = max(T1__,params(51));
uazuaz__ = params(56)/y(19);
uaz__ = params(56)*y(31)/params(64)/y(19);
foo__ = y(12)/(1+params(29));
int_repayment__ = x(it_, 27)+x(it_, 28);
T9 = params(18)/2;
T21 = params(19)/2;
T39 = (1-params(25)-params(26))*y(32)^(-params(30));
T47 = params(26)*x(it_, 24)^(1-params(30))+params(25)*x(it_, 23)^(1-params(30));
T50 = T47+(1-params(25)-params(26))*y(32)^(1-params(30));
T60 = (1+y(38)/y(7)-params(5)-params(29))^params(32);
T74 = params(13)*(y(17)/params(74))^params(20);
T78 = T74*y(8)^params(14);
T82 = y(3)^(params(16)+params(8));
T86 = y(23)^(1-params(8));
T95 = params(12)*(y(18)/params(75))^params(21);
T98 = T95*y(8)^params(15);
T102 = y(4)^(params(17)+params(9));
T106 = y(24)^(1-params(9));
T124 = T47+y(32)^(1-params(30))*(1-params(26)-params(25));
T132 = y(47)/y(33);
T133 = y(65)/y(63)/T132;
T153 = y(30)/y(62);
T154 = (1+y(49))*y(63)/y(33)*T153;
T156 = 1+params(18)*(y(25)/y(3)-params(3)-params(29));
T167 = params(18)*(y(58)/y(21)-params(3)-params(29));
T177 = 1+params(19)*(y(26)/y(4)-params(4)-params(29));
T188 = params(19)*(y(59)/y(22)-params(4)-params(29));
T352 = exp(params(38)*(y(44)/y(19)+params(42)*y(43)/y(19)-params(61)/params(56)-params(42)*params(67)/params(56)));
T639 = (-params(56))/(y(19)*y(19));
T678 = T9*(y(25)/y(3)-params(3)-params(29))^2+T9*y(3)*(-y(25))/(y(3)*y(3))*2*(y(25)/y(3)-params(3)-params(29));
T711 = T21*(y(26)/y(4)-params(4)-params(29))^2+T21*y(4)*(-y(26))/(y(4)*y(4))*2*(y(26)/y(4)-params(4)-params(29));
T745 = 1+T9*y(3)*2*(y(25)/y(3)-params(3)-params(29))*1/y(3);
T764 = 1+T21*y(4)*2*(y(26)/y(4)-params(4)-params(29))*1/y(4);
T783 = (1+y(49))*y(63)/y(33)*1/y(62);
T790 = (1+y(49))*y(63)/y(33)*(-y(30))/(y(62)*y(62));
T814 = getPowerDeriv(T124,1/(1-params(30)),1);
T850 = getPowerDeriv(T133,1/params(27),1);
T905 = (-(params(40)/(1+params(40))/(1+y(34))));
T910 = getPowerDeriv(1+y(38)/y(7)-params(5)-params(29),params(32),1);
T913 = (y(38)-(params(29)+params(5))*params(63))*(-y(38))/(y(7)*y(7))*T910/y(38);
T943 = (y(38)*(T60+(y(38)-(params(29)+params(5))*params(63))*T910*1/y(7))-((params(29)+params(5))*params(63)+T60*(y(38)-(params(29)+params(5))*params(63))))/(y(38)*y(38));
T1015 = (-(params(53)*(params(52)>h1__)*params(47)*(-((1-params(46))*y(40)))/((y(47)+y(48))*(y(47)+y(48)))));
T1035 = (-(1/uazuaz__));
lhs =y(17);
rhs =T78*T82*T86;
residual(1)= lhs-rhs;
lhs =y(18);
rhs =T98*T102*T106;
residual(2)= lhs-rhs;
lhs =y(30);
rhs =x(it_, 25)+y(32)*params(10);
residual(3)= lhs-rhs;
lhs =y(31);
rhs =x(it_, 25)+y(32)*params(11);
residual(4)= lhs-rhs;
lhs =y(33);
rhs =T124^(1/(1-params(30)));
residual(5)= lhs-rhs;
lhs =T133^(1/params(27));
rhs =params(2)*(1+y(34))*(1+y(49))/((1+y(64))*(1+params(29)));
residual(6)= lhs-rhs;
lhs =T154*T156;
rhs =y(60)/y(62)+1-params(3)+T167*(1+y(58)/y(21)-params(3))-T9*(y(58)/y(21)-params(3)-params(29))^2;
residual(7)= lhs-rhs;
lhs =T154*T177;
rhs =y(61)/y(62)+1-params(4)+T188*(1+y(59)/y(22)-params(4))-T21*(y(59)/y(22)-params(4)-params(29))^2;
residual(8)= lhs-rhs;
lhs =1+y(51);
rhs =y(63)*(1+y(49))*(1-params(31)*(y(41)-params(76)))/y(33);
residual(9)= lhs-rhs;
lhs =(1+params(29))*y(21);
rhs =y(25)+y(3)*(1-params(3));
residual(10)= lhs-rhs;
lhs =(1+params(29))*y(22);
rhs =y(26)+y(4)*(1-params(4));
residual(11)= lhs-rhs;
lhs =(1+params(29))*y(36);
rhs =y(38)+y(7)*(1-params(5));
residual(12)= lhs-rhs;
lhs =y(37);
rhs =params(63)*params(35)+params(34)*(y(36)-params(63));
residual(13)= lhs-rhs;
lhs =y(18)*y(32)*(1-params(9))/y(24);
rhs =y(29);
residual(14)= lhs-rhs;
lhs =y(17)*x(it_, 23)*(1-params(8))/y(23);
rhs =y(29);
residual(15)= lhs-rhs;
lhs =y(18)*y(32)*params(9)/y(4);
rhs =y(28);
residual(16)= lhs-rhs;
lhs =y(17)*x(it_, 23)*params(8)/y(3);
rhs =y(27);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =compn__*(y(47)+y(48))+params(10)*(y(25)+y(26)+Robx__+Robn__)+y(38)*params(11)*Jimz__;
residual(18)= lhs-rhs;
lhs =y(23)+y(24);
rhs =(1+params(40))*params(65);
residual(19)= lhs-rhs;
lhs =y(41)+y(44)+params(42)*y(43);
rhs =y(47)+y(48)+y(30)*(y(25)+y(26)+Robx__+Robn__)+y(38)*y(31)*Jimz__+(1+y(50))*y(12)/(1+params(29))+params(42)*(1+y(16))*y(11)/(1+params(29))+(1+y(15))*y(9)/(1+params(29))+params(31)/2*(y(41)-params(76))^2-y(32)*y(18)-x(it_, 23)*y(17)-(y(53)+y(54))-x(it_, 22);
residual(20)= lhs-rhs;
lhs =y(48);
rhs =(params(65)*y(29)*params(40)+params(40)/(1+params(40))*(x(it_, 22)+y(35)))/(1+y(34));
residual(21)= lhs-rhs;
lhs =y(39);
rhs =(y(18)*y(32)*params(15)+y(17)*x(it_, 23)*params(14))/(y(8)*y(31));
residual(22)= lhs-rhs;
lhs =y(52);
rhs =params(36)+params(39)*T352;
residual(23)= lhs-rhs;
lhs =y(51);
rhs =y(52)+params(37);
residual(24)= lhs-rhs;
lhs =y(19);
rhs =y(32)*y(18)+x(it_, 23)*y(17);
residual(25)= lhs-rhs;
lhs =y(20);
rhs =params(29)+(y(18)-y(2))/y(2)+(y(17)-y(1))/y(1);
residual(26)= lhs-rhs;
lhs =(y(47)+y(48))*(y(34)-params(57))-(y(35)-params(60));
rhs =DD__;
residual(27)= lhs-rhs;
lhs =y(40);
rhs =(y(47)+y(48))*(y(34)-params(57))+params(42)*y(43)-params(42)*y(11)+y(33)*y(42)-y(33)*y(10)-(y(35)-params(60));
residual(28)= lhs-rhs;
lhs =y(34);
rhs =params(53)*h_capped__+(1-params(53))*hbar_staggered__;
residual(29)= lhs-rhs;
lhs =y(35);
rhs =params(54)*T_capped__+(1-params(54))*Tbar_staggered__;
residual(30)= lhs-rhs;
lhs =y(42);
rhs =params(62);
residual(31)= lhs-rhs;
lhs =y(44);
rhs =params(29)*params(61)/(1+params(29))+y(12)/(1+params(29))+x(it_, 4)/uazuaz__+x(it_, 5)/uazuaz__+x(it_, 6)/uazuaz__;
residual(32)= lhs-rhs;
lhs =y(46);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5);
residual(33)= lhs-rhs;
lhs =y(45);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5)+y(13);
residual(34)= lhs-rhs;
lhs =y(38)*uaz__;
rhs =(params(29)+params(5))*params(63)+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(35)= lhs-rhs;
lhs =y(53)*uazuaz__;
rhs =params(70)+x(it_, 10)+x(it_, 11)+x(it_, 12);
residual(36)= lhs-rhs;
lhs =y(54)*uazuaz__;
rhs =params(71)+x(it_, 13)+x(it_, 14)+x(it_, 15);
residual(37)= lhs-rhs;
lhs =y(50)*foo__;
rhs =int_repayment__/uazuaz__;
residual(38)= lhs-rhs;
lhs =y(57);
rhs =y(32)/x(it_, 23);
residual(39)= lhs-rhs;
lhs =y(55);
rhs =x(it_, 23)/x(it_, 24);
residual(40)= lhs-rhs;
lhs =y(56);
rhs =x(it_, 23)/x(it_, 25);
residual(41)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(41, 93);

  %
  % Jacobian matrix
  %

  g1(1,17)=1-T86*T82*y(8)^params(14)*params(13)*1/params(74)*getPowerDeriv(y(17)/params(74),params(20),1);
  g1(1,3)=(-(T86*T78*getPowerDeriv(y(3),params(16)+params(8),1)));
  g1(1,23)=(-(T78*T82*getPowerDeriv(y(23),1-params(8),1)));
  g1(1,8)=(-(T86*T82*T74*getPowerDeriv(y(8),params(14),1)));
  g1(2,18)=1-T106*T102*y(8)^params(15)*params(12)*1/params(75)*getPowerDeriv(y(18)/params(75),params(21),1);
  g1(2,4)=(-(T106*T98*getPowerDeriv(y(4),params(17)+params(9),1)));
  g1(2,24)=(-(T98*T102*getPowerDeriv(y(24),1-params(9),1)));
  g1(2,8)=(-(T106*T102*T95*getPowerDeriv(y(8),params(15),1)));
  g1(3,30)=1;
  g1(3,32)=(-params(10));
  g1(3,90)=(-1);
  g1(4,31)=1;
  g1(4,32)=(-params(11));
  g1(4,90)=(-1);
  g1(5,32)=(-((1-params(26)-params(25))*getPowerDeriv(y(32),1-params(30),1)*T814));
  g1(5,33)=1;
  g1(5,88)=(-(T814*params(25)*getPowerDeriv(x(it_, 23),1-params(30),1)));
  g1(5,89)=(-(T814*params(26)*getPowerDeriv(x(it_, 24),1-params(30),1)));
  g1(6,33)=(-(y(65)/y(63)*(-y(47))/(y(33)*y(33))))/(T132*T132)*T850;
  g1(6,63)=T850*(-y(65))/(y(63)*y(63))/T132;
  g1(6,34)=(-(params(2)*(1+y(49))/((1+y(64))*(1+params(29)))));
  g1(6,64)=(-((-(params(2)*(1+y(34))*(1+y(49))*(1+params(29))))/((1+y(64))*(1+params(29))*(1+y(64))*(1+params(29)))));
  g1(6,47)=T850*(-(y(65)/y(63)*1/y(33)))/(T132*T132);
  g1(6,65)=T850*1/y(63)/T132;
  g1(6,49)=(-(params(2)*(1+y(34))/((1+y(64))*(1+params(29)))));
  g1(7,3)=T154*params(18)*(-y(25))/(y(3)*y(3));
  g1(7,21)=(-((1+y(58)/y(21)-params(3))*params(18)*(-y(58))/(y(21)*y(21))+T167*(-y(58))/(y(21)*y(21))-T9*(-y(58))/(y(21)*y(21))*2*(y(58)/y(21)-params(3)-params(29))));
  g1(7,25)=T154*params(18)*1/y(3);
  g1(7,58)=(-((1+y(58)/y(21)-params(3))*params(18)*1/y(21)+T167*1/y(21)-T9*2*(y(58)/y(21)-params(3)-params(29))*1/y(21)));
  g1(7,60)=(-(1/y(62)));
  g1(7,30)=T156*T783;
  g1(7,62)=T156*T790-(-y(60))/(y(62)*y(62));
  g1(7,33)=T156*T153*(1+y(49))*(-y(63))/(y(33)*y(33));
  g1(7,63)=T156*T153*(1+y(49))*1/y(33);
  g1(7,49)=T156*y(63)/y(33)*T153;
  g1(8,4)=T154*params(19)*(-y(26))/(y(4)*y(4));
  g1(8,22)=(-((1+y(59)/y(22)-params(4))*params(19)*(-y(59))/(y(22)*y(22))+T188*(-y(59))/(y(22)*y(22))-T21*(-y(59))/(y(22)*y(22))*2*(y(59)/y(22)-params(4)-params(29))));
  g1(8,26)=T154*params(19)*1/y(4);
  g1(8,59)=(-((1+y(59)/y(22)-params(4))*params(19)*1/y(22)+T188*1/y(22)-T21*2*(y(59)/y(22)-params(4)-params(29))*1/y(22)));
  g1(8,61)=(-(1/y(62)));
  g1(8,30)=T177*T783;
  g1(8,62)=T177*T790-(-y(61))/(y(62)*y(62));
  g1(8,33)=T177*T153*(1+y(49))*(-y(63))/(y(33)*y(33));
  g1(8,63)=T177*T153*(1+y(49))*1/y(33);
  g1(8,49)=T177*y(63)/y(33)*T153;
  g1(9,33)=(-((-(y(63)*(1+y(49))*(1-params(31)*(y(41)-params(76)))))/(y(33)*y(33))));
  g1(9,63)=(-((1+y(49))*(1-params(31)*(y(41)-params(76)))/y(33)));
  g1(9,41)=(-(y(63)*(1+y(49))*(-params(31))/y(33)));
  g1(9,49)=(-(y(63)*(1-params(31)*(y(41)-params(76)))/y(33)));
  g1(9,51)=1;
  g1(10,3)=(-(1-params(3)));
  g1(10,21)=1+params(29);
  g1(10,25)=(-1);
  g1(11,4)=(-(1-params(4)));
  g1(11,22)=1+params(29);
  g1(11,26)=(-1);
  g1(12,7)=(-(1-params(5)));
  g1(12,36)=1+params(29);
  g1(12,38)=(-1);
  g1(13,36)=(-params(34));
  g1(13,37)=1;
  g1(14,18)=y(32)*(1-params(9))/y(24);
  g1(14,24)=(-(y(18)*y(32)*(1-params(9))))/(y(24)*y(24));
  g1(14,29)=(-1);
  g1(14,32)=y(18)*(1-params(9))/y(24);
  g1(15,17)=x(it_, 23)*(1-params(8))/y(23);
  g1(15,23)=(-(y(17)*x(it_, 23)*(1-params(8))))/(y(23)*y(23));
  g1(15,29)=(-1);
  g1(15,88)=y(17)*(1-params(8))/y(23);
  g1(16,18)=y(32)*params(9)/y(4);
  g1(16,4)=(-(y(18)*y(32)*params(9)))/(y(4)*y(4));
  g1(16,28)=(-1);
  g1(16,32)=y(18)*params(9)/y(4);
  g1(17,17)=x(it_, 23)*params(8)/y(3);
  g1(17,3)=(-(y(17)*x(it_, 23)*params(8)))/(y(3)*y(3));
  g1(17,27)=(-1);
  g1(17,88)=y(17)*params(8)/y(3);
  g1(18,18)=1;
  g1(18,3)=(-(params(10)*T678));
  g1(18,4)=(-(params(10)*T711));
  g1(18,25)=(-(params(10)*T745));
  g1(18,26)=(-(params(10)*T764));
  g1(18,32)=(-((y(47)+y(48))*(T50*(1-params(25)-params(26))*getPowerDeriv(y(32),(-params(30)),1)-T39*(1-params(25)-params(26))*getPowerDeriv(y(32),1-params(30),1))/(T50*T50)));
  g1(18,7)=(-(y(38)*params(11)*T913));
  g1(18,38)=(-(params(11)*Jimz__+y(38)*params(11)*T943));
  g1(18,47)=(-compn__);
  g1(18,48)=(-compn__);
  g1(18,88)=(-((y(47)+y(48))*(-(T39*params(25)*getPowerDeriv(x(it_, 23),1-params(30),1)))/(T50*T50)));
  g1(18,89)=(-((y(47)+y(48))*(-(T39*params(26)*getPowerDeriv(x(it_, 24),1-params(30),1)))/(T50*T50)));
  g1(19,23)=1;
  g1(19,24)=1;
  g1(20,17)=x(it_, 23);
  g1(20,18)=y(32);
  g1(20,3)=(-(y(30)*T678));
  g1(20,4)=(-(y(30)*T711));
  g1(20,25)=(-(y(30)*T745));
  g1(20,26)=(-(y(30)*T764));
  g1(20,30)=(-(y(25)+y(26)+Robx__+Robn__));
  g1(20,31)=(-(y(38)*Jimz__));
  g1(20,32)=y(18);
  g1(20,7)=(-(y(38)*y(31)*T913));
  g1(20,38)=(-(y(31)*Jimz__+y(38)*y(31)*T943));
  g1(20,9)=(-((1+y(15))/(1+params(29))));
  g1(20,41)=1-params(31)/2*2*(y(41)-params(76));
  g1(20,11)=(-(params(42)*(1+y(16))/(1+params(29))));
  g1(20,43)=params(42);
  g1(20,12)=(-((1+y(50))/(1+params(29))));
  g1(20,44)=1;
  g1(20,47)=(-1);
  g1(20,48)=(-1);
  g1(20,50)=(-(y(12)/(1+params(29))));
  g1(20,15)=(-(y(9)/(1+params(29))));
  g1(20,16)=(-(params(42)*y(11)/(1+params(29))));
  g1(20,53)=1;
  g1(20,54)=1;
  g1(20,87)=1;
  g1(20,88)=y(17);
  g1(21,29)=(-(params(40)*params(65)/(1+y(34))));
  g1(21,34)=(-((-(params(65)*y(29)*params(40)+params(40)/(1+params(40))*(x(it_, 22)+y(35))))/((1+y(34))*(1+y(34)))));
  g1(21,35)=T905;
  g1(21,48)=1;
  g1(21,87)=T905;
  g1(22,17)=(-(x(it_, 23)*params(14)/(y(8)*y(31))));
  g1(22,18)=(-(y(32)*params(15)/(y(8)*y(31))));
  g1(22,31)=(-((-(y(8)*(y(18)*y(32)*params(15)+y(17)*x(it_, 23)*params(14))))/(y(8)*y(31)*y(8)*y(31))));
  g1(22,32)=(-(y(18)*params(15)/(y(8)*y(31))));
  g1(22,8)=(-((-(y(31)*(y(18)*y(32)*params(15)+y(17)*x(it_, 23)*params(14))))/(y(8)*y(31)*y(8)*y(31))));
  g1(22,39)=1;
  g1(22,88)=(-(y(17)*params(14)/(y(8)*y(31))));
  g1(23,19)=(-(params(39)*T352*params(38)*((-y(44))/(y(19)*y(19))+(-(params(42)*y(43)))/(y(19)*y(19)))));
  g1(23,43)=(-(params(39)*T352*params(38)*params(42)/y(19)));
  g1(23,44)=(-(params(39)*T352*params(38)*1/y(19)));
  g1(23,52)=1;
  g1(24,51)=1;
  g1(24,52)=(-1);
  g1(25,17)=(-x(it_, 23));
  g1(25,18)=(-y(32));
  g1(25,19)=1;
  g1(25,32)=(-y(18));
  g1(25,88)=(-y(17));
  g1(26,1)=(-(((-y(1))-(y(17)-y(1)))/(y(1)*y(1))));
  g1(26,17)=(-(1/y(1)));
  g1(26,2)=(-(((-y(2))-(y(18)-y(2)))/(y(2)*y(2))));
  g1(26,18)=(-(1/y(2)));
  g1(26,20)=1;
  g1(27,31)=(-(y(38)*Jimz__));
  g1(27,33)=(-((1+y(14))*y(10)/(1+params(29))-y(42)));
  g1(27,34)=y(47)+y(48);
  g1(27,35)=(-1);
  g1(27,7)=(-(y(38)*y(31)*T913));
  g1(27,8)=params(33);
  g1(27,38)=(-(y(31)*Jimz__+y(38)*y(31)*T943));
  g1(27,10)=(-(y(33)*(1+y(14))/(1+params(29))));
  g1(27,42)=y(33);
  g1(27,11)=(-(params(42)*(1+y(16))/(1+params(29))));
  g1(27,43)=params(42);
  g1(27,12)=(-((1+y(50))/(1+params(29))));
  g1(27,44)=1;
  g1(27,47)=y(34)-params(57)-(-params(57));
  g1(27,48)=y(34)-params(57)-(-params(57));
  g1(27,14)=(-(y(33)*y(10)/(1+params(29))));
  g1(27,50)=(-(y(12)/(1+params(29))));
  g1(27,16)=(-(params(42)*y(11)/(1+params(29))));
  g1(27,53)=1;
  g1(27,54)=1;
  g1(28,33)=(-(y(42)-y(10)));
  g1(28,34)=(-(y(47)+y(48)));
  g1(28,35)=1;
  g1(28,40)=1;
  g1(28,10)=y(33);
  g1(28,42)=(-y(33));
  g1(28,11)=params(42);
  g1(28,43)=(-params(42));
  g1(28,47)=(-(y(34)-params(57)));
  g1(28,48)=(-(y(34)-params(57)));
  g1(29,17)=(-(params(53)*(-(x(it_, 23)*(y(11)-x(it_, 26))*params(48)))/((y(32)*y(18)+x(it_, 23)*y(17))*(y(32)*y(18)+x(it_, 23)*y(17)))*(params(52)>h1__)));
  g1(29,18)=(-(params(53)*(params(52)>h1__)*(-(y(32)*(y(11)-x(it_, 26))*params(48)))/((y(32)*y(18)+x(it_, 23)*y(17))*(y(32)*y(18)+x(it_, 23)*y(17)))));
  g1(29,32)=(-(params(53)*(params(52)>h1__)*(-(y(18)*(y(11)-x(it_, 26))*params(48)))/((y(32)*y(18)+x(it_, 23)*y(17))*(y(32)*y(18)+x(it_, 23)*y(17)))));
  g1(29,5)=(-(params(53)*(params(52)>h1__)*(1-params(47))));
  g1(29,34)=1;
  g1(29,40)=(-(params(53)*(params(52)>h1__)*params(47)*(1-params(46))/(y(47)+y(48))));
  g1(29,11)=(-(params(53)*(params(52)>h1__)*params(48)/(y(32)*y(18)+x(it_, 23)*y(17))));
  g1(29,47)=T1015;
  g1(29,48)=T1015;
  g1(29,81)=(-(1-params(53)));
  g1(29,82)=(-(1-params(53)));
  g1(29,83)=(-(1-params(53)));
  g1(29,88)=(-(params(53)*(params(52)>h1__)*(-(y(17)*(y(11)-x(it_, 26))*params(48)))/((y(32)*y(18)+x(it_, 23)*y(17))*(y(32)*y(18)+x(it_, 23)*y(17)))));
  g1(29,91)=(-(params(53)*(params(52)>h1__)*(-params(48))/(y(32)*y(18)+x(it_, 23)*y(17))));
  g1(30,6)=(-(params(54)*(1-params(49))*(T1__>params(51))));
  g1(30,35)=1;
  g1(30,40)=(-(params(54)*(T1__>params(51))*params(49)*(-params(46))));
  g1(30,11)=(-(params(54)*(T1__>params(51))*(-params(50))));
  g1(30,84)=(-(1-params(54)));
  g1(30,85)=(-(1-params(54)));
  g1(30,86)=(-(1-params(54)));
  g1(30,91)=(-(params(54)*params(50)*(T1__>params(51))));
  g1(31,42)=1;
  g1(32,19)=(-((-(x(it_, 4)*T639))/(uazuaz__*uazuaz__)+(-(x(it_, 5)*T639))/(uazuaz__*uazuaz__)+(-(x(it_, 6)*T639))/(uazuaz__*uazuaz__)));
  g1(32,12)=(-(1/(1+params(29))));
  g1(32,44)=1;
  g1(32,69)=T1035;
  g1(32,70)=T1035;
  g1(32,71)=T1035;
  g1(33,46)=1;
  g1(33,69)=(-1);
  g1(33,70)=(-1);
  g1(33,71)=(-1);
  g1(34,13)=(-1);
  g1(34,45)=1;
  g1(34,69)=(-1);
  g1(34,70)=(-1);
  g1(34,71)=(-1);
  g1(35,19)=y(38)*(-(params(56)*y(31)/params(64)))/(y(19)*y(19));
  g1(35,31)=y(38)*params(56)*1/params(64)/y(19);
  g1(35,38)=uaz__;
  g1(35,66)=(-1);
  g1(35,67)=(-1);
  g1(35,68)=(-1);
  g1(36,19)=y(53)*T639;
  g1(36,53)=uazuaz__;
  g1(36,75)=(-1);
  g1(36,76)=(-1);
  g1(36,77)=(-1);
  g1(37,19)=y(54)*T639;
  g1(37,54)=uazuaz__;
  g1(37,78)=(-1);
  g1(37,79)=(-1);
  g1(37,80)=(-1);
  g1(38,19)=(-((-(int_repayment__*T639))/(uazuaz__*uazuaz__)));
  g1(38,12)=y(50)*1/(1+params(29));
  g1(38,50)=foo__;
  g1(38,92)=T1035;
  g1(38,93)=T1035;
  g1(39,32)=(-(1/x(it_, 23)));
  g1(39,57)=1;
  g1(39,88)=(-((-y(32))/(x(it_, 23)*x(it_, 23))));
  g1(40,55)=1;
  g1(40,88)=(-(1/x(it_, 24)));
  g1(40,89)=(-((-x(it_, 23))/(x(it_, 24)*x(it_, 24))));
  g1(41,56)=1;
  g1(41,88)=(-(1/x(it_, 25)));
  g1(41,90)=(-((-x(it_, 23))/(x(it_, 25)*x(it_, 25))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],41,8649);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],41,804357);
end
end
