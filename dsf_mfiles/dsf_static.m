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

residual = zeros( 40, 1);

%
% Model equations
%

ACx__ = y(15)*params(42)/2*(y(12)/y(15)-params(17)-params(25))^2;
ACn__ = y(14)*params(41)/2*(y(11)/y(14)-params(16)-params(25))^2;
abcap__ = (params(76)*(params(25)+params(18))+(1+y(13)/y(39)-params(18)-params(25))^params(47)*(y(13)-params(76)*(params(25)+params(18))))/y(13);
compn__ = (1-params(56)-params(55))*y(21)^(-params(21))/(params(55)*y(24)^(1-params(21))+params(56)*y(23)^(1-params(21))+(1-params(56)-params(55))*y(21)^(1-params(21)));
DD__ = y(13)*y(22)*abcap__+(1+y(29))*y(3)/(1+params(25))-y(3)+params(38)*(1+y(32))*y(4)/(1+params(25))-params(38)*y(4)+y(19)*(1+y(28))*y(1)/(1+params(25))-y(19)*y(1)+params(70)-(y(5)+y(6))*params(31)-(y(8)+y(18))-y(40)*params(39);
DDo__ = params(70)+params(14)*(y(29)-params(25))/(1+params(25))+params(15)*params(38)*(params(58)+params(43)-params(25))/(1+params(25))+(params(57)-params(25))*params(12)/(1+params(25))+params(76)*(params(25)+params(18))*params(46)-params(31)*(params(20)+params(19))-(params(29)+params(44))-params(39)*params(75);
h_target__ = params(31)+y(7)*(1-params(32))/(y(5)+y(6));
T_target__ = params(70)-y(7)*params(32);
uazuaz__ = params(74)/y(38);
uaz_b__ = y(19)*params(74)/y(38);
uaz__ = params(74)*y(22)/params(46)/y(38);
T10 = params(42)/2;
T22 = params(41)/2;
T42 = (1+y(13)/y(39)-params(18)-params(25))^params(47);
T55 = (1-params(56)-params(55))*y(21)^(-params(21));
T63 = params(55)*y(24)^(1-params(21))+params(56)*y(23)^(1-params(21));
T66 = T63+(1-params(56)-params(55))*y(21)^(1-params(21));
T198 = params(4)*(y(27)/params(51))^params(65);
T201 = T198*y(40)^params(49);
T205 = y(15)^(params(73)+params(8));
T209 = y(17)^(1-params(8));
T217 = params(2)*(y(26)/params(50))^params(64);
T220 = T217*y(40)^params(48);
T224 = y(14)^(params(72)+params(7));
T228 = y(16)^(1-params(7));
T265 = T63+y(21)^(1-params(21))*(1-params(55)-params(56));
T279 = params(42)*(y(12)/y(15)-params(17)-params(25));
T290 = T10*(y(12)/y(15)-params(17)-params(25))^2;
T293 = params(41)*(y(11)/y(14)-params(16)-params(25));
T304 = T22*(y(11)/y(14)-params(16)-params(25))^2;
T422 = exp(params(23)*(y(3)/y(38)+params(38)*y(4)/y(38)-params(14)/params(74)-params(38)*params(15)/params(74)));
T438 = y(3)/(1+params(25));
T588 = 1/y(14)*2*(y(11)/y(14)-params(16)-params(25));
T605 = 1/y(15)*2*(y(12)/y(15)-params(17)-params(25));
T616 = getPowerDeriv(1+y(13)/y(39)-params(18)-params(25),params(47),1);
T623 = (y(13)*(T42+(y(13)-params(76)*(params(25)+params(18)))*1/y(39)*T616)-(params(76)*(params(25)+params(18))+T42*(y(13)-params(76)*(params(25)+params(18)))))/(y(13)*y(13));
T644 = 2*(y(11)/y(14)-params(16)-params(25))*(-y(11))/(y(14)*y(14));
T669 = 2*(y(12)/y(15)-params(17)-params(25))*(-y(12))/(y(15)*y(15));
T724 = getPowerDeriv(T265,1/(1-params(21)),1);
T820 = (-(params(3)/(1+params(3))/(1+y(9))));
T841 = (-params(74))/(y(38)*y(38));
T856 = (-(y(19)*params(74)))/(y(38)*y(38));
T898 = (y(13)-params(76)*(params(25)+params(18)))*T616*(-y(13))/(y(39)*y(39))/y(13);
lhs =y(27);
rhs =T201*T205*T209;
residual(1)= lhs-rhs;
lhs =y(26);
rhs =T220*T224*T228;
residual(2)= lhs-rhs;
lhs =y(20);
rhs =y(25)+y(21)*params(1);
residual(3)= lhs-rhs;
lhs =y(22);
rhs =y(25)+y(21)*params(5);
residual(4)= lhs-rhs;
lhs =y(23);
rhs =1+x(25)+x(26)+x(27);
residual(5)= lhs-rhs;
lhs =y(24);
rhs =1+x(28)+x(29)+x(30);
residual(6)= lhs-rhs;
lhs =y(25);
rhs =1+x(31)+x(32)+x(33);
residual(7)= lhs-rhs;
lhs =y(19);
rhs =T265^(1/(1-params(21)));
residual(8)= lhs-rhs;
lhs =1;
rhs =(1+y(28))*params(11)*(1+y(9))/((1+params(25))*(1+y(9)));
residual(9)= lhs-rhs;
lhs =(1+y(28))*(1+T279);
rhs =y(34)/y(20)+1-params(17)+T279*(1+y(12)/y(15)-params(17))-T290;
residual(10)= lhs-rhs;
lhs =(1+y(28))*(1+T293);
rhs =y(33)/y(20)+1-params(16)+T293*(1+y(11)/y(14)-params(16))-T304;
residual(11)= lhs-rhs;
lhs =1+y(31);
rhs =y(19)*(1+y(28))*(1-params(22)*(y(2)-params(13)))/y(19);
residual(12)= lhs-rhs;
lhs =y(15)*(1+params(25));
rhs =y(12)+y(15)*(1-params(17));
residual(13)= lhs-rhs;
lhs =y(14)*(1+params(25));
rhs =y(11)+y(14)*(1-params(16));
residual(14)= lhs-rhs;
lhs =y(39)*(1+params(25));
rhs =y(13)+y(39)*(1-params(18));
residual(15)= lhs-rhs;
lhs =y(40);
rhs =params(76)*params(60)+params(59)*(y(39)-params(76));
residual(16)= lhs-rhs;
lhs =y(26)*y(21)*(1-params(7))/y(16);
rhs =y(37);
residual(17)= lhs-rhs;
lhs =y(27)*y(23)*(1-params(8))/y(17);
rhs =y(37);
residual(18)= lhs-rhs;
lhs =y(26)*y(21)*params(7)/y(14);
rhs =y(33);
residual(19)= lhs-rhs;
lhs =y(27)*y(23)*params(8)/y(15);
rhs =y(34);
residual(20)= lhs-rhs;
lhs =y(26);
rhs =(y(5)+y(6))*compn__+params(1)*(y(12)+y(11)+ACx__+ACn__)+y(13)*abcap__*params(5);
residual(21)= lhs-rhs;
lhs =y(17)+y(16);
rhs =(1+params(3))*params(37);
residual(22)= lhs-rhs;
lhs =y(2)+y(3)+params(38)*y(4);
rhs =params(38)*(1+y(32))*y(4)/(1+params(25))+(1+y(29))*y(3)/(1+params(25))+y(13)*y(22)*abcap__+y(5)+y(6)+y(20)*(y(12)+y(11)+ACx__+ACn__)+(1+y(31))*y(2)/(1+params(25))+params(22)/2*(y(2)-params(13))^2-y(21)*y(26)-y(23)*y(27)-(y(8)+y(18))-y(30);
residual(23)= lhs-rhs;
lhs =y(6);
rhs =(params(37)*y(37)*params(3)+params(3)/(1+params(3))*(y(36)+y(30)))/(1+y(9));
residual(24)= lhs-rhs;
lhs =y(35);
rhs =(y(26)*y(21)*params(48)+y(27)*y(23)*params(49))/(y(22)*y(40));
residual(25)= lhs-rhs;
lhs =y(32);
rhs =params(58)+params(43)*T422;
residual(26)= lhs-rhs;
lhs =y(31);
rhs =y(32)+params(40);
residual(27)= lhs-rhs;
lhs =y(38);
rhs =y(21)*y(26)+y(23)*y(27);
residual(28)= lhs-rhs;
lhs =y(7);
rhs =DD__-DDo__;
residual(29)= lhs-rhs;
lhs =y(36);
rhs =T_target__;
residual(30)= lhs-rhs;
lhs =y(9);
rhs =h_target__;
residual(31)= lhs-rhs;
lhs =y(3);
rhs =params(25)*params(14)/(1+params(25))+T438+x(4)/uazuaz__+x(5)/uazuaz__+x(6)/uazuaz__;
residual(32)= lhs-rhs;
lhs =y(1);
rhs =params(25)*params(12)/(1+params(25))+y(1)/(1+params(25))+x(10)/uaz_b__+x(11)/uaz_b__+x(12)/uaz_b__;
residual(33)= lhs-rhs;
lhs =y(4);
rhs =params(25)*params(15)/(1+params(25))+y(4)/(1+params(25))+x(7)/uazuaz__+x(8)/uazuaz__+x(9)/uazuaz__;
residual(34)= lhs-rhs;
lhs =y(13)*uaz__;
rhs =params(76)*(params(25)+params(18))+x(1)+x(2)+x(3);
residual(35)= lhs-rhs;
lhs =y(8)*uazuaz__;
rhs =params(29)+x(13)+x(14)+x(15);
residual(36)= lhs-rhs;
lhs =y(18)*uazuaz__;
rhs =params(44)+x(16)+x(17)+x(18);
residual(37)= lhs-rhs;
lhs =y(30)*uazuaz__;
rhs =params(54)+x(37)+x(38)+x(39);
residual(38)= lhs-rhs;
lhs =y(10);
rhs =x(34)+x(35)+x(36);
residual(39)= lhs-rhs;
lhs =y(29)*y(3)/(1+params(25));
rhs =y(10)/uazuaz__;
residual(40)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(40, 40);

  %
  % Jacobian matrix
  %

  g1(1,15)=(-(T209*T201*getPowerDeriv(y(15),params(73)+params(8),1)));
  g1(1,17)=(-(T201*T205*getPowerDeriv(y(17),1-params(8),1)));
  g1(1,27)=1-T209*T205*y(40)^params(49)*params(4)*1/params(51)*getPowerDeriv(y(27)/params(51),params(65),1);
  g1(1,40)=(-(T209*T205*T198*getPowerDeriv(y(40),params(49),1)));
  g1(2,14)=(-(T228*T220*getPowerDeriv(y(14),params(72)+params(7),1)));
  g1(2,16)=(-(T220*T224*getPowerDeriv(y(16),1-params(7),1)));
  g1(2,26)=1-T228*T224*y(40)^params(48)*params(2)*1/params(50)*getPowerDeriv(y(26)/params(50),params(64),1);
  g1(2,40)=(-(T228*T224*T217*getPowerDeriv(y(40),params(48),1)));
  g1(3,20)=1;
  g1(3,21)=(-params(1));
  g1(3,25)=(-1);
  g1(4,21)=(-params(5));
  g1(4,22)=1;
  g1(4,25)=(-1);
  g1(5,23)=1;
  g1(6,24)=1;
  g1(7,25)=1;
  g1(8,19)=1;
  g1(8,21)=(-((1-params(55)-params(56))*getPowerDeriv(y(21),1-params(21),1)*T724));
  g1(8,23)=(-(T724*params(56)*getPowerDeriv(y(23),1-params(21),1)));
  g1(8,24)=(-(T724*params(55)*getPowerDeriv(y(24),1-params(21),1)));
  g1(9,9)=(-(((1+params(25))*(1+y(9))*(1+y(28))*params(11)-(1+params(25))*(1+y(28))*params(11)*(1+y(9)))/((1+params(25))*(1+y(9))*(1+params(25))*(1+y(9)))));
  g1(9,28)=(-(params(11)*(1+y(9))/((1+params(25))*(1+y(9)))));
  g1(10,12)=(1+y(28))*params(42)*1/y(15)-((1+y(12)/y(15)-params(17))*params(42)*1/y(15)+T279*1/y(15)-T10*T605);
  g1(10,15)=(1+y(28))*params(42)*(-y(12))/(y(15)*y(15))-((1+y(12)/y(15)-params(17))*params(42)*(-y(12))/(y(15)*y(15))+T279*(-y(12))/(y(15)*y(15))-T10*T669);
  g1(10,20)=(-((-y(34))/(y(20)*y(20))));
  g1(10,28)=1+T279;
  g1(10,34)=(-(1/y(20)));
  g1(11,11)=(1+y(28))*params(41)*1/y(14)-((1+y(11)/y(14)-params(16))*params(41)*1/y(14)+T293*1/y(14)-T22*T588);
  g1(11,14)=(1+y(28))*params(41)*(-y(11))/(y(14)*y(14))-((1+y(11)/y(14)-params(16))*params(41)*(-y(11))/(y(14)*y(14))+T293*(-y(11))/(y(14)*y(14))-T22*T644);
  g1(11,20)=(-((-y(33))/(y(20)*y(20))));
  g1(11,28)=1+T293;
  g1(11,33)=(-(1/y(20)));
  g1(12,2)=(-(y(19)*(1+y(28))*(-params(22))/y(19)));
  g1(12,28)=(-(y(19)*(1-params(22)*(y(2)-params(13)))/y(19)));
  g1(12,31)=1;
  g1(13,12)=(-1);
  g1(13,15)=1+params(25)-(1-params(17));
  g1(14,11)=(-1);
  g1(14,14)=1+params(25)-(1-params(16));
  g1(15,13)=(-1);
  g1(15,39)=1+params(25)-(1-params(18));
  g1(16,39)=(-params(59));
  g1(16,40)=1;
  g1(17,16)=(-(y(26)*y(21)*(1-params(7))))/(y(16)*y(16));
  g1(17,21)=y(26)*(1-params(7))/y(16);
  g1(17,26)=y(21)*(1-params(7))/y(16);
  g1(17,37)=(-1);
  g1(18,17)=(-(y(27)*y(23)*(1-params(8))))/(y(17)*y(17));
  g1(18,23)=y(27)*(1-params(8))/y(17);
  g1(18,27)=y(23)*(1-params(8))/y(17);
  g1(18,37)=(-1);
  g1(19,14)=(-(y(26)*y(21)*params(7)))/(y(14)*y(14));
  g1(19,21)=y(26)*params(7)/y(14);
  g1(19,26)=y(21)*params(7)/y(14);
  g1(19,33)=(-1);
  g1(20,15)=(-(y(27)*y(23)*params(8)))/(y(15)*y(15));
  g1(20,23)=y(27)*params(8)/y(15);
  g1(20,27)=y(23)*params(8)/y(15);
  g1(20,34)=(-1);
  g1(21,5)=(-compn__);
  g1(21,6)=(-compn__);
  g1(21,11)=(-(params(1)*(1+y(14)*T22*T588)));
  g1(21,12)=(-(params(1)*(1+y(15)*T10*T605)));
  g1(21,13)=(-(abcap__*params(5)+y(13)*params(5)*T623));
  g1(21,14)=(-(params(1)*(T304+y(14)*T22*T644)));
  g1(21,15)=(-(params(1)*(T290+y(15)*T10*T669)));
  g1(21,21)=(-((y(5)+y(6))*(T66*(1-params(56)-params(55))*getPowerDeriv(y(21),(-params(21)),1)-T55*(1-params(56)-params(55))*getPowerDeriv(y(21),1-params(21),1))/(T66*T66)));
  g1(21,23)=(-((y(5)+y(6))*(-(T55*params(56)*getPowerDeriv(y(23),1-params(21),1)))/(T66*T66)));
  g1(21,24)=(-((y(5)+y(6))*(-(T55*params(55)*getPowerDeriv(y(24),1-params(21),1)))/(T66*T66)));
  g1(21,26)=1;
  g1(21,39)=(-(y(13)*params(5)*T898));
  g1(22,16)=1;
  g1(22,17)=1;
  g1(23,2)=1-((1+y(31))/(1+params(25))+params(22)/2*2*(y(2)-params(13)));
  g1(23,3)=1-(1+y(29))/(1+params(25));
  g1(23,4)=params(38)-params(38)*(1+y(32))/(1+params(25));
  g1(23,5)=(-1);
  g1(23,6)=(-1);
  g1(23,8)=1;
  g1(23,11)=(-(y(20)*(1+y(14)*T22*T588)));
  g1(23,12)=(-(y(20)*(1+y(15)*T10*T605)));
  g1(23,13)=(-(y(22)*abcap__+y(13)*y(22)*T623));
  g1(23,14)=(-(y(20)*(T304+y(14)*T22*T644)));
  g1(23,15)=(-(y(20)*(T290+y(15)*T10*T669)));
  g1(23,18)=1;
  g1(23,20)=(-(y(12)+y(11)+ACx__+ACn__));
  g1(23,21)=y(26);
  g1(23,22)=(-(y(13)*abcap__));
  g1(23,23)=y(27);
  g1(23,26)=y(21);
  g1(23,27)=y(23);
  g1(23,29)=(-T438);
  g1(23,30)=1;
  g1(23,31)=(-(y(2)/(1+params(25))));
  g1(23,32)=(-(params(38)*y(4)/(1+params(25))));
  g1(23,39)=(-(y(13)*y(22)*T898));
  g1(24,6)=1;
  g1(24,9)=(-((-(params(37)*y(37)*params(3)+params(3)/(1+params(3))*(y(36)+y(30))))/((1+y(9))*(1+y(9)))));
  g1(24,30)=T820;
  g1(24,36)=T820;
  g1(24,37)=(-(params(3)*params(37)/(1+y(9))));
  g1(25,21)=(-(y(26)*params(48)/(y(22)*y(40))));
  g1(25,22)=(-((-(y(40)*(y(26)*y(21)*params(48)+y(27)*y(23)*params(49))))/(y(22)*y(40)*y(22)*y(40))));
  g1(25,23)=(-(y(27)*params(49)/(y(22)*y(40))));
  g1(25,26)=(-(y(21)*params(48)/(y(22)*y(40))));
  g1(25,27)=(-(y(23)*params(49)/(y(22)*y(40))));
  g1(25,35)=1;
  g1(25,40)=(-((-(y(22)*(y(26)*y(21)*params(48)+y(27)*y(23)*params(49))))/(y(22)*y(40)*y(22)*y(40))));
  g1(26,3)=(-(params(43)*T422*params(23)*1/y(38)));
  g1(26,4)=(-(params(43)*T422*params(23)*params(38)/y(38)));
  g1(26,32)=1;
  g1(26,38)=(-(params(43)*T422*params(23)*((-y(3))/(y(38)*y(38))+(-(params(38)*y(4)))/(y(38)*y(38)))));
  g1(27,31)=1;
  g1(27,32)=(-1);
  g1(28,21)=(-y(26));
  g1(28,23)=(-y(27));
  g1(28,26)=(-y(21));
  g1(28,27)=(-y(23));
  g1(28,38)=1;
  g1(29,1)=(-(y(19)*(1+y(28))/(1+params(25))-y(19)));
  g1(29,3)=(-((1+y(29))/(1+params(25))-1));
  g1(29,4)=(-(params(38)*(1+y(32))/(1+params(25))-params(38)));
  g1(29,5)=params(31);
  g1(29,6)=params(31);
  g1(29,7)=1;
  g1(29,8)=1;
  g1(29,13)=(-(y(22)*abcap__+y(13)*y(22)*T623));
  g1(29,18)=1;
  g1(29,19)=(-((1+y(28))*y(1)/(1+params(25))-y(1)));
  g1(29,22)=(-(y(13)*abcap__));
  g1(29,28)=(-(y(19)*y(1)/(1+params(25))));
  g1(29,29)=(-(T438-params(14)/(1+params(25))));
  g1(29,32)=(-(params(38)*y(4)/(1+params(25))));
  g1(29,39)=(-(y(13)*y(22)*T898));
  g1(29,40)=params(39);
  g1(30,7)=params(32);
  g1(30,36)=1;
  g1(31,5)=(-((-(y(7)*(1-params(32))))/((y(5)+y(6))*(y(5)+y(6)))));
  g1(31,6)=(-((-(y(7)*(1-params(32))))/((y(5)+y(6))*(y(5)+y(6)))));
  g1(31,7)=(-((1-params(32))/(y(5)+y(6))));
  g1(31,9)=1;
  g1(32,3)=1-1/(1+params(25));
  g1(32,38)=(-((-(x(4)*T841))/(uazuaz__*uazuaz__)+(-(x(5)*T841))/(uazuaz__*uazuaz__)+(-(x(6)*T841))/(uazuaz__*uazuaz__)));
  g1(33,1)=1-1/(1+params(25));
  g1(33,19)=(-((-(params(74)/y(38)*x(10)))/(uaz_b__*uaz_b__)+(-(params(74)/y(38)*x(11)))/(uaz_b__*uaz_b__)+(-(params(74)/y(38)*x(12)))/(uaz_b__*uaz_b__)));
  g1(33,38)=(-((-(x(10)*T856))/(uaz_b__*uaz_b__)+(-(x(11)*T856))/(uaz_b__*uaz_b__)+(-(x(12)*T856))/(uaz_b__*uaz_b__)));
  g1(34,4)=1-1/(1+params(25));
  g1(34,38)=(-((-(x(7)*T841))/(uazuaz__*uazuaz__)+(-(x(8)*T841))/(uazuaz__*uazuaz__)+(-(x(9)*T841))/(uazuaz__*uazuaz__)));
  g1(35,13)=uaz__;
  g1(35,22)=y(13)*params(74)*1/params(46)/y(38);
  g1(35,38)=y(13)*(-(params(74)*y(22)/params(46)))/(y(38)*y(38));
  g1(36,8)=uazuaz__;
  g1(36,38)=y(8)*T841;
  g1(37,18)=uazuaz__;
  g1(37,38)=y(18)*T841;
  g1(38,30)=uazuaz__;
  g1(38,38)=y(30)*T841;
  g1(39,10)=1;
  g1(40,3)=y(29)/(1+params(25));
  g1(40,10)=(-(1/uazuaz__));
  g1(40,29)=T438;
  g1(40,38)=(-((-(y(10)*T841))/(uazuaz__*uazuaz__)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,1600);
end
end
