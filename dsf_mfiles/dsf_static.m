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

residual = zeros( 35, 1);

%
% Model equations
%

ACx__ = y(14)*params(42)/2*(y(11)/y(14)-params(17)-params(25))^2;
ACn__ = y(13)*params(41)/2*(y(10)/y(13)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(12)/y(34)-params(18)-params(25))^params(47)*(y(12)-params(76)*(params(25)+params(18))))/y(12);
compn__ = (1-params(56)-params(55))*y(20)^(-params(21))/(params(55)*x(27)^(1-params(21))+params(56)*x(26)^(1-params(21))+(1-params(56)-params(55))*y(20)^(1-params(21)));
DD__ = y(12)*y(21)*abcap__+(1+y(25))*y(3)/(1+params(25))-y(3)+params(38)*(1+y(27))*y(4)/(1+params(25))-params(38)*y(4)+y(18)*(1+y(24))*y(1)/(1+params(25))-y(18)*y(1)+params(70)-(y(5)+y(6))*params(31)-(y(8)+y(17))-y(35)*params(39);
DDo__ = params(70)+params(14)*(y(25)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(7)*(1-params(32))/(y(5)+y(6));
T_target__ = params(70)-y(7)*params(32);
uazuaz__ = params(74)/y(33);
uaz_b__ = y(18)*params(74)/y(33);
uaz__ = params(74)*y(21)/params(46)/y(33);
int_repayment__ = x(30)+x(31);
T10 = params(42)/2;
T22 = params(41)/2;
T42 = (1+y(12)/y(34)-params(18)-params(25))^params(47);
T63 = params(55)*x(27)^(1-params(21))+params(56)*x(26)^(1-params(21));
T66 = T63+(1-params(56)-params(55))*y(20)^(1-params(21));
T202 = params(4)*(y(23)/params(51))^params(65);
T205 = T202*y(35)^params(49);
T209 = y(14)^(params(73)+params(8));
T213 = y(16)^(1-params(8));
T221 = params(2)*(y(22)/params(50))^params(64);
T224 = T221*y(35)^params(48);
T228 = y(13)^(params(72)+params(7));
T232 = y(15)^(1-params(7));
T248 = T63+y(20)^(1-params(21))*(1-params(55)-params(56));
T262 = params(42)*(y(11)/y(14)-params(17)-params(25));
T273 = T10*(y(11)/y(14)-params(17)-params(25))^2;
T276 = params(41)*(y(10)/y(13)-params(16)-params(25));
T287 = T22*(y(10)/y(13)-params(16)-params(25))^2;
T405 = exp(params(23)*(y(3)/y(33)+params(38)*y(4)/y(33)-params(14)/params(74)-params(38)*params(15)/params(74)));
T421 = y(3)/(1+params(25));
T554 = 1/y(13)*2*(y(10)/y(13)-params(16)-params(25));
T571 = 1/y(14)*2*(y(11)/y(14)-params(17)-params(25));
T582 = getPowerDeriv(1+y(12)/y(34)-params(18)-params(25),params(47),1);
T589 = (y(12)*(T42+(y(12)-params(76)*(params(25)+params(18)))*1/y(34)*T582)-(params(76)*(params(25)+params(18))+T42*(y(12)-params(76)*(params(25)+params(18)))))/(y(12)*y(12));
T610 = 2*(y(10)/y(13)-params(16)-params(25))*(-y(10))/(y(13)*y(13));
T635 = 2*(y(11)/y(14)-params(17)-params(25))*(-y(11))/(y(14)*y(14));
T781 = (-params(74))/(y(33)*y(33));
T796 = (-(y(18)*params(74)))/(y(33)*y(33));
T837 = (y(12)-params(76)*(params(25)+params(18)))*T582*(-y(12))/(y(34)*y(34))/y(12);
lhs =y(23);
rhs =T205*T209*T213;
residual(1)= lhs-rhs;
lhs =y(22);
rhs =T224*T228*T232;
residual(2)= lhs-rhs;
lhs =y(19);
rhs =x(28)+y(20)*params(1);
residual(3)= lhs-rhs;
lhs =y(21);
rhs =x(28)+y(20)*params(5);
residual(4)= lhs-rhs;
lhs =y(18);
rhs =T248^(1/(1-params(21)));
residual(5)= lhs-rhs;
lhs =1;
rhs =(1+y(24))*params(11)*(1+y(9))/((1+params(25))*(1+y(9)));
residual(6)= lhs-rhs;
lhs =(1+y(24))*(1+T262);
rhs =y(29)/y(19)+1-params(17)+T262*(1+y(11)/y(14)-params(17))-T273;
residual(7)= lhs-rhs;
lhs =(1+y(24))*(1+T276);
rhs =y(28)/y(19)+1-params(16)+T276*(1+y(10)/y(13)-params(16))-T287;
residual(8)= lhs-rhs;
lhs =1+y(26);
rhs =y(18)*(1+y(24))*(1-params(22)*(y(2)-params(13)))/y(18);
residual(9)= lhs-rhs;
lhs =y(14)*(1+params(25));
rhs =y(11)+y(14)*(1-params(17));
residual(10)= lhs-rhs;
lhs =y(13)*(1+params(25));
rhs =y(10)+y(13)*(1-params(16));
residual(11)= lhs-rhs;
lhs =y(34)*(1+params(25));
rhs =y(12)+y(34)*(1-params(18));
residual(12)= lhs-rhs;
lhs =y(35);
rhs =params(76)*params(60)+params(59)*(y(34)-params(76));
residual(13)= lhs-rhs;
lhs =y(22)*y(20)*(1-params(7))/y(15);
rhs =y(32);
residual(14)= lhs-rhs;
lhs =y(23)*x(26)*(1-params(8))/y(16);
rhs =y(32);
residual(15)= lhs-rhs;
lhs =y(22)*y(20)*params(7)/y(13);
rhs =y(28);
residual(16)= lhs-rhs;
lhs =y(23)*x(26)*params(8)/y(14);
rhs =y(29);
residual(17)= lhs-rhs;
lhs =y(22);
rhs =(y(5)+y(6))*compn__+params(1)*(y(11)+y(10)+ACx__+ACn__)+y(12)*abcap__*params(5);
residual(18)= lhs-rhs;
lhs =y(16)+y(15);
rhs =(1+params(3))*params(37);
residual(19)= lhs-rhs;
lhs =y(2)+y(3)+params(38)*y(4);
rhs =params(38)*(1+y(27))*y(4)/(1+params(25))+(1+y(25))*y(3)/(1+params(25))+y(12)*y(21)*abcap__+y(5)+y(6)+y(19)*(y(11)+y(10)+ACx__+ACn__)+(1+y(26))*y(2)/(1+params(25))+params(22)/2*(y(2)-params(13))^2-y(20)*y(22)-x(26)*y(23)-(y(8)+y(17))-x(25);
residual(20)= lhs-rhs;
lhs =y(6);
rhs =(params(37)*y(32)*params(3)+params(3)/(1+params(3))*(y(31)+x(25)))/(1+y(9));
residual(21)= lhs-rhs;
lhs =y(30);
rhs =(y(22)*y(20)*params(48)+y(23)*x(26)*params(49))/(y(21)*y(35));
residual(22)= lhs-rhs;
lhs =y(27);
rhs =params(58)+params(43)*T405;
residual(23)= lhs-rhs;
lhs =y(26);
rhs =y(27)+params(40);
residual(24)= lhs-rhs;
lhs =y(33);
rhs =y(20)*y(22)+x(26)*y(23);
residual(25)= lhs-rhs;
lhs =y(7);
rhs =DD__-DDo__;
residual(26)= lhs-rhs;
lhs =y(31);
rhs =T_target__;
residual(27)= lhs-rhs;
lhs =y(9);
rhs =h_target__;
residual(28)= lhs-rhs;
lhs =y(3);
rhs =params(25)*params(14)/(1+params(25))+T421+x(4)/uazuaz__+x(5)/uazuaz__+x(6)/uazuaz__;
residual(29)= lhs-rhs;
lhs =y(1);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(10)/uaz_b__+x(11)/uaz_b__+x(12)/uaz_b__;
residual(30)= lhs-rhs;
lhs =y(4);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(7)/uazuaz__+x(8)/uazuaz__+x(9)/uazuaz__;
residual(31)= lhs-rhs;
lhs =y(12)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(1)+x(2)+x(3);
residual(32)= lhs-rhs;
lhs =y(8)*uazuaz__;
rhs =params(29)+x(13)+x(14)+x(15);
residual(33)= lhs-rhs;
lhs =y(17)*uazuaz__;
rhs =params(44)+x(16)+x(17)+x(18);
residual(34)= lhs-rhs;
lhs =y(25)*y(3)/(1+params(25));
rhs =int_repayment__/uazuaz__;
residual(35)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(35, 35);

  %
  % Jacobian matrix
  %

  g1(1,14)=(-(T213*T205*getPowerDeriv(y(14),params(73)+params(8),1)));
  g1(1,16)=(-(T205*T209*getPowerDeriv(y(16),1-params(8),1)));
  g1(1,23)=1-T213*T209*y(35)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(23)/params(51),params(65),1);
  g1(1,35)=(-(T213*T209*T202*getPowerDeriv(y(35),params(49),1)));
  g1(2,13)=(-(T232*T224*getPowerDeriv(y(13),params(72)+params(7),1)));
  g1(2,15)=(-(T224*T228*getPowerDeriv(y(15),1-params(7),1)));
  g1(2,22)=1-T232*T228*y(35)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(22)/params(50),params(64),1);
  g1(2,35)=(-(T232*T228*T221*getPowerDeriv(y(35),params(48),1)));
  g1(3,19)=1;
  g1(3,20)=(-params(1));
  g1(4,20)=(-params(5));
  g1(4,21)=1;
  g1(5,18)=1;
  g1(5,20)=(-((1-params(55)-params(56))*getPowerDeriv(y(20),1-params(21),1)*getPowerDeriv(T248,1/(1-params(21)),1)));
  g1(6,9)=(-(((1+params(25))*(1+y(9))*(1+y(24))*params(11)-(1+params(25))*(1+y(24))*params(11)*(1+y(9)))/((1+params(25))*(1+y(9))*(1+params(25))*(1+y(9)))));
  g1(6,24)=(-(params(11)*(1+y(9))/((1+params(25))*(1+y(9)))));
  g1(7,11)=(1+y(24))*params(42)*1/y(14)-((1+y(11)/y(14)-params(17))*params(42)*1/y(14)+T262*1/y(14)-T10*T571);
  g1(7,14)=(1+y(24))*params(42)*(-y(11))/(y(14)*y(14))-((1+y(11)/y(14)-params(17))*params(42)*(-y(11))/(y(14)*y(14))+T262*(-y(11))/(y(14)*y(14))-T10*T635);
  g1(7,19)=(-((-y(29))/(y(19)*y(19))));
  g1(7,24)=1+T262;
  g1(7,29)=(-(1/y(19)));
  g1(8,10)=(1+y(24))*params(41)*1/y(13)-((1+y(10)/y(13)-params(16))*params(41)*1/y(13)+T276*1/y(13)-T22*T554);
  g1(8,13)=(1+y(24))*params(41)*(-y(10))/(y(13)*y(13))-((1+y(10)/y(13)-params(16))*params(41)*(-y(10))/(y(13)*y(13))+T276*(-y(10))/(y(13)*y(13))-T22*T610);
  g1(8,19)=(-((-y(28))/(y(19)*y(19))));
  g1(8,24)=1+T276;
  g1(8,28)=(-(1/y(19)));
  g1(9,2)=(-(y(18)*(1+y(24))*(-params(22))/y(18)));
  g1(9,24)=(-(y(18)*(1-params(22)*(y(2)-params(13)))/y(18)));
  g1(9,26)=1;
  g1(10,11)=(-1);
  g1(10,14)=1+params(25)-(1-params(17));
  g1(11,10)=(-1);
  g1(11,13)=1+params(25)-(1-params(16));
  g1(12,12)=(-1);
  g1(12,34)=1+params(25)-(1-params(18));
  g1(13,34)=(-params(59));
  g1(13,35)=1;
  g1(14,15)=(-(y(22)*y(20)*(1-params(7))))/(y(15)*y(15));
  g1(14,20)=y(22)*(1-params(7))/y(15);
  g1(14,22)=y(20)*(1-params(7))/y(15);
  g1(14,32)=(-1);
  g1(15,16)=(-(y(23)*x(26)*(1-params(8))))/(y(16)*y(16));
  g1(15,23)=x(26)*(1-params(8))/y(16);
  g1(15,32)=(-1);
  g1(16,13)=(-(y(22)*y(20)*params(7)))/(y(13)*y(13));
  g1(16,20)=y(22)*params(7)/y(13);
  g1(16,22)=y(20)*params(7)/y(13);
  g1(16,28)=(-1);
  g1(17,14)=(-(y(23)*x(26)*params(8)))/(y(14)*y(14));
  g1(17,23)=x(26)*params(8)/y(14);
  g1(17,29)=(-1);
  g1(18,5)=(-compn__);
  g1(18,6)=(-compn__);
  g1(18,10)=(-(params(1)*(1+y(13)*T22*T554)));
  g1(18,11)=(-(params(1)*(1+y(14)*T10*T571)));
  g1(18,12)=(-(abcap__*params(5)+y(12)*params(5)*T589));
  g1(18,13)=(-(params(1)*(T287+y(13)*T22*T610)));
  g1(18,14)=(-(params(1)*(T273+y(14)*T10*T635)));
  g1(18,20)=(-((y(5)+y(6))*(T66*(1-params(56)-params(55))*getPowerDeriv(y(20),(-params(21)),1)-(1-params(56)-params(55))*y(20)^(-params(21))*(1-params(56)-params(55))*getPowerDeriv(y(20),1-params(21),1))/(T66*T66)));
  g1(18,22)=1;
  g1(18,34)=(-(y(12)*params(5)*T837));
  g1(19,15)=1;
  g1(19,16)=1;
  g1(20,2)=1-((1+y(26))/(1+params(25))+params(22)/2*2*(y(2)-params(13)));
  g1(20,3)=1-(1+y(25))/(1+params(25));
  g1(20,4)=params(38)-params(38)*(1+y(27))/(1+params(25));
  g1(20,5)=(-1);
  g1(20,6)=(-1);
  g1(20,8)=1;
  g1(20,10)=(-(y(19)*(1+y(13)*T22*T554)));
  g1(20,11)=(-(y(19)*(1+y(14)*T10*T571)));
  g1(20,12)=(-(y(21)*abcap__+y(12)*y(21)*T589));
  g1(20,13)=(-(y(19)*(T287+y(13)*T22*T610)));
  g1(20,14)=(-(y(19)*(T273+y(14)*T10*T635)));
  g1(20,17)=1;
  g1(20,19)=(-(y(11)+y(10)+ACx__+ACn__));
  g1(20,20)=y(22);
  g1(20,21)=(-(y(12)*abcap__));
  g1(20,22)=y(20);
  g1(20,23)=x(26);
  g1(20,25)=(-T421);
  g1(20,26)=(-(y(2)/(1+params(25))));
  g1(20,27)=(-(params(38)*y(4)/(1+params(25))));
  g1(20,34)=(-(y(12)*y(21)*T837));
  g1(21,6)=1;
  g1(21,9)=(-((-(params(37)*y(32)*params(3)+params(3)/(1+params(3))*(y(31)+x(25))))/((1+y(9))*(1+y(9)))));
  g1(21,31)=(-(params(3)/(1+params(3))/(1+y(9))));
  g1(21,32)=(-(params(3)*params(37)/(1+y(9))));
  g1(22,20)=(-(y(22)*params(48)/(y(21)*y(35))));
  g1(22,21)=(-((-(y(35)*(y(22)*y(20)*params(48)+y(23)*x(26)*params(49))))/(y(21)*y(35)*y(21)*y(35))));
  g1(22,22)=(-(y(20)*params(48)/(y(21)*y(35))));
  g1(22,23)=(-(x(26)*params(49)/(y(21)*y(35))));
  g1(22,30)=1;
  g1(22,35)=(-((-(y(21)*(y(22)*y(20)*params(48)+y(23)*x(26)*params(49))))/(y(21)*y(35)*y(21)*y(35))));
  g1(23,3)=(-(params(43)*T405*params(23)*1/y(33)));
  g1(23,4)=(-(params(43)*T405*params(23)*params(38)/y(33)));
  g1(23,27)=1;
  g1(23,33)=(-(params(43)*T405*params(23)*((-y(3))/(y(33)*y(33))+(-(params(38)*y(4)))/(y(33)*y(33)))));
  g1(24,26)=1;
  g1(24,27)=(-1);
  g1(25,20)=(-y(22));
  g1(25,22)=(-y(20));
  g1(25,23)=(-x(26));
  g1(25,33)=1;
  g1(26,1)=(-(y(18)*(1+y(24))/(1+params(25))-y(18)));
  g1(26,3)=(-((1+y(25))/(1+params(25))-1));
  g1(26,4)=(-(params(38)*(1+y(27))/(1+params(25))-params(38)));
  g1(26,5)=params(31);
  g1(26,6)=params(31);
  g1(26,7)=1;
  g1(26,8)=1;
  g1(26,12)=(-(y(21)*abcap__+y(12)*y(21)*T589));
  g1(26,17)=1;
  g1(26,18)=(-((1+y(24))*y(1)/(1+params(25))-y(1)));
  g1(26,21)=(-(y(12)*abcap__));
  g1(26,24)=(-(y(18)*y(1)/(1+params(25))));
  g1(26,25)=(-(T421-params(14)/(1+params(25))));
  g1(26,27)=(-(params(38)*y(4)/(1+params(25))));
  g1(26,34)=(-(y(12)*y(21)*T837));
  g1(26,35)=params(39);
  g1(27,7)=params(32);
  g1(27,31)=1;
  g1(28,5)=(-((-(y(7)*(1-params(32))))/((y(5)+y(6))*(y(5)+y(6)))));
  g1(28,6)=(-((-(y(7)*(1-params(32))))/((y(5)+y(6))*(y(5)+y(6)))));
  g1(28,7)=(-((1-params(32))/(y(5)+y(6))));
  g1(28,9)=1;
  g1(29,3)=1-1/(1+params(25));
  g1(29,33)=(-((-(x(4)*T781))/(uazuaz__*uazuaz__)+(-(x(5)*T781))/(uazuaz__*uazuaz__)+(-(x(6)*T781))/(uazuaz__*uazuaz__)));
  g1(30,1)=1-1/(1+params(25));
  g1(30,18)=(-((-(params(74)/y(33)*x(10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(33)*x(11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(33)*x(12)))/(uaz_b__*uaz_b__)));
  g1(30,33)=(-((-(x(10)*T796))/(uaz_b__*uaz_b__)+(-(x(11)*T796))/(uaz_b__*uaz_b__)+(-(x(12)*T796))/(uaz_b__*uaz_b__)));
  g1(31,4)=1-1/(1+params(25));
  g1(31,33)=(-((-(x(7)*T781))/(uazuaz__*uazuaz__)+(-(x(8)*T781))/(uazuaz__*uazuaz__)+(-(x(9)*T781))/(uazuaz__*uazuaz__)));
  g1(32,12)=uaz__;
  g1(32,21)=y(12)*params(74)*1/params(46)/y(33);
  g1(32,33)=y(12)*(-(params(74)*y(21)/params(46)))/(y(33)*y(33));
  g1(33,8)=uazuaz__;
  g1(33,33)=y(8)*T781;
  g1(34,17)=uazuaz__;
  g1(34,33)=y(17)*T781;
  g1(35,3)=y(25)/(1+params(25));
  g1(35,25)=T421;
  g1(35,33)=(-((-(int_repayment__*T781))/(uazuaz__*uazuaz__)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],35,1225);
end
end
