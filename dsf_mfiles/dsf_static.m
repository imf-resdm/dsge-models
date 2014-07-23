function [residual, g1, g2] = dsf_static(y, x, params)
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

residual = zeros( 41, 1);

%
% Model equations
%

Robx__ = params(18)/2*y(5)*(y(9)/y(5)-params(3)-params(29))^2;
Robn__ = params(19)/2*y(6)*(y(10)/y(6)-params(4)-params(29))^2;
compn__ = (1-params(25)-params(26))*y(16)^(-params(30))/(params(26)*x(24)^(1-params(30))+params(25)*x(23)^(1-params(30))+(1-params(25)-params(26))*y(16)^(1-params(30)));
Jimz__ = ((params(29)+params(5))*params(63)+(1+y(22)/y(20)-params(5)-params(29))^params(32)*(y(22)-(params(29)+params(5))*params(63)))/y(22);
DD__ = y(22)*y(15)*Jimz__+(1+y(34))*y(28)/(1+params(29))-y(28)+params(42)*(1+y(36))*y(27)/(1+params(29))-params(42)*y(27)+y(17)*(1+y(33))*y(26)/(1+params(29))-y(17)*y(26)+params(60)-(y(31)+y(32))*params(57)-(y(37)+y(38))-y(21)*params(33);
DDo__ = params(60)+params(61)*(y(34)-params(29))/(1+params(29))+params(67)*params(42)*(params(36)+params(39)-params(29))/(1+params(29))+(params(59)-params(29))*params(62)/(1+params(29))+params(63)*(params(29)+params(5))*params(64)-params(57)*(params(68)+params(69))-(params(70)+params(71))-params(33)*params(73);
h_target__ = params(57)+(1-params(46))*y(24)/(y(31)+y(32));
T_target__ = params(60)-params(46)*y(24);
uazuaz__ = params(56)/y(3);
uaz__ = params(56)*y(15)/params(64)/y(3);
foo__ = y(28)/(1+params(29));
int_repayment__ = x(27)+x(28);
T9 = params(18)/2;
T21 = params(19)/2;
T47 = params(26)*x(24)^(1-params(30))+params(25)*x(23)^(1-params(30));
T50 = T47+(1-params(25)-params(26))*y(16)^(1-params(30));
T63 = (1+y(22)/y(20)-params(5)-params(29))^params(32);
T219 = params(13)*(y(1)/params(74))^params(20);
T222 = T219*y(21)^params(14);
T226 = y(5)^(params(16)+params(8));
T230 = y(7)^(1-params(8));
T238 = params(12)*(y(2)/params(75))^params(21);
T241 = T238*y(21)^params(15);
T245 = y(6)^(params(17)+params(9));
T249 = y(8)^(1-params(9));
T265 = T47+y(16)^(1-params(30))*(1-params(26)-params(25));
T279 = params(18)*(y(9)/y(5)-params(3)-params(29));
T290 = T9*(y(9)/y(5)-params(3)-params(29))^2;
T293 = params(19)*(y(10)/y(6)-params(4)-params(29));
T304 = T21*(y(10)/y(6)-params(4)-params(29))^2;
T422 = exp(params(38)*(y(28)/y(3)+params(42)*y(27)/y(3)-params(61)/params(56)-params(42)*params(67)/params(56)));
T547 = (-params(56))/(y(3)*y(3));
T595 = (-y(9))/(y(5)*y(5))*2*(y(9)/y(5)-params(3)-params(29));
T621 = (-y(10))/(y(6)*y(6))*2*(y(10)/y(6)-params(4)-params(29));
T652 = 2*(y(9)/y(5)-params(3)-params(29))*1/y(5);
T668 = 2*(y(10)/y(6)-params(4)-params(29))*1/y(6);
T752 = getPowerDeriv(1+y(22)/y(20)-params(5)-params(29),params(32),1);
T755 = (y(22)-(params(29)+params(5))*params(63))*(-y(22))/(y(20)*y(20))*T752/y(22);
T784 = (y(22)*(T63+(y(22)-(params(29)+params(5))*params(63))*T752*1/y(20))-((params(29)+params(5))*params(63)+T63*(y(22)-(params(29)+params(5))*params(63))))/(y(22)*y(22));
lhs =y(1);
rhs =T222*T226*T230;
residual(1)= lhs-rhs;
lhs =y(2);
rhs =T241*T245*T249;
residual(2)= lhs-rhs;
lhs =y(14);
rhs =x(25)+y(16)*params(10);
residual(3)= lhs-rhs;
lhs =y(15);
rhs =x(25)+y(16)*params(11);
residual(4)= lhs-rhs;
lhs =y(17);
rhs =T265^(1/(1-params(30)));
residual(5)= lhs-rhs;
lhs =1;
rhs =(1+y(33))*params(2)*(1+y(18))/((1+params(29))*(1+y(18)));
residual(6)= lhs-rhs;
lhs =(1+y(33))*(1+T279);
rhs =y(11)/y(14)+1-params(3)+T279*(1+y(9)/y(5)-params(3))-T290;
residual(7)= lhs-rhs;
lhs =(1+y(33))*(1+T293);
rhs =y(12)/y(14)+1-params(4)+T293*(1+y(10)/y(6)-params(4))-T304;
residual(8)= lhs-rhs;
lhs =1+y(35);
rhs =y(17)*(1+y(33))*(1-params(31)*(y(25)-params(76)))/y(17);
residual(9)= lhs-rhs;
lhs =y(5)*(1+params(29));
rhs =y(9)+y(5)*(1-params(3));
residual(10)= lhs-rhs;
lhs =y(6)*(1+params(29));
rhs =y(10)+y(6)*(1-params(4));
residual(11)= lhs-rhs;
lhs =y(20)*(1+params(29));
rhs =y(22)+y(20)*(1-params(5));
residual(12)= lhs-rhs;
lhs =y(21);
rhs =params(63)*params(35)+params(34)*(y(20)-params(63));
residual(13)= lhs-rhs;
lhs =y(2)*y(16)*(1-params(9))/y(8);
rhs =y(13);
residual(14)= lhs-rhs;
lhs =y(1)*x(23)*(1-params(8))/y(7);
rhs =y(13);
residual(15)= lhs-rhs;
lhs =y(2)*y(16)*params(9)/y(6);
rhs =y(12);
residual(16)= lhs-rhs;
lhs =y(1)*x(23)*params(8)/y(5);
rhs =y(11);
residual(17)= lhs-rhs;
lhs =y(2);
rhs =(y(31)+y(32))*compn__+params(10)*(y(9)+y(10)+Robx__+Robn__)+y(22)*Jimz__*params(11);
residual(18)= lhs-rhs;
lhs =y(7)+y(8);
rhs =(1+params(40))*params(65);
residual(19)= lhs-rhs;
lhs =y(25)+y(28)+params(42)*y(27);
rhs =params(42)*(1+y(36))*y(27)/(1+params(29))+(1+y(34))*y(28)/(1+params(29))+y(22)*y(15)*Jimz__+y(31)+y(32)+y(14)*(y(9)+y(10)+Robx__+Robn__)+(1+y(35))*y(25)/(1+params(29))+params(31)/2*(y(25)-params(76))^2-y(16)*y(2)-x(23)*y(1)-(y(37)+y(38))-x(22);
residual(20)= lhs-rhs;
lhs =y(32);
rhs =(params(65)*y(13)*params(40)+params(40)/(1+params(40))*(y(19)+x(22)))/(1+y(18));
residual(21)= lhs-rhs;
lhs =y(23);
rhs =(y(2)*y(16)*params(15)+y(1)*x(23)*params(14))/(y(15)*y(21));
residual(22)= lhs-rhs;
lhs =y(36);
rhs =params(36)+params(39)*T422;
residual(23)= lhs-rhs;
lhs =y(35);
rhs =y(36)+params(37);
residual(24)= lhs-rhs;
lhs =y(3);
rhs =y(16)*y(2)+x(23)*y(1);
residual(25)= lhs-rhs;
lhs =y(4);
rhs =params(29);
residual(26)= lhs-rhs;
lhs =y(24);
rhs =DD__-DDo__;
residual(27)= lhs-rhs;
lhs =y(19);
rhs =T_target__;
residual(28)= lhs-rhs;
lhs =y(18);
rhs =h_target__;
residual(29)= lhs-rhs;
lhs =y(26);
rhs =params(62);
residual(30)= lhs-rhs;
lhs =y(28);
rhs =y(28)/(1+params(29))+params(29)*params(61)/(1+params(29))+x(4)/uazuaz__+x(5)/uazuaz__+x(6)/uazuaz__;
residual(31)= lhs-rhs;
lhs =y(30);
rhs =x(6)+x(4)+x(5);
residual(32)= lhs-rhs;
lhs =y(29);
rhs =x(6)+x(4)+x(5)+y(29);
residual(33)= lhs-rhs;
lhs =y(27);
rhs =x(7)/uazuaz__+x(8)/uazuaz__+x(9)/uazuaz__+y(27)/(1+params(29));
residual(34)= lhs-rhs;
lhs =y(22)*uaz__;
rhs =(params(29)+params(5))*params(63)+x(1)+x(2)+x(3);
residual(35)= lhs-rhs;
lhs =y(37)*uazuaz__;
rhs =params(70)+x(10)+x(11)+x(12);
residual(36)= lhs-rhs;
lhs =y(38)*uazuaz__;
rhs =params(71)+x(13)+x(14)+x(15);
residual(37)= lhs-rhs;
lhs =y(34)*foo__;
rhs =int_repayment__/uazuaz__;
residual(38)= lhs-rhs;
lhs =y(41);
rhs =y(16)/x(23);
residual(39)= lhs-rhs;
lhs =y(39);
rhs =x(23)/x(24);
residual(40)= lhs-rhs;
lhs =y(40);
rhs =x(23)/x(25);
residual(41)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(41, 41);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-T230*T226*y(21)^params(14)*params(13)*1/params(74)*getPowerDeriv(y(1)/params(74),params(20),1);
  g1(1,5)=(-(T230*T222*getPowerDeriv(y(5),params(16)+params(8),1)));
  g1(1,7)=(-(T222*T226*getPowerDeriv(y(7),1-params(8),1)));
  g1(1,21)=(-(T230*T226*T219*getPowerDeriv(y(21),params(14),1)));
  g1(2,2)=1-T249*T245*y(21)^params(15)*params(12)*1/params(75)*getPowerDeriv(y(2)/params(75),params(21),1);
  g1(2,6)=(-(T249*T241*getPowerDeriv(y(6),params(17)+params(9),1)));
  g1(2,8)=(-(T241*T245*getPowerDeriv(y(8),1-params(9),1)));
  g1(2,21)=(-(T249*T245*T238*getPowerDeriv(y(21),params(15),1)));
  g1(3,14)=1;
  g1(3,16)=(-params(10));
  g1(4,15)=1;
  g1(4,16)=(-params(11));
  g1(5,16)=(-((1-params(26)-params(25))*getPowerDeriv(y(16),1-params(30),1)*getPowerDeriv(T265,1/(1-params(30)),1)));
  g1(5,17)=1;
  g1(6,18)=(-(((1+params(29))*(1+y(18))*(1+y(33))*params(2)-(1+params(29))*(1+y(33))*params(2)*(1+y(18)))/((1+params(29))*(1+y(18))*(1+params(29))*(1+y(18)))));
  g1(6,33)=(-(params(2)*(1+y(18))/((1+params(29))*(1+y(18)))));
  g1(7,5)=(1+y(33))*params(18)*(-y(9))/(y(5)*y(5))-((1+y(9)/y(5)-params(3))*params(18)*(-y(9))/(y(5)*y(5))+T279*(-y(9))/(y(5)*y(5))-T9*T595);
  g1(7,9)=(1+y(33))*params(18)*1/y(5)-((1+y(9)/y(5)-params(3))*params(18)*1/y(5)+T279*1/y(5)-T9*T652);
  g1(7,11)=(-(1/y(14)));
  g1(7,14)=(-((-y(11))/(y(14)*y(14))));
  g1(7,33)=1+T279;
  g1(8,6)=(1+y(33))*params(19)*(-y(10))/(y(6)*y(6))-((1+y(10)/y(6)-params(4))*params(19)*(-y(10))/(y(6)*y(6))+T293*(-y(10))/(y(6)*y(6))-T21*T621);
  g1(8,10)=(1+y(33))*params(19)*1/y(6)-((1+y(10)/y(6)-params(4))*params(19)*1/y(6)+T293*1/y(6)-T21*T668);
  g1(8,12)=(-(1/y(14)));
  g1(8,14)=(-((-y(12))/(y(14)*y(14))));
  g1(8,33)=1+T293;
  g1(9,25)=(-(y(17)*(1+y(33))*(-params(31))/y(17)));
  g1(9,33)=(-(y(17)*(1-params(31)*(y(25)-params(76)))/y(17)));
  g1(9,35)=1;
  g1(10,5)=1+params(29)-(1-params(3));
  g1(10,9)=(-1);
  g1(11,6)=1+params(29)-(1-params(4));
  g1(11,10)=(-1);
  g1(12,20)=1+params(29)-(1-params(5));
  g1(12,22)=(-1);
  g1(13,20)=(-params(34));
  g1(13,21)=1;
  g1(14,2)=y(16)*(1-params(9))/y(8);
  g1(14,8)=(-(y(2)*y(16)*(1-params(9))))/(y(8)*y(8));
  g1(14,13)=(-1);
  g1(14,16)=y(2)*(1-params(9))/y(8);
  g1(15,1)=x(23)*(1-params(8))/y(7);
  g1(15,7)=(-(y(1)*x(23)*(1-params(8))))/(y(7)*y(7));
  g1(15,13)=(-1);
  g1(16,2)=y(16)*params(9)/y(6);
  g1(16,6)=(-(y(2)*y(16)*params(9)))/(y(6)*y(6));
  g1(16,12)=(-1);
  g1(16,16)=y(2)*params(9)/y(6);
  g1(17,1)=x(23)*params(8)/y(5);
  g1(17,5)=(-(y(1)*x(23)*params(8)))/(y(5)*y(5));
  g1(17,11)=(-1);
  g1(18,2)=1;
  g1(18,5)=(-(params(10)*(T290+T9*y(5)*T595)));
  g1(18,6)=(-(params(10)*(T304+T21*y(6)*T621)));
  g1(18,9)=(-(params(10)*(1+T9*y(5)*T652)));
  g1(18,10)=(-(params(10)*(1+T21*y(6)*T668)));
  g1(18,16)=(-((y(31)+y(32))*(T50*(1-params(25)-params(26))*getPowerDeriv(y(16),(-params(30)),1)-(1-params(25)-params(26))*y(16)^(-params(30))*(1-params(25)-params(26))*getPowerDeriv(y(16),1-params(30),1))/(T50*T50)));
  g1(18,20)=(-(y(22)*params(11)*T755));
  g1(18,22)=(-(Jimz__*params(11)+y(22)*params(11)*T784));
  g1(18,31)=(-compn__);
  g1(18,32)=(-compn__);
  g1(19,7)=1;
  g1(19,8)=1;
  g1(20,1)=x(23);
  g1(20,2)=y(16);
  g1(20,5)=(-(y(14)*(T290+T9*y(5)*T595)));
  g1(20,6)=(-(y(14)*(T304+T21*y(6)*T621)));
  g1(20,9)=(-(y(14)*(1+T9*y(5)*T652)));
  g1(20,10)=(-(y(14)*(1+T21*y(6)*T668)));
  g1(20,14)=(-(y(9)+y(10)+Robx__+Robn__));
  g1(20,15)=(-(y(22)*Jimz__));
  g1(20,16)=y(2);
  g1(20,20)=(-(y(22)*y(15)*T755));
  g1(20,22)=(-(y(15)*Jimz__+y(22)*y(15)*T784));
  g1(20,25)=1-((1+y(35))/(1+params(29))+params(31)/2*2*(y(25)-params(76)));
  g1(20,27)=params(42)-params(42)*(1+y(36))/(1+params(29));
  g1(20,28)=1-(1+y(34))/(1+params(29));
  g1(20,31)=(-1);
  g1(20,32)=(-1);
  g1(20,34)=(-(y(28)/(1+params(29))));
  g1(20,35)=(-(y(25)/(1+params(29))));
  g1(20,36)=(-(params(42)*y(27)/(1+params(29))));
  g1(20,37)=1;
  g1(20,38)=1;
  g1(21,13)=(-(params(40)*params(65)/(1+y(18))));
  g1(21,18)=(-((-(params(65)*y(13)*params(40)+params(40)/(1+params(40))*(y(19)+x(22))))/((1+y(18))*(1+y(18)))));
  g1(21,19)=(-(params(40)/(1+params(40))/(1+y(18))));
  g1(21,32)=1;
  g1(22,1)=(-(x(23)*params(14)/(y(15)*y(21))));
  g1(22,2)=(-(y(16)*params(15)/(y(15)*y(21))));
  g1(22,15)=(-((-(y(21)*(y(2)*y(16)*params(15)+y(1)*x(23)*params(14))))/(y(15)*y(21)*y(15)*y(21))));
  g1(22,16)=(-(y(2)*params(15)/(y(15)*y(21))));
  g1(22,21)=(-((-(y(15)*(y(2)*y(16)*params(15)+y(1)*x(23)*params(14))))/(y(15)*y(21)*y(15)*y(21))));
  g1(22,23)=1;
  g1(23,3)=(-(params(39)*T422*params(38)*((-y(28))/(y(3)*y(3))+(-(params(42)*y(27)))/(y(3)*y(3)))));
  g1(23,27)=(-(params(39)*T422*params(38)*params(42)/y(3)));
  g1(23,28)=(-(params(39)*T422*params(38)*1/y(3)));
  g1(23,36)=1;
  g1(24,35)=1;
  g1(24,36)=(-1);
  g1(25,1)=(-x(23));
  g1(25,2)=(-y(16));
  g1(25,3)=1;
  g1(25,16)=(-y(2));
  g1(26,4)=1;
  g1(27,15)=(-(y(22)*Jimz__));
  g1(27,17)=(-((1+y(33))*y(26)/(1+params(29))-y(26)));
  g1(27,20)=(-(y(22)*y(15)*T755));
  g1(27,21)=params(33);
  g1(27,22)=(-(y(15)*Jimz__+y(22)*y(15)*T784));
  g1(27,24)=1;
  g1(27,26)=(-(y(17)*(1+y(33))/(1+params(29))-y(17)));
  g1(27,27)=(-(params(42)*(1+y(36))/(1+params(29))-params(42)));
  g1(27,28)=(-((1+y(34))/(1+params(29))-1));
  g1(27,31)=params(57);
  g1(27,32)=params(57);
  g1(27,33)=(-(y(17)*y(26)/(1+params(29))));
  g1(27,34)=(-(y(28)/(1+params(29))-params(61)/(1+params(29))));
  g1(27,36)=(-(params(42)*y(27)/(1+params(29))));
  g1(27,37)=1;
  g1(27,38)=1;
  g1(28,19)=1;
  g1(28,24)=params(46);
  g1(29,18)=1;
  g1(29,24)=(-((1-params(46))/(y(31)+y(32))));
  g1(29,31)=(-((-((1-params(46))*y(24)))/((y(31)+y(32))*(y(31)+y(32)))));
  g1(29,32)=(-((-((1-params(46))*y(24)))/((y(31)+y(32))*(y(31)+y(32)))));
  g1(30,26)=1;
  g1(31,3)=(-((-(x(4)*T547))/(uazuaz__*uazuaz__)+(-(x(5)*T547))/(uazuaz__*uazuaz__)+(-(x(6)*T547))/(uazuaz__*uazuaz__)));
  g1(31,28)=1-1/(1+params(29));
  g1(32,30)=1;
  g1(34,3)=(-((-(x(7)*T547))/(uazuaz__*uazuaz__)+(-(x(8)*T547))/(uazuaz__*uazuaz__)+(-(x(9)*T547))/(uazuaz__*uazuaz__)));
  g1(34,27)=1-1/(1+params(29));
  g1(35,3)=y(22)*(-(params(56)*y(15)/params(64)))/(y(3)*y(3));
  g1(35,15)=y(22)*params(56)*1/params(64)/y(3);
  g1(35,22)=uaz__;
  g1(36,3)=y(37)*T547;
  g1(36,37)=uazuaz__;
  g1(37,3)=y(38)*T547;
  g1(37,38)=uazuaz__;
  g1(38,3)=(-((-(int_repayment__*T547))/(uazuaz__*uazuaz__)));
  g1(38,28)=y(34)*1/(1+params(29));
  g1(38,34)=foo__;
  g1(39,16)=(-(1/x(23)));
  g1(39,41)=1;
  g1(40,39)=1;
  g1(41,40)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],41,1681);
end
end
