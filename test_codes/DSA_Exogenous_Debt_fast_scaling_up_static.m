function [residual, g1, g2] = DSA_Exogenous_Debt_fast_scaling_up_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                    columns: equations in order of declaration
%                                                    rows: variables in declaration order
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: equations in order of declaration
%                                                       rows: variables in declaration order
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 39, 1);

%
% Model equations
%

Robx__ = params(38)/2*y(3)*(y(7)/y(3)-params(3)-params(16))^2;
Robn__ = params(39)/2*y(4)*(y(8)/y(4)-params(4)-params(16))^2;
compn__ = (1-params(22)-params(23))*y(14)^(-params(17))/(params(23)*x(15)^(1-params(17))+params(22)*x(14)^(1-params(17))+(1-params(22)-params(23))*y(14)^(1-params(17)));
Jimz__ = ((params(16)+params(5))*params(45)+(1+y(28)/y(17)-params(5)-params(16))^params(26)*(y(28)-(params(16)+params(5))*params(45)))/y(28);
gap__ = y(28)*y(13)*Jimz__+params(42)+(y(34)-params(16))*y(27)/(1+params(16))+(1+params(28))*y(21)/(1+params(16))+y(15)*(y(22)-params(16))*y(20)/(1+params(16))-y(21)-(y(23)+y(24))*params(27)-y(26)*y(38)-y(33);
T9 = params(38)/2;
T21 = params(39)/2;
T47 = params(23)*x(15)^(1-params(17))+params(22)*x(14)^(1-params(17));
T50 = T47+(1-params(22)-params(23))*y(14)^(1-params(17));
T63 = (1+y(28)/y(17)-params(5)-params(16))^params(26);
T148 = params(49)*(y(1)/params(68))^params(65);
T151 = T148*y(26)^params(9);
T155 = y(3)^(params(12)+params(14));
T159 = y(5)^(1-params(14));
T168 = params(48)*(y(2)/params(69))^params(66);
T171 = T168*y(26)^params(10);
T175 = y(4)^(params(11)+params(15));
T179 = y(6)^(1-params(15));
T195 = T47+y(14)^(1-params(17))*(1-params(23)-params(22));
T211 = params(38)*(y(7)/y(3)-params(3)-params(16));
T222 = T9*(y(7)/y(3)-params(3)-params(16))^2;
T225 = params(39)*(y(8)/y(4)-params(4)-params(16));
T236 = T21*(y(8)/y(4)-params(4)-params(16))^2;
T417 = exp(params(71)*(y(21)/y(30)+params(50)*y(27)/y(30)-params(43)/params(25)-params(50)*params(52)/params(25)));
T477 = (-y(7))/(y(3)*y(3))*2*(y(7)/y(3)-params(3)-params(16));
T502 = (-y(8))/(y(4)*y(4))*2*(y(8)/y(4)-params(4)-params(16));
T532 = 2*(y(7)/y(3)-params(3)-params(16))*1/y(3);
T547 = 2*(y(8)/y(4)-params(4)-params(16))*1/y(4);
T629 = getPowerDeriv(1+y(28)/y(17)-params(5)-params(16),params(26),1);
T632 = (y(28)-(params(16)+params(5))*params(45))*(-y(28))/(y(17)*y(17))*T629/y(28);
T696 = (-(((y(23)+y(24))*(1-params(53))*(-params(27))-gap__*(1-params(53)))/((y(23)+y(24))*(y(23)+y(24)))));
T739 = (y(28)*(T63+(y(28)-(params(16)+params(5))*params(45))*T629*1/y(17))-((params(16)+params(5))*params(45)+T63*(y(28)-(params(16)+params(5))*params(45))))/(y(28)*y(28));
lhs =y(1);
rhs =T151*T155*T159;
residual(1)= lhs-rhs;
lhs =y(2);
rhs =T171*T175*T179;
residual(2)= lhs-rhs;
lhs =y(12);
rhs =x(16)+y(14)*params(36);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =x(16)+y(14)*params(37);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =T195^(1/(1-params(17)));
residual(5)= lhs-rhs;
lhs =1;
rhs =params(2)*(1+y(16))*(1+y(22))/((1+params(16))*(1+y(16)));
residual(6)= lhs-rhs;
lhs =(1+y(22))*(1+T211);
rhs =y(10)/y(12)+1-params(3)+T211*(1+y(7)/y(3)-params(3))-T222;
residual(7)= lhs-rhs;
lhs =(1+y(22))*(1+T225);
rhs =y(11)/y(12)+1-params(4)+T225*(1+y(8)/y(4)-params(4))-T236;
residual(8)= lhs-rhs;
lhs =1+y(32);
rhs =y(15)*(1+y(22))*(1-params(21)*(y(18)-params(70)))/y(15);
residual(9)= lhs-rhs;
lhs =y(3)*(1+params(16));
rhs =y(7)+y(3)*(1-params(3));
residual(10)= lhs-rhs;
lhs =y(4)*(1+params(16));
rhs =y(8)+y(4)*(1-params(4));
residual(11)= lhs-rhs;
lhs =y(2)*y(14)*(1-params(15))/y(6);
rhs =y(9);
residual(12)= lhs-rhs;
lhs =y(1)*x(14)*(1-params(14))/y(5);
rhs =y(9);
residual(13)= lhs-rhs;
lhs =y(2)*y(14)*params(15)/y(4);
rhs =y(11);
residual(14)= lhs-rhs;
lhs =y(1)*x(14)*params(14)/y(3);
rhs =y(10);
residual(15)= lhs-rhs;
lhs =(y(23)+y(24))*compn__+params(36)*(y(7)+y(8)+Robx__+Robn__)+y(28)*Jimz__*params(37);
rhs =y(2);
residual(16)= lhs-rhs;
lhs =y(5)+y(6);
rhs =(1+params(63))*params(47);
residual(17)= lhs-rhs;
lhs =y(24);
rhs =(params(47)*y(9)*params(63)+params(63)/(1+params(63))*(y(25)+x(11)))/(1+y(16));
residual(18)= lhs-rhs;
lhs =y(20);
rhs =params(44);
residual(19)= lhs-rhs;
lhs =y(38);
rhs =params(34)+params(5)*params(46)*(x(12)+x(13));
residual(20)= lhs-rhs;
lhs =y(25);
rhs =params(42)-params(53)*gap__;
residual(21)= lhs-rhs;
lhs =y(16);
rhs =params(27)+gap__*(1-params(53))/(y(23)+y(24));
residual(22)= lhs-rhs;
lhs =y(17)*(1+params(16));
rhs =y(28)+y(17)*(1-params(5));
residual(23)= lhs-rhs;
lhs =y(18)+y(21)+params(50)*y(27);
rhs =(1+params(28))*y(21)/(1+params(16))+y(28)*y(13)*Jimz__+y(23)+y(24)+y(12)*(y(7)+y(8)+Robx__+Robn__)+y(27)*params(50)*(1+y(34))/(1+params(16))+(1+y(32))*y(18)/(1+params(16))+params(21)/2*(y(18)-params(70))^2-y(14)*y(2)-x(14)*y(1)-y(33)-x(11);
residual(24)= lhs-rhs;
lhs =y(19);
rhs =(y(2)*y(14)*params(10)+y(1)*x(14)*params(9))/(y(13)*y(26));
residual(25)= lhs-rhs;
lhs =y(26);
rhs =params(45)*params(60)+params(35)*(y(17)-params(45));
residual(26)= lhs-rhs;
lhs =y(21);
rhs =params(16)*params(43)/(1+params(16))+x(3)+x(8)-x(4)-x(5)+y(21)/(1+params(16));
residual(27)= lhs-rhs;
lhs =y(29);
rhs =y(29)+x(3)+x(8)-x(4)-x(5);
residual(28)= lhs-rhs;
lhs =y(27);
rhs =params(16)*params(52)/(1+params(16))+x(6)+x(9)+x(7)+y(27)/(1+params(16));
residual(29)= lhs-rhs;
lhs =y(31);
rhs =x(3)+x(8)-x(4)-x(5);
residual(30)= lhs-rhs;
lhs =y(28);
rhs =(params(16)+params(5))*params(45)+x(1)+x(2);
residual(31)= lhs-rhs;
lhs =y(30);
rhs =y(14)*y(2)+x(14)*y(1);
residual(32)= lhs-rhs;
lhs =y(34);
rhs =params(29)+params(72)*T417;
residual(33)= lhs-rhs;
lhs =y(32);
rhs =y(34)+params(67);
residual(34)= lhs-rhs;
lhs =y(33);
rhs =params(61)+x(10);
residual(35)= lhs-rhs;
lhs =y(37);
rhs =y(14)/x(14);
residual(36)= lhs-rhs;
lhs =y(35);
rhs =x(14)/x(15);
residual(37)= lhs-rhs;
lhs =y(36);
rhs =x(14)/x(16);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =params(16);
residual(39)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(39, 39);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-T159*T155*y(26)^params(9)*params(49)*1/params(68)*getPowerDeriv(y(1)/params(68),params(65),1);
  g1(1,3)=(-(T159*T151*getPowerDeriv(y(3),params(12)+params(14),1)));
  g1(1,5)=(-(T151*T155*getPowerDeriv(y(5),1-params(14),1)));
  g1(1,26)=(-(T159*T155*T148*getPowerDeriv(y(26),params(9),1)));
  g1(2,2)=1-T179*T175*y(26)^params(10)*params(48)*1/params(69)*getPowerDeriv(y(2)/params(69),params(66),1);
  g1(2,4)=(-(T179*T171*getPowerDeriv(y(4),params(11)+params(15),1)));
  g1(2,6)=(-(T171*T175*getPowerDeriv(y(6),1-params(15),1)));
  g1(2,26)=(-(T179*T175*T168*getPowerDeriv(y(26),params(10),1)));
  g1(3,12)=1;
  g1(3,14)=(-params(36));
  g1(4,13)=1;
  g1(4,14)=(-params(37));
  g1(5,14)=(-((1-params(23)-params(22))*getPowerDeriv(y(14),1-params(17),1)*getPowerDeriv(T195,1/(1-params(17)),1)));
  g1(5,15)=1;
  g1(6,16)=(-(((1+params(16))*(1+y(16))*params(2)*(1+y(22))-(1+params(16))*params(2)*(1+y(16))*(1+y(22)))/((1+params(16))*(1+y(16))*(1+params(16))*(1+y(16)))));
  g1(6,22)=(-(params(2)*(1+y(16))/((1+params(16))*(1+y(16)))));
  g1(7,3)=(1+y(22))*params(38)*(-y(7))/(y(3)*y(3))-((1+y(7)/y(3)-params(3))*params(38)*(-y(7))/(y(3)*y(3))+T211*(-y(7))/(y(3)*y(3))-T9*T477);
  g1(7,7)=(1+y(22))*params(38)*1/y(3)-((1+y(7)/y(3)-params(3))*params(38)*1/y(3)+T211*1/y(3)-T9*T532);
  g1(7,10)=(-(1/y(12)));
  g1(7,12)=(-((-y(10))/(y(12)*y(12))));
  g1(7,22)=1+T211;
  g1(8,4)=(1+y(22))*params(39)*(-y(8))/(y(4)*y(4))-((1+y(8)/y(4)-params(4))*params(39)*(-y(8))/(y(4)*y(4))+T225*(-y(8))/(y(4)*y(4))-T21*T502);
  g1(8,8)=(1+y(22))*params(39)*1/y(4)-((1+y(8)/y(4)-params(4))*params(39)*1/y(4)+T225*1/y(4)-T21*T547);
  g1(8,11)=(-(1/y(12)));
  g1(8,12)=(-((-y(11))/(y(12)*y(12))));
  g1(8,22)=1+T225;
  g1(9,18)=(-(y(15)*(1+y(22))*(-params(21))/y(15)));
  g1(9,22)=(-(y(15)*(1-params(21)*(y(18)-params(70)))/y(15)));
  g1(9,32)=1;
  g1(10,3)=1+params(16)-(1-params(3));
  g1(10,7)=(-1);
  g1(11,4)=1+params(16)-(1-params(4));
  g1(11,8)=(-1);
  g1(12,2)=y(14)*(1-params(15))/y(6);
  g1(12,6)=(-(y(2)*y(14)*(1-params(15))))/(y(6)*y(6));
  g1(12,9)=(-1);
  g1(12,14)=y(2)*(1-params(15))/y(6);
  g1(13,1)=x(14)*(1-params(14))/y(5);
  g1(13,5)=(-(y(1)*x(14)*(1-params(14))))/(y(5)*y(5));
  g1(13,9)=(-1);
  g1(14,2)=y(14)*params(15)/y(4);
  g1(14,4)=(-(y(2)*y(14)*params(15)))/(y(4)*y(4));
  g1(14,11)=(-1);
  g1(14,14)=y(2)*params(15)/y(4);
  g1(15,1)=x(14)*params(14)/y(3);
  g1(15,3)=(-(y(1)*x(14)*params(14)))/(y(3)*y(3));
  g1(15,10)=(-1);
  g1(16,2)=(-1);
  g1(16,3)=params(36)*(T222+T9*y(3)*T477);
  g1(16,4)=params(36)*(T236+T21*y(4)*T502);
  g1(16,7)=params(36)*(1+T9*y(3)*T532);
  g1(16,8)=params(36)*(1+T21*y(4)*T547);
  g1(16,14)=(y(23)+y(24))*(T50*(1-params(22)-params(23))*getPowerDeriv(y(14),(-params(17)),1)-(1-params(22)-params(23))*y(14)^(-params(17))*(1-params(22)-params(23))*getPowerDeriv(y(14),1-params(17),1))/(T50*T50);
  g1(16,17)=y(28)*params(37)*T632;
  g1(16,23)=compn__;
  g1(16,24)=compn__;
  g1(16,28)=Jimz__*params(37)+y(28)*params(37)*T739;
  g1(17,5)=1;
  g1(17,6)=1;
  g1(18,9)=(-(params(63)*params(47)/(1+y(16))));
  g1(18,16)=(-((-(params(47)*y(9)*params(63)+params(63)/(1+params(63))*(y(25)+x(11))))/((1+y(16))*(1+y(16)))));
  g1(18,24)=1;
  g1(18,25)=(-(params(63)/(1+params(63))/(1+y(16))));
  g1(19,20)=1;
  g1(20,38)=1;
  g1(21,13)=params(53)*y(28)*Jimz__;
  g1(21,15)=params(53)*(y(22)-params(16))*y(20)/(1+params(16));
  g1(21,17)=params(53)*y(28)*y(13)*T632;
  g1(21,20)=params(53)*y(15)*(y(22)-params(16))/(1+params(16));
  g1(21,21)=params(53)*((1+params(28))/(1+params(16))-1);
  g1(21,22)=params(53)*y(15)*y(20)/(1+params(16));
  g1(21,23)=params(53)*(-params(27));
  g1(21,24)=params(53)*(-params(27));
  g1(21,25)=1;
  g1(21,26)=params(53)*(-y(38));
  g1(21,27)=params(53)*(y(34)-params(16))/(1+params(16));
  g1(21,28)=params(53)*(y(13)*Jimz__+y(28)*y(13)*T739);
  g1(21,33)=(-params(53));
  g1(21,34)=params(53)*y(27)/(1+params(16));
  g1(21,38)=params(53)*(-y(26));
  g1(22,13)=(-((1-params(53))*y(28)*Jimz__/(y(23)+y(24))));
  g1(22,15)=(-((1-params(53))*(y(22)-params(16))*y(20)/(1+params(16))/(y(23)+y(24))));
  g1(22,16)=1;
  g1(22,17)=(-((1-params(53))*y(28)*y(13)*T632/(y(23)+y(24))));
  g1(22,20)=(-((1-params(53))*y(15)*(y(22)-params(16))/(1+params(16))/(y(23)+y(24))));
  g1(22,21)=(-((1-params(53))*((1+params(28))/(1+params(16))-1)/(y(23)+y(24))));
  g1(22,22)=(-((1-params(53))*y(15)*y(20)/(1+params(16))/(y(23)+y(24))));
  g1(22,23)=T696;
  g1(22,24)=T696;
  g1(22,26)=(-((1-params(53))*(-y(38))/(y(23)+y(24))));
  g1(22,27)=(-((1-params(53))*(y(34)-params(16))/(1+params(16))/(y(23)+y(24))));
  g1(22,28)=(-((1-params(53))*(y(13)*Jimz__+y(28)*y(13)*T739)/(y(23)+y(24))));
  g1(22,33)=(-((-(1-params(53)))/(y(23)+y(24))));
  g1(22,34)=(-((1-params(53))*y(27)/(1+params(16))/(y(23)+y(24))));
  g1(22,38)=(-((1-params(53))*(-y(26))/(y(23)+y(24))));
  g1(23,17)=1+params(16)-(1-params(5));
  g1(23,28)=(-1);
  g1(24,1)=x(14);
  g1(24,2)=y(14);
  g1(24,3)=(-(y(12)*(T222+T9*y(3)*T477)));
  g1(24,4)=(-(y(12)*(T236+T21*y(4)*T502)));
  g1(24,7)=(-(y(12)*(1+T9*y(3)*T532)));
  g1(24,8)=(-(y(12)*(1+T21*y(4)*T547)));
  g1(24,12)=(-(y(7)+y(8)+Robx__+Robn__));
  g1(24,13)=(-(y(28)*Jimz__));
  g1(24,14)=y(2);
  g1(24,17)=(-(y(28)*y(13)*T632));
  g1(24,18)=1-((1+y(32))/(1+params(16))+params(21)/2*2*(y(18)-params(70)));
  g1(24,21)=1-(1+params(28))/(1+params(16));
  g1(24,23)=(-1);
  g1(24,24)=(-1);
  g1(24,27)=params(50)-params(50)*(1+y(34))/(1+params(16));
  g1(24,28)=(-(y(13)*Jimz__+y(28)*y(13)*T739));
  g1(24,32)=(-(y(18)/(1+params(16))));
  g1(24,33)=1;
  g1(24,34)=(-(params(50)*y(27)/(1+params(16))));
  g1(25,1)=(-(x(14)*params(9)/(y(13)*y(26))));
  g1(25,2)=(-(y(14)*params(10)/(y(13)*y(26))));
  g1(25,13)=(-((-(y(26)*(y(2)*y(14)*params(10)+y(1)*x(14)*params(9))))/(y(13)*y(26)*y(13)*y(26))));
  g1(25,14)=(-(y(2)*params(10)/(y(13)*y(26))));
  g1(25,19)=1;
  g1(25,26)=(-((-(y(13)*(y(2)*y(14)*params(10)+y(1)*x(14)*params(9))))/(y(13)*y(26)*y(13)*y(26))));
  g1(26,17)=(-params(35));
  g1(26,26)=1;
  g1(27,21)=1-1/(1+params(16));
  g1(29,27)=1-1/(1+params(16));
  g1(30,31)=1;
  g1(31,28)=1;
  g1(32,1)=(-x(14));
  g1(32,2)=(-y(14));
  g1(32,14)=(-y(2));
  g1(32,30)=1;
  g1(33,21)=(-(params(72)*T417*params(71)*1/y(30)));
  g1(33,27)=(-(params(72)*T417*params(71)*params(50)/y(30)));
  g1(33,30)=(-(params(72)*T417*params(71)*((-y(21))/(y(30)*y(30))+(-(params(50)*y(27)))/(y(30)*y(30)))));
  g1(33,34)=1;
  g1(34,32)=1;
  g1(34,34)=(-1);
  g1(35,33)=1;
  g1(36,14)=(-(1/x(14)));
  g1(36,37)=1;
  g1(37,35)=1;
  g1(38,36)=1;
  g1(39,39)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],39,1521);
end
end
