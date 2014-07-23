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
Robx__ = params(18)/2*y(3)*(y(23)/y(3)-params(3)-params(29))^2;
Robn__ = params(19)/2*y(4)*(y(24)/y(4)-params(4)-params(29))^2;
compn__ = (1-params(25)-params(26))*y(30)^(-params(30))/(params(26)*x(it_, 24)^(1-params(30))+params(25)*x(it_, 23)^(1-params(30))+(1-params(25)-params(26))*y(30)^(1-params(30)));
Jimz__ = ((params(29)+params(5))*params(63)+(1+y(36)/y(5)-params(5)-params(29))^params(32)*(y(36)-(params(29)+params(5))*params(63)))/y(36);
DD__ = y(36)*y(29)*Jimz__+(1+y(48))*y(10)/(1+params(29))-y(42)+params(42)*(1+y(14))*y(9)/(1+params(29))-params(42)*y(41)+y(31)*(1+y(12))*y(8)/(1+params(29))-y(31)*y(40)+params(60)-(y(45)+y(46))*params(57)-(y(51)+y(52))-y(6)*params(33);
DDo__ = params(60)+params(61)*(y(48)-params(29))/(1+params(29))+params(67)*params(42)*(params(36)+params(39)-params(29))/(1+params(29))+(params(59)-params(29))*params(62)/(1+params(29))+params(63)*(params(29)+params(5))*params(64)-params(57)*(params(68)+params(69))-(params(70)+params(71))-params(33)*params(73);
h_target__ = params(57)+(1-params(46))*y(38)/(y(45)+y(46));
T_target__ = params(60)-params(46)*y(38);
uazuaz__ = params(56)/y(17);
uaz__ = params(56)*y(29)/params(64)/y(17);
foo__ = y(10)/(1+params(29));
int_repayment__ = x(it_, 27)+x(it_, 28);
T9 = params(18)/2;
T21 = params(19)/2;
T39 = (1-params(25)-params(26))*y(30)^(-params(30));
T47 = params(26)*x(it_, 24)^(1-params(30))+params(25)*x(it_, 23)^(1-params(30));
T50 = T47+(1-params(25)-params(26))*y(30)^(1-params(30));
T60 = (1+y(36)/y(5)-params(5)-params(29))^params(32);
T74 = params(13)*(y(15)/params(74))^params(20);
T78 = T74*y(6)^params(14);
T82 = y(3)^(params(16)+params(8));
T86 = y(21)^(1-params(8));
T95 = params(12)*(y(16)/params(75))^params(21);
T98 = T95*y(6)^params(15);
T102 = y(4)^(params(17)+params(9));
T106 = y(22)^(1-params(9));
T124 = T47+y(30)^(1-params(30))*(1-params(26)-params(25));
T132 = y(45)/y(31);
T133 = y(63)/y(61)/T132;
T153 = y(28)/y(60);
T154 = (1+y(47))*y(61)/y(31)*T153;
T156 = 1+params(18)*(y(23)/y(3)-params(3)-params(29));
T167 = params(18)*(y(56)/y(19)-params(3)-params(29));
T177 = 1+params(19)*(y(24)/y(4)-params(4)-params(29));
T188 = params(19)*(y(57)/y(20)-params(4)-params(29));
T352 = exp(params(38)*(y(42)/y(17)+params(42)*y(41)/y(17)-params(61)/params(56)-params(42)*params(67)/params(56)));
T611 = (-params(56))/(y(17)*y(17));
T662 = T9*(y(23)/y(3)-params(3)-params(29))^2+T9*y(3)*(-y(23))/(y(3)*y(3))*2*(y(23)/y(3)-params(3)-params(29));
T695 = T21*(y(24)/y(4)-params(4)-params(29))^2+T21*y(4)*(-y(24))/(y(4)*y(4))*2*(y(24)/y(4)-params(4)-params(29));
T729 = 1+T9*y(3)*2*(y(23)/y(3)-params(3)-params(29))*1/y(3);
T748 = 1+T21*y(4)*2*(y(24)/y(4)-params(4)-params(29))*1/y(4);
T767 = (1+y(47))*y(61)/y(31)*1/y(60);
T774 = (1+y(47))*y(61)/y(31)*(-y(28))/(y(60)*y(60));
T798 = getPowerDeriv(T124,1/(1-params(30)),1);
T828 = getPowerDeriv(T133,1/params(27),1);
T868 = (-(params(40)/(1+params(40))/(1+y(32))));
T873 = getPowerDeriv(1+y(36)/y(5)-params(5)-params(29),params(32),1);
T876 = (y(36)-(params(29)+params(5))*params(63))*(-y(36))/(y(5)*y(5))*T873/y(36);
T906 = (y(36)*(T60+(y(36)-(params(29)+params(5))*params(63))*T873*1/y(5))-((params(29)+params(5))*params(63)+T60*(y(36)-(params(29)+params(5))*params(63))))/(y(36)*y(36));
T983 = (-(1/uazuaz__));
lhs =y(15);
rhs =T78*T82*T86;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =T98*T102*T106;
residual(2)= lhs-rhs;
lhs =y(28);
rhs =x(it_, 25)+y(30)*params(10);
residual(3)= lhs-rhs;
lhs =y(29);
rhs =x(it_, 25)+y(30)*params(11);
residual(4)= lhs-rhs;
lhs =y(31);
rhs =T124^(1/(1-params(30)));
residual(5)= lhs-rhs;
lhs =T133^(1/params(27));
rhs =params(2)*(1+y(32))*(1+y(47))/((1+y(62))*(1+params(29)));
residual(6)= lhs-rhs;
lhs =T154*T156;
rhs =y(58)/y(60)+1-params(3)+T167*(1+y(56)/y(19)-params(3))-T9*(y(56)/y(19)-params(3)-params(29))^2;
residual(7)= lhs-rhs;
lhs =T154*T177;
rhs =y(59)/y(60)+1-params(4)+T188*(1+y(57)/y(20)-params(4))-T21*(y(57)/y(20)-params(4)-params(29))^2;
residual(8)= lhs-rhs;
lhs =1+y(49);
rhs =y(61)*(1+y(47))*(1-params(31)*(y(39)-params(76)))/y(31);
residual(9)= lhs-rhs;
lhs =(1+params(29))*y(19);
rhs =y(23)+y(3)*(1-params(3));
residual(10)= lhs-rhs;
lhs =(1+params(29))*y(20);
rhs =y(24)+y(4)*(1-params(4));
residual(11)= lhs-rhs;
lhs =(1+params(29))*y(34);
rhs =y(36)+y(5)*(1-params(5));
residual(12)= lhs-rhs;
lhs =y(35);
rhs =params(63)*params(35)+params(34)*(y(34)-params(63));
residual(13)= lhs-rhs;
lhs =y(16)*y(30)*(1-params(9))/y(22);
rhs =y(27);
residual(14)= lhs-rhs;
lhs =y(15)*x(it_, 23)*(1-params(8))/y(21);
rhs =y(27);
residual(15)= lhs-rhs;
lhs =y(16)*y(30)*params(9)/y(4);
rhs =y(26);
residual(16)= lhs-rhs;
lhs =y(15)*x(it_, 23)*params(8)/y(3);
rhs =y(25);
residual(17)= lhs-rhs;
lhs =y(16);
rhs =compn__*(y(45)+y(46))+params(10)*(y(23)+y(24)+Robx__+Robn__)+y(36)*params(11)*Jimz__;
residual(18)= lhs-rhs;
lhs =y(21)+y(22);
rhs =(1+params(40))*params(65);
residual(19)= lhs-rhs;
lhs =y(39)+y(42)+params(42)*y(41);
rhs =y(45)+y(46)+y(28)*(y(23)+y(24)+Robx__+Robn__)+y(36)*y(29)*Jimz__+(1+y(48))*y(10)/(1+params(29))+params(42)*(1+y(14))*y(9)/(1+params(29))+(1+y(13))*y(7)/(1+params(29))+params(31)/2*(y(39)-params(76))^2-y(30)*y(16)-x(it_, 23)*y(15)-(y(51)+y(52))-x(it_, 22);
residual(20)= lhs-rhs;
lhs =y(46);
rhs =(params(65)*y(27)*params(40)+params(40)/(1+params(40))*(x(it_, 22)+y(33)))/(1+y(32));
residual(21)= lhs-rhs;
lhs =y(37);
rhs =(y(16)*y(30)*params(15)+y(15)*x(it_, 23)*params(14))/(y(6)*y(29));
residual(22)= lhs-rhs;
lhs =y(50);
rhs =params(36)+params(39)*T352;
residual(23)= lhs-rhs;
lhs =y(49);
rhs =y(50)+params(37);
residual(24)= lhs-rhs;
lhs =y(17);
rhs =y(30)*y(16)+x(it_, 23)*y(15);
residual(25)= lhs-rhs;
lhs =y(18);
rhs =params(29)+(y(16)-y(2))/y(2)+(y(15)-y(1))/y(1);
residual(26)= lhs-rhs;
lhs =y(38);
rhs =DD__-DDo__;
residual(27)= lhs-rhs;
lhs =y(33);
rhs =T_target__;
residual(28)= lhs-rhs;
lhs =y(32);
rhs =h_target__;
residual(29)= lhs-rhs;
lhs =y(40);
rhs =params(62);
residual(30)= lhs-rhs;
lhs =y(42);
rhs =params(29)*params(61)/(1+params(29))+y(10)/(1+params(29))+x(it_, 4)/uazuaz__+x(it_, 5)/uazuaz__+x(it_, 6)/uazuaz__;
residual(31)= lhs-rhs;
lhs =y(44);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5);
residual(32)= lhs-rhs;
lhs =y(43);
rhs =x(it_, 6)+x(it_, 4)+x(it_, 5)+y(11);
residual(33)= lhs-rhs;
lhs =y(41);
rhs =x(it_, 7)/uazuaz__+x(it_, 8)/uazuaz__+x(it_, 9)/uazuaz__+y(9)/(1+params(29));
residual(34)= lhs-rhs;
lhs =y(36)*uaz__;
rhs =(params(29)+params(5))*params(63)+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(35)= lhs-rhs;
lhs =y(51)*uazuaz__;
rhs =params(70)+x(it_, 10)+x(it_, 11)+x(it_, 12);
residual(36)= lhs-rhs;
lhs =y(52)*uazuaz__;
rhs =params(71)+x(it_, 13)+x(it_, 14)+x(it_, 15);
residual(37)= lhs-rhs;
lhs =y(48)*foo__;
rhs =int_repayment__/uazuaz__;
residual(38)= lhs-rhs;
lhs =y(55);
rhs =y(30)/x(it_, 23);
residual(39)= lhs-rhs;
lhs =y(53);
rhs =x(it_, 23)/x(it_, 24);
residual(40)= lhs-rhs;
lhs =y(54);
rhs =x(it_, 23)/x(it_, 25);
residual(41)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(41, 91);

  %
  % Jacobian matrix
  %

  g1(1,15)=1-T86*T82*y(6)^params(14)*params(13)*1/params(74)*getPowerDeriv(y(15)/params(74),params(20),1);
  g1(1,3)=(-(T86*T78*getPowerDeriv(y(3),params(16)+params(8),1)));
  g1(1,21)=(-(T78*T82*getPowerDeriv(y(21),1-params(8),1)));
  g1(1,6)=(-(T86*T82*T74*getPowerDeriv(y(6),params(14),1)));
  g1(2,16)=1-T106*T102*y(6)^params(15)*params(12)*1/params(75)*getPowerDeriv(y(16)/params(75),params(21),1);
  g1(2,4)=(-(T106*T98*getPowerDeriv(y(4),params(17)+params(9),1)));
  g1(2,22)=(-(T98*T102*getPowerDeriv(y(22),1-params(9),1)));
  g1(2,6)=(-(T106*T102*T95*getPowerDeriv(y(6),params(15),1)));
  g1(3,28)=1;
  g1(3,30)=(-params(10));
  g1(3,88)=(-1);
  g1(4,29)=1;
  g1(4,30)=(-params(11));
  g1(4,88)=(-1);
  g1(5,30)=(-((1-params(26)-params(25))*getPowerDeriv(y(30),1-params(30),1)*T798));
  g1(5,31)=1;
  g1(5,86)=(-(T798*params(25)*getPowerDeriv(x(it_, 23),1-params(30),1)));
  g1(5,87)=(-(T798*params(26)*getPowerDeriv(x(it_, 24),1-params(30),1)));
  g1(6,31)=(-(y(63)/y(61)*(-y(45))/(y(31)*y(31))))/(T132*T132)*T828;
  g1(6,61)=T828*(-y(63))/(y(61)*y(61))/T132;
  g1(6,32)=(-(params(2)*(1+y(47))/((1+y(62))*(1+params(29)))));
  g1(6,62)=(-((-(params(2)*(1+y(32))*(1+y(47))*(1+params(29))))/((1+y(62))*(1+params(29))*(1+y(62))*(1+params(29)))));
  g1(6,45)=T828*(-(y(63)/y(61)*1/y(31)))/(T132*T132);
  g1(6,63)=T828*1/y(61)/T132;
  g1(6,47)=(-(params(2)*(1+y(32))/((1+y(62))*(1+params(29)))));
  g1(7,3)=T154*params(18)*(-y(23))/(y(3)*y(3));
  g1(7,19)=(-((1+y(56)/y(19)-params(3))*params(18)*(-y(56))/(y(19)*y(19))+T167*(-y(56))/(y(19)*y(19))-T9*(-y(56))/(y(19)*y(19))*2*(y(56)/y(19)-params(3)-params(29))));
  g1(7,23)=T154*params(18)*1/y(3);
  g1(7,56)=(-((1+y(56)/y(19)-params(3))*params(18)*1/y(19)+T167*1/y(19)-T9*2*(y(56)/y(19)-params(3)-params(29))*1/y(19)));
  g1(7,58)=(-(1/y(60)));
  g1(7,28)=T156*T767;
  g1(7,60)=T156*T774-(-y(58))/(y(60)*y(60));
  g1(7,31)=T156*T153*(1+y(47))*(-y(61))/(y(31)*y(31));
  g1(7,61)=T156*T153*(1+y(47))*1/y(31);
  g1(7,47)=T156*y(61)/y(31)*T153;
  g1(8,4)=T154*params(19)*(-y(24))/(y(4)*y(4));
  g1(8,20)=(-((1+y(57)/y(20)-params(4))*params(19)*(-y(57))/(y(20)*y(20))+T188*(-y(57))/(y(20)*y(20))-T21*(-y(57))/(y(20)*y(20))*2*(y(57)/y(20)-params(4)-params(29))));
  g1(8,24)=T154*params(19)*1/y(4);
  g1(8,57)=(-((1+y(57)/y(20)-params(4))*params(19)*1/y(20)+T188*1/y(20)-T21*2*(y(57)/y(20)-params(4)-params(29))*1/y(20)));
  g1(8,59)=(-(1/y(60)));
  g1(8,28)=T177*T767;
  g1(8,60)=T177*T774-(-y(59))/(y(60)*y(60));
  g1(8,31)=T177*T153*(1+y(47))*(-y(61))/(y(31)*y(31));
  g1(8,61)=T177*T153*(1+y(47))*1/y(31);
  g1(8,47)=T177*y(61)/y(31)*T153;
  g1(9,31)=(-((-(y(61)*(1+y(47))*(1-params(31)*(y(39)-params(76)))))/(y(31)*y(31))));
  g1(9,61)=(-((1+y(47))*(1-params(31)*(y(39)-params(76)))/y(31)));
  g1(9,39)=(-(y(61)*(1+y(47))*(-params(31))/y(31)));
  g1(9,47)=(-(y(61)*(1-params(31)*(y(39)-params(76)))/y(31)));
  g1(9,49)=1;
  g1(10,3)=(-(1-params(3)));
  g1(10,19)=1+params(29);
  g1(10,23)=(-1);
  g1(11,4)=(-(1-params(4)));
  g1(11,20)=1+params(29);
  g1(11,24)=(-1);
  g1(12,5)=(-(1-params(5)));
  g1(12,34)=1+params(29);
  g1(12,36)=(-1);
  g1(13,34)=(-params(34));
  g1(13,35)=1;
  g1(14,16)=y(30)*(1-params(9))/y(22);
  g1(14,22)=(-(y(16)*y(30)*(1-params(9))))/(y(22)*y(22));
  g1(14,27)=(-1);
  g1(14,30)=y(16)*(1-params(9))/y(22);
  g1(15,15)=x(it_, 23)*(1-params(8))/y(21);
  g1(15,21)=(-(y(15)*x(it_, 23)*(1-params(8))))/(y(21)*y(21));
  g1(15,27)=(-1);
  g1(15,86)=y(15)*(1-params(8))/y(21);
  g1(16,16)=y(30)*params(9)/y(4);
  g1(16,4)=(-(y(16)*y(30)*params(9)))/(y(4)*y(4));
  g1(16,26)=(-1);
  g1(16,30)=y(16)*params(9)/y(4);
  g1(17,15)=x(it_, 23)*params(8)/y(3);
  g1(17,3)=(-(y(15)*x(it_, 23)*params(8)))/(y(3)*y(3));
  g1(17,25)=(-1);
  g1(17,86)=y(15)*params(8)/y(3);
  g1(18,16)=1;
  g1(18,3)=(-(params(10)*T662));
  g1(18,4)=(-(params(10)*T695));
  g1(18,23)=(-(params(10)*T729));
  g1(18,24)=(-(params(10)*T748));
  g1(18,30)=(-((y(45)+y(46))*(T50*(1-params(25)-params(26))*getPowerDeriv(y(30),(-params(30)),1)-T39*(1-params(25)-params(26))*getPowerDeriv(y(30),1-params(30),1))/(T50*T50)));
  g1(18,5)=(-(y(36)*params(11)*T876));
  g1(18,36)=(-(params(11)*Jimz__+y(36)*params(11)*T906));
  g1(18,45)=(-compn__);
  g1(18,46)=(-compn__);
  g1(18,86)=(-((y(45)+y(46))*(-(T39*params(25)*getPowerDeriv(x(it_, 23),1-params(30),1)))/(T50*T50)));
  g1(18,87)=(-((y(45)+y(46))*(-(T39*params(26)*getPowerDeriv(x(it_, 24),1-params(30),1)))/(T50*T50)));
  g1(19,21)=1;
  g1(19,22)=1;
  g1(20,15)=x(it_, 23);
  g1(20,16)=y(30);
  g1(20,3)=(-(y(28)*T662));
  g1(20,4)=(-(y(28)*T695));
  g1(20,23)=(-(y(28)*T729));
  g1(20,24)=(-(y(28)*T748));
  g1(20,28)=(-(y(23)+y(24)+Robx__+Robn__));
  g1(20,29)=(-(y(36)*Jimz__));
  g1(20,30)=y(16);
  g1(20,5)=(-(y(36)*y(29)*T876));
  g1(20,36)=(-(y(29)*Jimz__+y(36)*y(29)*T906));
  g1(20,7)=(-((1+y(13))/(1+params(29))));
  g1(20,39)=1-params(31)/2*2*(y(39)-params(76));
  g1(20,9)=(-(params(42)*(1+y(14))/(1+params(29))));
  g1(20,41)=params(42);
  g1(20,10)=(-((1+y(48))/(1+params(29))));
  g1(20,42)=1;
  g1(20,45)=(-1);
  g1(20,46)=(-1);
  g1(20,48)=(-(y(10)/(1+params(29))));
  g1(20,13)=(-(y(7)/(1+params(29))));
  g1(20,14)=(-(params(42)*y(9)/(1+params(29))));
  g1(20,51)=1;
  g1(20,52)=1;
  g1(20,85)=1;
  g1(20,86)=y(15);
  g1(21,27)=(-(params(40)*params(65)/(1+y(32))));
  g1(21,32)=(-((-(params(65)*y(27)*params(40)+params(40)/(1+params(40))*(x(it_, 22)+y(33))))/((1+y(32))*(1+y(32)))));
  g1(21,33)=T868;
  g1(21,46)=1;
  g1(21,85)=T868;
  g1(22,15)=(-(x(it_, 23)*params(14)/(y(6)*y(29))));
  g1(22,16)=(-(y(30)*params(15)/(y(6)*y(29))));
  g1(22,29)=(-((-(y(6)*(y(16)*y(30)*params(15)+y(15)*x(it_, 23)*params(14))))/(y(6)*y(29)*y(6)*y(29))));
  g1(22,30)=(-(y(16)*params(15)/(y(6)*y(29))));
  g1(22,6)=(-((-(y(29)*(y(16)*y(30)*params(15)+y(15)*x(it_, 23)*params(14))))/(y(6)*y(29)*y(6)*y(29))));
  g1(22,37)=1;
  g1(22,86)=(-(y(15)*params(14)/(y(6)*y(29))));
  g1(23,17)=(-(params(39)*T352*params(38)*((-y(42))/(y(17)*y(17))+(-(params(42)*y(41)))/(y(17)*y(17)))));
  g1(23,41)=(-(params(39)*T352*params(38)*params(42)/y(17)));
  g1(23,42)=(-(params(39)*T352*params(38)*1/y(17)));
  g1(23,50)=1;
  g1(24,49)=1;
  g1(24,50)=(-1);
  g1(25,15)=(-x(it_, 23));
  g1(25,16)=(-y(30));
  g1(25,17)=1;
  g1(25,30)=(-y(16));
  g1(25,86)=(-y(15));
  g1(26,1)=(-(((-y(1))-(y(15)-y(1)))/(y(1)*y(1))));
  g1(26,15)=(-(1/y(1)));
  g1(26,2)=(-(((-y(2))-(y(16)-y(2)))/(y(2)*y(2))));
  g1(26,16)=(-(1/y(2)));
  g1(26,18)=1;
  g1(27,29)=(-(y(36)*Jimz__));
  g1(27,31)=(-((1+y(12))*y(8)/(1+params(29))-y(40)));
  g1(27,5)=(-(y(36)*y(29)*T876));
  g1(27,6)=params(33);
  g1(27,36)=(-(y(29)*Jimz__+y(36)*y(29)*T906));
  g1(27,38)=1;
  g1(27,8)=(-(y(31)*(1+y(12))/(1+params(29))));
  g1(27,40)=y(31);
  g1(27,9)=(-(params(42)*(1+y(14))/(1+params(29))));
  g1(27,41)=params(42);
  g1(27,10)=(-((1+y(48))/(1+params(29))));
  g1(27,42)=1;
  g1(27,45)=params(57);
  g1(27,46)=params(57);
  g1(27,12)=(-(y(31)*y(8)/(1+params(29))));
  g1(27,48)=(-(y(10)/(1+params(29))-params(61)/(1+params(29))));
  g1(27,14)=(-(params(42)*y(9)/(1+params(29))));
  g1(27,51)=1;
  g1(27,52)=1;
  g1(28,33)=1;
  g1(28,38)=params(46);
  g1(29,32)=1;
  g1(29,38)=(-((1-params(46))/(y(45)+y(46))));
  g1(29,45)=(-((-((1-params(46))*y(38)))/((y(45)+y(46))*(y(45)+y(46)))));
  g1(29,46)=(-((-((1-params(46))*y(38)))/((y(45)+y(46))*(y(45)+y(46)))));
  g1(30,40)=1;
  g1(31,17)=(-((-(x(it_, 4)*T611))/(uazuaz__*uazuaz__)+(-(x(it_, 5)*T611))/(uazuaz__*uazuaz__)+(-(x(it_, 6)*T611))/(uazuaz__*uazuaz__)));
  g1(31,10)=(-(1/(1+params(29))));
  g1(31,42)=1;
  g1(31,67)=T983;
  g1(31,68)=T983;
  g1(31,69)=T983;
  g1(32,44)=1;
  g1(32,67)=(-1);
  g1(32,68)=(-1);
  g1(32,69)=(-1);
  g1(33,11)=(-1);
  g1(33,43)=1;
  g1(33,67)=(-1);
  g1(33,68)=(-1);
  g1(33,69)=(-1);
  g1(34,17)=(-((-(x(it_, 7)*T611))/(uazuaz__*uazuaz__)+(-(x(it_, 8)*T611))/(uazuaz__*uazuaz__)+(-(x(it_, 9)*T611))/(uazuaz__*uazuaz__)));
  g1(34,9)=(-(1/(1+params(29))));
  g1(34,41)=1;
  g1(34,70)=T983;
  g1(34,71)=T983;
  g1(34,72)=T983;
  g1(35,17)=y(36)*(-(params(56)*y(29)/params(64)))/(y(17)*y(17));
  g1(35,29)=y(36)*params(56)*1/params(64)/y(17);
  g1(35,36)=uaz__;
  g1(35,64)=(-1);
  g1(35,65)=(-1);
  g1(35,66)=(-1);
  g1(36,17)=y(51)*T611;
  g1(36,51)=uazuaz__;
  g1(36,73)=(-1);
  g1(36,74)=(-1);
  g1(36,75)=(-1);
  g1(37,17)=y(52)*T611;
  g1(37,52)=uazuaz__;
  g1(37,76)=(-1);
  g1(37,77)=(-1);
  g1(37,78)=(-1);
  g1(38,17)=(-((-(int_repayment__*T611))/(uazuaz__*uazuaz__)));
  g1(38,10)=y(48)*1/(1+params(29));
  g1(38,48)=foo__;
  g1(38,90)=T983;
  g1(38,91)=T983;
  g1(39,30)=(-(1/x(it_, 23)));
  g1(39,55)=1;
  g1(39,86)=(-((-y(30))/(x(it_, 23)*x(it_, 23))));
  g1(40,53)=1;
  g1(40,86)=(-(1/x(it_, 24)));
  g1(40,87)=(-((-x(it_, 23))/(x(it_, 24)*x(it_, 24))));
  g1(41,54)=1;
  g1(41,86)=(-(1/x(it_, 25)));
  g1(41,88)=(-((-x(it_, 23))/(x(it_, 25)*x(it_, 25))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],41,8281);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],41,753571);
end
end
