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

residual = zeros( 38, 1);

%
% Model equations
%

ACx__ = y(16)*params(42)/2*(y(13)/y(16)-params(17)-params(25))^2;
ACn__ = y(15)*params(41)/2*(y(12)/y(15)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(14)/y(37)-params(18)-params(25))^params(47)*(y(14)-params(76)*(params(25)+params(18))))/y(14);
compn__ = (1-params(56)-params(55))*y(23)^(-params(21))/(params(55)*x(27)^(1-params(21))+params(56)*x(26)^(1-params(21))+(1-params(56)-params(55))*y(23)^(1-params(21)));
DD__ = y(14)*y(24)*abcap__+(1+y(28))*y(3)/(1+params(25))-y(3)+params(38)*(1+y(30))*y(4)/(1+params(25))-params(38)*y(4)+y(21)*(1+y(27))*y(1)/(1+params(25))-y(21)*y(1)+params(70)-(y(6)+y(7))*params(31)-(y(9)+y(20))-y(38)*params(39);
DDo__ = params(70)+params(14)*(y(28)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(8)*(1-params(32))/(y(6)+y(7));
T_target__ = params(70)-y(8)*params(32);
uazuaz__ = params(74)/y(36);
uaz_b__ = y(21)*params(74)/y(36);
uaz__ = params(74)*y(24)/params(46)/y(36);
int_repayment__ = x(30)+x(31);
T10 = params(42)/2;
T22 = params(41)/2;
T42 = (1+y(14)/y(37)-params(18)-params(25))^params(47);
T63 = params(55)*x(27)^(1-params(21))+params(56)*x(26)^(1-params(21));
T66 = T63+(1-params(56)-params(55))*y(23)^(1-params(21));
T202 = params(4)*(y(26)/params(51))^params(65);
T205 = T202*y(38)^params(49);
T209 = y(16)^(params(73)+params(8));
T213 = y(18)^(1-params(8));
T221 = params(2)*(y(25)/params(50))^params(64);
T224 = T221*y(38)^params(48);
T228 = y(15)^(params(72)+params(7));
T232 = y(17)^(1-params(7));
T248 = T63+y(23)^(1-params(21))*(1-params(55)-params(56));
T262 = params(42)*(y(13)/y(16)-params(17)-params(25));
T273 = T10*(y(13)/y(16)-params(17)-params(25))^2;
T276 = params(41)*(y(12)/y(15)-params(16)-params(25));
T287 = T22*(y(12)/y(15)-params(16)-params(25))^2;
T405 = exp(params(23)*(y(3)/y(36)+params(38)*y(4)/y(36)-params(14)/params(74)-params(38)*params(15)/params(74)));
T423 = y(3)/(1+params(25));
T563 = 1/y(15)*2*(y(12)/y(15)-params(16)-params(25));
T580 = 1/y(16)*2*(y(13)/y(16)-params(17)-params(25));
T591 = getPowerDeriv(1+y(14)/y(37)-params(18)-params(25),params(47),1);
T598 = (y(14)*(T42+(y(14)-params(76)*(params(25)+params(18)))*1/y(37)*T591)-(params(76)*(params(25)+params(18))+T42*(y(14)-params(76)*(params(25)+params(18)))))/(y(14)*y(14));
T619 = 2*(y(12)/y(15)-params(16)-params(25))*(-y(12))/(y(15)*y(15));
T644 = 2*(y(13)/y(16)-params(17)-params(25))*(-y(13))/(y(16)*y(16));
T790 = (-params(74))/(y(36)*y(36));
T805 = (-(y(21)*params(74)))/(y(36)*y(36));
T846 = (y(14)-params(76)*(params(25)+params(18)))*T591*(-y(14))/(y(37)*y(37))/y(14);
lhs =y(26);
rhs =T205*T209*T213;
residual(1)= lhs-rhs;
lhs =y(25);
rhs =T224*T228*T232;
residual(2)= lhs-rhs;
lhs =y(22);
rhs =x(28)+y(23)*params(1);
residual(3)= lhs-rhs;
lhs =y(24);
rhs =x(28)+y(23)*params(5);
residual(4)= lhs-rhs;
lhs =y(21);
rhs =T248^(1/(1-params(21)));
residual(5)= lhs-rhs;
lhs =1;
rhs =(1+y(27))*params(11)*(1+y(11))/((1+params(25))*(1+y(11)));
residual(6)= lhs-rhs;
lhs =(1+y(27))*(1+T262);
rhs =y(32)/y(22)+1-params(17)+T262*(1+y(13)/y(16)-params(17))-T273;
residual(7)= lhs-rhs;
lhs =(1+y(27))*(1+T276);
rhs =y(31)/y(22)+1-params(16)+T276*(1+y(12)/y(15)-params(16))-T287;
residual(8)= lhs-rhs;
lhs =1+y(29);
rhs =y(21)*(1+y(27))*(1-params(22)*(y(2)-params(13)))/y(21);
residual(9)= lhs-rhs;
lhs =y(16)*(1+params(25));
rhs =y(13)+y(16)*(1-params(17));
residual(10)= lhs-rhs;
lhs =y(15)*(1+params(25));
rhs =y(12)+y(15)*(1-params(16));
residual(11)= lhs-rhs;
lhs =y(37)*(1+params(25));
rhs =y(14)+y(37)*(1-params(18));
residual(12)= lhs-rhs;
lhs =y(38);
rhs =params(76)*params(60)+params(59)*(y(37)-params(76));
residual(13)= lhs-rhs;
lhs =y(25)*y(23)*(1-params(7))/y(17);
rhs =y(35);
residual(14)= lhs-rhs;
lhs =y(26)*x(26)*(1-params(8))/y(18);
rhs =y(35);
residual(15)= lhs-rhs;
lhs =y(25)*y(23)*params(7)/y(15);
rhs =y(31);
residual(16)= lhs-rhs;
lhs =y(26)*x(26)*params(8)/y(16);
rhs =y(32);
residual(17)= lhs-rhs;
lhs =y(25);
rhs =(y(6)+y(7))*compn__+params(1)*(y(13)+y(12)+ACx__+ACn__)+y(14)*abcap__*params(5);
residual(18)= lhs-rhs;
lhs =y(18)+y(17);
rhs =(1+params(3))*params(37);
residual(19)= lhs-rhs;
lhs =y(2)+y(3)+params(38)*y(4);
rhs =params(38)*(1+y(30))*y(4)/(1+params(25))+(1+y(28))*y(3)/(1+params(25))+y(14)*y(24)*abcap__+y(6)+y(7)+y(22)*(y(13)+y(12)+ACx__+ACn__)+(1+y(29))*y(2)/(1+params(25))+params(22)/2*(y(2)-params(13))^2-y(23)*y(25)-x(26)*y(26)-(y(9)+y(20))-x(25);
residual(20)= lhs-rhs;
lhs =y(7);
rhs =(params(37)*y(35)*params(3)+params(3)/(1+params(3))*(y(34)+x(25)))/(1+y(11));
residual(21)= lhs-rhs;
lhs =y(33);
rhs =(y(25)*y(23)*params(48)+y(26)*x(26)*params(49))/(y(24)*y(38));
residual(22)= lhs-rhs;
lhs =y(30);
rhs =params(58)+params(43)*T405;
residual(23)= lhs-rhs;
lhs =y(29);
rhs =y(30)+params(40);
residual(24)= lhs-rhs;
lhs =y(36);
rhs =y(23)*y(25)+x(26)*y(26);
residual(25)= lhs-rhs;
lhs =y(10);
rhs =params(25);
residual(26)= lhs-rhs;
lhs =y(8);
rhs =DD__-DDo__;
residual(27)= lhs-rhs;
lhs =y(34);
rhs =T_target__;
residual(28)= lhs-rhs;
lhs =y(11);
rhs =h_target__;
residual(29)= lhs-rhs;
lhs =y(3);
rhs =params(25)*params(14)/(1+params(25))+T423+x(4)/uazuaz__+x(5)/uazuaz__+x(6)/uazuaz__;
residual(30)= lhs-rhs;
lhs =y(19);
rhs =x(6)+x(4)+x(5);
residual(31)= lhs-rhs;
lhs =y(5);
rhs =x(6)+x(4)+x(5)+y(5);
residual(32)= lhs-rhs;
lhs =y(1);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(10)/uaz_b__+x(11)/uaz_b__+x(12)/uaz_b__;
residual(33)= lhs-rhs;
lhs =y(4);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(7)/uazuaz__+x(8)/uazuaz__+x(9)/uazuaz__;
residual(34)= lhs-rhs;
lhs =y(14)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(1)+x(2)+x(3);
residual(35)= lhs-rhs;
lhs =y(9)*uazuaz__;
rhs =params(29)+x(13)+x(14)+x(15);
residual(36)= lhs-rhs;
lhs =y(20)*uazuaz__;
rhs =params(44)+x(16)+x(17)+x(18);
residual(37)= lhs-rhs;
lhs =y(28)*y(3)/(1+params(25));
rhs =int_repayment__/uazuaz__;
residual(38)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(38, 38);

  %
  % Jacobian matrix
  %

  g1(1,16)=(-(T213*T205*getPowerDeriv(y(16),params(73)+params(8),1)));
  g1(1,18)=(-(T205*T209*getPowerDeriv(y(18),1-params(8),1)));
  g1(1,26)=1-T213*T209*y(38)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(26)/params(51),params(65),1);
  g1(1,38)=(-(T213*T209*T202*getPowerDeriv(y(38),params(49),1)));
  g1(2,15)=(-(T232*T224*getPowerDeriv(y(15),params(72)+params(7),1)));
  g1(2,17)=(-(T224*T228*getPowerDeriv(y(17),1-params(7),1)));
  g1(2,25)=1-T232*T228*y(38)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(25)/params(50),params(64),1);
  g1(2,38)=(-(T232*T228*T221*getPowerDeriv(y(38),params(48),1)));
  g1(3,22)=1;
  g1(3,23)=(-params(1));
  g1(4,23)=(-params(5));
  g1(4,24)=1;
  g1(5,21)=1;
  g1(5,23)=(-((1-params(55)-params(56))*getPowerDeriv(y(23),1-params(21),1)*getPowerDeriv(T248,1/(1-params(21)),1)));
  g1(6,11)=(-(((1+params(25))*(1+y(11))*(1+y(27))*params(11)-(1+params(25))*(1+y(27))*params(11)*(1+y(11)))/((1+params(25))*(1+y(11))*(1+params(25))*(1+y(11)))));
  g1(6,27)=(-(params(11)*(1+y(11))/((1+params(25))*(1+y(11)))));
  g1(7,13)=(1+y(27))*params(42)*1/y(16)-((1+y(13)/y(16)-params(17))*params(42)*1/y(16)+T262*1/y(16)-T10*T580);
  g1(7,16)=(1+y(27))*params(42)*(-y(13))/(y(16)*y(16))-((1+y(13)/y(16)-params(17))*params(42)*(-y(13))/(y(16)*y(16))+T262*(-y(13))/(y(16)*y(16))-T10*T644);
  g1(7,22)=(-((-y(32))/(y(22)*y(22))));
  g1(7,27)=1+T262;
  g1(7,32)=(-(1/y(22)));
  g1(8,12)=(1+y(27))*params(41)*1/y(15)-((1+y(12)/y(15)-params(16))*params(41)*1/y(15)+T276*1/y(15)-T22*T563);
  g1(8,15)=(1+y(27))*params(41)*(-y(12))/(y(15)*y(15))-((1+y(12)/y(15)-params(16))*params(41)*(-y(12))/(y(15)*y(15))+T276*(-y(12))/(y(15)*y(15))-T22*T619);
  g1(8,22)=(-((-y(31))/(y(22)*y(22))));
  g1(8,27)=1+T276;
  g1(8,31)=(-(1/y(22)));
  g1(9,2)=(-(y(21)*(1+y(27))*(-params(22))/y(21)));
  g1(9,27)=(-(y(21)*(1-params(22)*(y(2)-params(13)))/y(21)));
  g1(9,29)=1;
  g1(10,13)=(-1);
  g1(10,16)=1+params(25)-(1-params(17));
  g1(11,12)=(-1);
  g1(11,15)=1+params(25)-(1-params(16));
  g1(12,14)=(-1);
  g1(12,37)=1+params(25)-(1-params(18));
  g1(13,37)=(-params(59));
  g1(13,38)=1;
  g1(14,17)=(-(y(25)*y(23)*(1-params(7))))/(y(17)*y(17));
  g1(14,23)=y(25)*(1-params(7))/y(17);
  g1(14,25)=y(23)*(1-params(7))/y(17);
  g1(14,35)=(-1);
  g1(15,18)=(-(y(26)*x(26)*(1-params(8))))/(y(18)*y(18));
  g1(15,26)=x(26)*(1-params(8))/y(18);
  g1(15,35)=(-1);
  g1(16,15)=(-(y(25)*y(23)*params(7)))/(y(15)*y(15));
  g1(16,23)=y(25)*params(7)/y(15);
  g1(16,25)=y(23)*params(7)/y(15);
  g1(16,31)=(-1);
  g1(17,16)=(-(y(26)*x(26)*params(8)))/(y(16)*y(16));
  g1(17,26)=x(26)*params(8)/y(16);
  g1(17,32)=(-1);
  g1(18,6)=(-compn__);
  g1(18,7)=(-compn__);
  g1(18,12)=(-(params(1)*(1+y(15)*T22*T563)));
  g1(18,13)=(-(params(1)*(1+y(16)*T10*T580)));
  g1(18,14)=(-(abcap__*params(5)+y(14)*params(5)*T598));
  g1(18,15)=(-(params(1)*(T287+y(15)*T22*T619)));
  g1(18,16)=(-(params(1)*(T273+y(16)*T10*T644)));
  g1(18,23)=(-((y(6)+y(7))*(T66*(1-params(56)-params(55))*getPowerDeriv(y(23),(-params(21)),1)-(1-params(56)-params(55))*y(23)^(-params(21))*(1-params(56)-params(55))*getPowerDeriv(y(23),1-params(21),1))/(T66*T66)));
  g1(18,25)=1;
  g1(18,37)=(-(y(14)*params(5)*T846));
  g1(19,17)=1;
  g1(19,18)=1;
  g1(20,2)=1-((1+y(29))/(1+params(25))+params(22)/2*2*(y(2)-params(13)));
  g1(20,3)=1-(1+y(28))/(1+params(25));
  g1(20,4)=params(38)-params(38)*(1+y(30))/(1+params(25));
  g1(20,6)=(-1);
  g1(20,7)=(-1);
  g1(20,9)=1;
  g1(20,12)=(-(y(22)*(1+y(15)*T22*T563)));
  g1(20,13)=(-(y(22)*(1+y(16)*T10*T580)));
  g1(20,14)=(-(y(24)*abcap__+y(14)*y(24)*T598));
  g1(20,15)=(-(y(22)*(T287+y(15)*T22*T619)));
  g1(20,16)=(-(y(22)*(T273+y(16)*T10*T644)));
  g1(20,20)=1;
  g1(20,22)=(-(y(13)+y(12)+ACx__+ACn__));
  g1(20,23)=y(25);
  g1(20,24)=(-(y(14)*abcap__));
  g1(20,25)=y(23);
  g1(20,26)=x(26);
  g1(20,28)=(-T423);
  g1(20,29)=(-(y(2)/(1+params(25))));
  g1(20,30)=(-(params(38)*y(4)/(1+params(25))));
  g1(20,37)=(-(y(14)*y(24)*T846));
  g1(21,7)=1;
  g1(21,11)=(-((-(params(37)*y(35)*params(3)+params(3)/(1+params(3))*(y(34)+x(25))))/((1+y(11))*(1+y(11)))));
  g1(21,34)=(-(params(3)/(1+params(3))/(1+y(11))));
  g1(21,35)=(-(params(3)*params(37)/(1+y(11))));
  g1(22,23)=(-(y(25)*params(48)/(y(24)*y(38))));
  g1(22,24)=(-((-(y(38)*(y(25)*y(23)*params(48)+y(26)*x(26)*params(49))))/(y(24)*y(38)*y(24)*y(38))));
  g1(22,25)=(-(y(23)*params(48)/(y(24)*y(38))));
  g1(22,26)=(-(x(26)*params(49)/(y(24)*y(38))));
  g1(22,33)=1;
  g1(22,38)=(-((-(y(24)*(y(25)*y(23)*params(48)+y(26)*x(26)*params(49))))/(y(24)*y(38)*y(24)*y(38))));
  g1(23,3)=(-(params(43)*T405*params(23)*1/y(36)));
  g1(23,4)=(-(params(43)*T405*params(23)*params(38)/y(36)));
  g1(23,30)=1;
  g1(23,36)=(-(params(43)*T405*params(23)*((-y(3))/(y(36)*y(36))+(-(params(38)*y(4)))/(y(36)*y(36)))));
  g1(24,29)=1;
  g1(24,30)=(-1);
  g1(25,23)=(-y(25));
  g1(25,25)=(-y(23));
  g1(25,26)=(-x(26));
  g1(25,36)=1;
  g1(26,10)=1;
  g1(27,1)=(-(y(21)*(1+y(27))/(1+params(25))-y(21)));
  g1(27,3)=(-((1+y(28))/(1+params(25))-1));
  g1(27,4)=(-(params(38)*(1+y(30))/(1+params(25))-params(38)));
  g1(27,6)=params(31);
  g1(27,7)=params(31);
  g1(27,8)=1;
  g1(27,9)=1;
  g1(27,14)=(-(y(24)*abcap__+y(14)*y(24)*T598));
  g1(27,20)=1;
  g1(27,21)=(-((1+y(27))*y(1)/(1+params(25))-y(1)));
  g1(27,24)=(-(y(14)*abcap__));
  g1(27,27)=(-(y(21)*y(1)/(1+params(25))));
  g1(27,28)=(-(T423-params(14)/(1+params(25))));
  g1(27,30)=(-(params(38)*y(4)/(1+params(25))));
  g1(27,37)=(-(y(14)*y(24)*T846));
  g1(27,38)=params(39);
  g1(28,8)=params(32);
  g1(28,34)=1;
  g1(29,6)=(-((-(y(8)*(1-params(32))))/((y(6)+y(7))*(y(6)+y(7)))));
  g1(29,7)=(-((-(y(8)*(1-params(32))))/((y(6)+y(7))*(y(6)+y(7)))));
  g1(29,8)=(-((1-params(32))/(y(6)+y(7))));
  g1(29,11)=1;
  g1(30,3)=1-1/(1+params(25));
  g1(30,36)=(-((-(x(4)*T790))/(uazuaz__*uazuaz__)+(-(x(5)*T790))/(uazuaz__*uazuaz__)+(-(x(6)*T790))/(uazuaz__*uazuaz__)));
  g1(31,19)=1;
  g1(33,1)=1-1/(1+params(25));
  g1(33,21)=(-((-(params(74)/y(36)*x(10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(36)*x(11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(36)*x(12)))/(uaz_b__*uaz_b__)));
  g1(33,36)=(-((-(x(10)*T805))/(uaz_b__*uaz_b__)+(-(x(11)*T805))/(uaz_b__*uaz_b__)+(-(x(12)*T805))/(uaz_b__*uaz_b__)));
  g1(34,4)=1-1/(1+params(25));
  g1(34,36)=(-((-(x(7)*T790))/(uazuaz__*uazuaz__)+(-(x(8)*T790))/(uazuaz__*uazuaz__)+(-(x(9)*T790))/(uazuaz__*uazuaz__)));
  g1(35,14)=uaz__;
  g1(35,24)=y(14)*params(74)*1/params(46)/y(36);
  g1(35,36)=y(14)*(-(params(74)*y(24)/params(46)))/(y(36)*y(36));
  g1(36,9)=uazuaz__;
  g1(36,36)=y(9)*T790;
  g1(37,20)=uazuaz__;
  g1(37,36)=y(20)*T790;
  g1(38,3)=y(28)/(1+params(25));
  g1(38,28)=T423;
  g1(38,36)=(-((-(int_repayment__*T790))/(uazuaz__*uazuaz__)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,1444);
end
end
