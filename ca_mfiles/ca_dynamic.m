function [residual, g1, g2, g3] = ca_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(22, 1);
T21 = y(7)^(-params(3))-params(6)*(1+params(21))*params(22)*y(29)^(-params(3));
T33 = params(13)/params(14)^2;
T66 = y(8)^(params(1)-1);
T70 = y(9)^params(2);
T76 = T21*1/(1+params(21))*params(10);
T79 = y(8)/y(1)-1;
T82 = params(10)/2;
T85 = y(30)/y(8);
T86 = T85-1;
T87 = T86^2;
T105 = y(9)^(params(2)-1);
T107 = y(8)^params(1);
T111 = T21*1/(1+params(21))*params(11);
T114 = y(9)/y(2)-1;
T117 = params(11)/2;
T120 = y(31)/y(9);
T121 = T120-1;
T122 = T121^2;
T283 = y(29)^(-params(3))-params(6)*(1+params(21))*params(22)*y(34)^(-params(3));
T324 = (-(getPowerDeriv(y(7),(-params(3)),1)));
T326 = 1/(1+params(21))*getPowerDeriv(y(7),(-params(3)),1);
T336 = getPowerDeriv(y(29),(-params(3)),1);
T539 = (-(params(6)*(1+params(21))*params(22)*getPowerDeriv(y(34),(-params(3)),1)));
T540 = params(6)*T539;
lhs =0;
rhs =T21-(1+y(14)+y(12)*T33*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*params(6)*T283;
residual(1)= lhs-rhs;
lhs =0;
rhs =(-T21)/params(8)+(1-params(4))*params(6)*T283/params(8)+T70*T66*params(1)*y(27)*params(6)*T283-T76*T79-T87*T82*params(6)*T283+T85*T86*params(10)*params(6)*T283;
residual(2)= lhs-rhs;
lhs =0;
rhs =(-T21)/params(9)+(1-params(5))*params(6)*T283/params(9)+T107*T105*params(2)*y(27)*params(6)*T283-T111*T114-T122*T117*params(6)*T283+T120*T121*params(11)*params(6)*T283;
residual(3)= lhs-rhs;
lhs =0;
rhs =y(24)+y(17)+(1+params(21))*y(12)-(1+y(4))*y(3)-y(25)-y(10)-y(11)-y(23)-y(21)-y(22)+y(26);
residual(4)= lhs-rhs;
lhs =0;
rhs =y(17)-y(27)*y(1)^params(1)*y(2)^params(2);
residual(5)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(8)-(1-params(4))*y(1)-params(8)*y(10);
residual(6)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(9)-(1-params(5))*y(2)-params(9)*y(11);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(12)+T33*(exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-(y(12)-params(18)-params(17)*y(19))*params(15)-params(16));
residual(8)= lhs-rhs;
lhs =0;
rhs =y(18)-y(25)-y(10)-y(11)-y(23)-y(22)-y(21)-y(16);
residual(9)= lhs-rhs;
lhs =0;
rhs =y(12)+y(13);
residual(10)= lhs-rhs;
lhs =y(15);
rhs =y(26)+y(16)-y(4)*y(3);
residual(11)= lhs-rhs;
lhs =0;
rhs =y(18)-y(24)-y(17);
residual(12)= lhs-rhs;
lhs =0;
rhs =y(24)+(1+params(21))*y(32)/(1+params(12))-y(19);
residual(13)= lhs-rhs;
lhs =y(22);
rhs =y(1)*T82*T79^2;
residual(14)= lhs-rhs;
lhs =y(21);
rhs =y(2)*T117*T114^2;
residual(15)= lhs-rhs;
lhs =0;
rhs =T21-params(7)*(y(20)^(-params(3))-params(6)*(1+params(21))*params(22)*y(33)^(-params(3)));
residual(16)= lhs-rhs;
lhs =0;
rhs =y(7)-(y(25)-params(22)*y(6));
residual(17)= lhs-rhs;
lhs =0;
rhs =y(20)-(y(23)-params(22)*y(5));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =y(18)*(x(it_, 1)+x(it_, 2)+x(it_, 3)-x(it_, 4)-x(it_, 5)-x(it_, 6));
residual(19)= lhs-rhs;
lhs =y(26);
rhs =y(18)*(x(it_, 13)+x(it_, 14)+x(it_, 15)-x(it_, 16)-x(it_, 17)-x(it_, 18));
residual(20)= lhs-rhs;
lhs =y(27);
rhs =params(23)+1+x(it_, 7)+x(it_, 8)+x(it_, 9)-x(it_, 10)-x(it_, 11)-x(it_, 12);
residual(21)= lhs-rhs;
lhs =y(28);
rhs =y(29);
residual(22)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(22, 52);

  %
  % Jacobian matrix
  %

  g1(1,7)=T324;
  g1(1,29)=(-((-(params(6)*(1+params(21))*params(22)*T336))-(1+y(14)+y(12)*T33*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*params(6)*T336));
  g1(1,12)=params(6)*T283*(T33*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15))+y(12)*T33*params(14)*params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19))));
  g1(1,14)=params(6)*T283;
  g1(1,19)=params(6)*T283*y(12)*T33*params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))*params(14)*(-params(17));
  g1(1,34)=(1+y(14)+y(12)*T33*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*T540;
  g1(2,7)=(-(T324/params(8)-T79*params(10)*T326));
  g1(2,29)=(-(params(6)*(1+params(21))*params(22)*T336/params(8)+(1-params(4))*params(6)*T336/params(8)+T70*T66*params(1)*y(27)*params(6)*T336-T79*params(10)*1/(1+params(21))*(-(params(6)*(1+params(21))*params(22)*T336))-T87*T82*params(6)*T336+T85*T86*params(10)*params(6)*T336));
  g1(2,1)=T76*(-y(8))/(y(1)*y(1));
  g1(2,8)=(-(T70*params(1)*y(27)*params(6)*T283*getPowerDeriv(y(8),params(1)-1,1)-T76*1/y(1)-T82*params(6)*T283*(-y(30))/(y(8)*y(8))*2*T86+T86*params(10)*params(6)*T283*(-y(30))/(y(8)*y(8))+T85*params(10)*params(6)*T283*(-y(30))/(y(8)*y(8))));
  g1(2,30)=(-((-(T82*params(6)*T283*2*T86*1/y(8)))+T86*params(10)*params(6)*T283*1/y(8)+T85*params(10)*params(6)*T283*1/y(8)));
  g1(2,9)=(-(T66*params(1)*y(27)*params(6)*T283*getPowerDeriv(y(9),params(2),1)));
  g1(2,27)=(-(T70*T66*params(1)*params(6)*T283));
  g1(2,34)=(-((1-params(4))*params(6)*T539/params(8)+T70*T66*params(1)*y(27)*T540-T87*T82*T540+T85*T86*params(10)*T540));
  g1(3,7)=(-(T324/params(9)-T114*params(11)*T326));
  g1(3,29)=(-(params(6)*(1+params(21))*params(22)*T336/params(9)+(1-params(5))*params(6)*T336/params(9)+T107*T105*params(2)*y(27)*params(6)*T336-T114*params(11)*1/(1+params(21))*(-(params(6)*(1+params(21))*params(22)*T336))-T122*T117*params(6)*T336+T120*T121*params(11)*params(6)*T336));
  g1(3,8)=(-(T105*params(2)*y(27)*params(6)*T283*getPowerDeriv(y(8),params(1),1)));
  g1(3,2)=T111*(-y(9))/(y(2)*y(2));
  g1(3,9)=(-(T107*params(2)*y(27)*params(6)*T283*getPowerDeriv(y(9),params(2)-1,1)-T111*1/y(2)-T117*params(6)*T283*(-y(31))/(y(9)*y(9))*2*T121+T121*params(11)*params(6)*T283*(-y(31))/(y(9)*y(9))+T120*params(11)*params(6)*T283*(-y(31))/(y(9)*y(9))));
  g1(3,31)=(-((-(T117*params(6)*T283*2*T121*1/y(9)))+T121*params(11)*params(6)*T283*1/y(9)+T120*params(11)*params(6)*T283*1/y(9)));
  g1(3,27)=(-(T107*T105*params(2)*params(6)*T283));
  g1(3,34)=(-((1-params(5))*params(6)*T539/params(9)+T107*T105*params(2)*y(27)*T540-T122*T117*T540+T120*T121*params(11)*T540));
  g1(4,10)=1;
  g1(4,11)=1;
  g1(4,3)=1+y(4);
  g1(4,12)=(-(1+params(21)));
  g1(4,4)=y(3);
  g1(4,17)=(-1);
  g1(4,21)=1;
  g1(4,22)=1;
  g1(4,23)=1;
  g1(4,24)=(-1);
  g1(4,25)=1;
  g1(4,26)=(-1);
  g1(5,1)=y(2)^params(2)*y(27)*getPowerDeriv(y(1),params(1),1);
  g1(5,2)=y(27)*y(1)^params(1)*getPowerDeriv(y(2),params(2),1);
  g1(5,17)=(-1);
  g1(5,27)=y(1)^params(1)*y(2)^params(2);
  g1(6,1)=1-params(4);
  g1(6,8)=(-(1+params(21)));
  g1(6,10)=params(8);
  g1(7,2)=1-params(5);
  g1(7,9)=(-(1+params(21)));
  g1(7,11)=params(9);
  g1(8,12)=(-(T33*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15))));
  g1(8,14)=1;
  g1(8,19)=(-(T33*(exp(params(14)*(y(12)-params(18)-params(17)*y(19)))*params(14)*(-params(17))-params(15)*(-params(17)))));
  g1(9,10)=1;
  g1(9,11)=1;
  g1(9,16)=1;
  g1(9,18)=(-1);
  g1(9,21)=1;
  g1(9,22)=1;
  g1(9,23)=1;
  g1(9,25)=1;
  g1(10,12)=(-1);
  g1(10,13)=(-1);
  g1(11,3)=y(4);
  g1(11,4)=y(3);
  g1(11,15)=1;
  g1(11,16)=(-1);
  g1(11,26)=(-1);
  g1(12,17)=1;
  g1(12,18)=(-1);
  g1(12,24)=1;
  g1(13,19)=1;
  g1(13,32)=(-((1+params(21))/(1+params(12))));
  g1(13,24)=(-1);
  g1(14,1)=(-(T82*T79^2+y(1)*T82*(-y(8))/(y(1)*y(1))*2*T79));
  g1(14,8)=(-(y(1)*T82*2*T79*1/y(1)));
  g1(14,22)=1;
  g1(15,2)=(-(T117*T114^2+y(2)*T117*(-y(9))/(y(2)*y(2))*2*T114));
  g1(15,9)=(-(y(2)*T117*2*T114*1/y(2)));
  g1(15,21)=1;
  g1(16,7)=T324;
  g1(16,29)=params(6)*(1+params(21))*params(22)*T336;
  g1(16,20)=params(7)*getPowerDeriv(y(20),(-params(3)),1);
  g1(16,33)=params(7)*(-(params(6)*(1+params(21))*params(22)*getPowerDeriv(y(33),(-params(3)),1)));
  g1(17,7)=(-1);
  g1(17,6)=(-params(22));
  g1(17,25)=1;
  g1(18,20)=(-1);
  g1(18,5)=(-params(22));
  g1(18,23)=1;
  g1(19,18)=(-(x(it_, 1)+x(it_, 2)+x(it_, 3)-x(it_, 4)-x(it_, 5)-x(it_, 6)));
  g1(19,24)=1;
  g1(19,35)=(-y(18));
  g1(19,36)=(-y(18));
  g1(19,37)=(-y(18));
  g1(19,38)=y(18);
  g1(19,39)=y(18);
  g1(19,40)=y(18);
  g1(20,18)=(-(x(it_, 13)+x(it_, 14)+x(it_, 15)-x(it_, 16)-x(it_, 17)-x(it_, 18)));
  g1(20,26)=1;
  g1(20,47)=(-y(18));
  g1(20,48)=(-y(18));
  g1(20,49)=(-y(18));
  g1(20,50)=y(18);
  g1(20,51)=y(18);
  g1(20,52)=y(18);
  g1(21,27)=1;
  g1(21,41)=(-1);
  g1(21,42)=(-1);
  g1(21,43)=(-1);
  g1(21,44)=1;
  g1(21,45)=1;
  g1(21,46)=1;
  g1(22,29)=(-1);
  g1(22,28)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],22,2704);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],22,140608);
end
end
