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

residual = zeros(21, 1);
T21 = y(7)^(-params(3))-params(6)*(1+params(21))*params(22)*y(28)^(-params(3));
T35 = params(13)/params(14)^2;
T70 = y(8)^(params(1)-1);
T74 = y(9)^params(2);
T80 = T21*1/(1+params(21))*params(10);
T83 = y(8)/y(1)-1;
T86 = params(10)/2;
T89 = y(29)/y(8);
T90 = T89-1;
T91 = T90^2;
T109 = y(9)^(params(2)-1);
T111 = y(8)^params(1);
T115 = T21*1/(1+params(21))*params(11);
T118 = y(9)/y(2)-1;
T121 = params(11)/2;
T124 = y(30)/y(9);
T125 = T124-1;
T126 = T125^2;
T252 = y(28)^(-params(3))-params(6)*(1+params(21))*params(22)*y(33)^(-params(3));
T293 = (-(getPowerDeriv(y(7),(-params(3)),1)));
T295 = 1/(1+params(21))*getPowerDeriv(y(7),(-params(3)),1);
T305 = getPowerDeriv(y(28),(-params(3)),1);
T512 = (-(params(6)*(1+params(21))*params(22)*getPowerDeriv(y(33),(-params(3)),1)));
T513 = params(6)*T512;
lhs =0;
rhs =T21-(1+y(14)+params(35)*y(12)*T35*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*params(6)*T252;
residual(1)= lhs-rhs;
lhs =0;
rhs =(-T21)/params(8)+(1-params(4))*params(6)*T252/params(8)+T74*T70*params(1)*params(23)*x(it_, 3)*params(6)*T252-T80*T83-T91*T86*params(6)*T252+T89*T90*params(10)*params(6)*T252;
residual(2)= lhs-rhs;
lhs =0;
rhs =(-T21)/params(9)+(1-params(5))*params(6)*T252/params(9)+T111*T109*params(2)*params(23)*x(it_, 3)*params(6)*T252-T115*T118-T126*T121*params(6)*T252+T124*T125*params(11)*params(6)*T252;
residual(3)= lhs-rhs;
lhs =0;
rhs =y(24)+y(17)+(1+params(21))*y(12)-(1+y(4))*y(3)-y(25)-y(10)-y(11)-y(23)-y(21)-y(22)+y(26);
residual(4)= lhs-rhs;
lhs =0;
rhs =y(17)-params(23)*x(it_, 3)*y(1)^params(1)*y(2)^params(2);
residual(5)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(8)-(1-params(4))*y(1)-params(8)*y(10);
residual(6)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(9)-(1-params(5))*y(2)-params(9)*y(11);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(12)+T35*(exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-(y(12)-params(18)-params(17)*y(19))*params(15)-params(16));
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
rhs =y(24)+(1+params(21))*y(31)/(1+params(12))-y(19);
residual(13)= lhs-rhs;
lhs =y(22);
rhs =y(1)*T86*T83^2;
residual(14)= lhs-rhs;
lhs =y(21);
rhs =y(2)*T121*T118^2;
residual(15)= lhs-rhs;
lhs =0;
rhs =T21-params(7)*(y(20)^(-params(3))-params(6)*(1+params(21))*params(22)*y(32)^(-params(3)));
residual(16)= lhs-rhs;
lhs =0;
rhs =y(7)-(y(25)-params(22)*y(6));
residual(17)= lhs-rhs;
lhs =0;
rhs =y(20)-(y(23)-params(22)*y(5));
residual(18)= lhs-rhs;
lhs =y(24);
rhs =y(18)*x(it_, 1);
residual(19)= lhs-rhs;
lhs =y(26);
rhs =y(18)*x(it_, 4);
residual(20)= lhs-rhs;
lhs =y(27);
rhs =y(28);
residual(21)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(21, 37);

  %
  % Jacobian matrix
  %

  g1(1,7)=T293;
  g1(1,28)=(-((-(params(6)*(1+params(21))*params(22)*T305))-(1+y(14)+params(35)*y(12)*T35*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*params(6)*T305));
  g1(1,12)=params(6)*T252*((params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15))*params(35)*T35+params(35)*y(12)*T35*params(14)*params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19))));
  g1(1,14)=params(6)*T252;
  g1(1,19)=params(6)*T252*params(35)*y(12)*T35*params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))*params(14)*(-params(17));
  g1(1,33)=(1+y(14)+params(35)*y(12)*T35*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15)))*T513;
  g1(2,7)=(-(T293/params(8)-T83*params(10)*T295));
  g1(2,28)=(-(params(6)*(1+params(21))*params(22)*T305/params(8)+(1-params(4))*params(6)*T305/params(8)+T74*T70*params(1)*params(23)*x(it_, 3)*params(6)*T305-T83*params(10)*1/(1+params(21))*(-(params(6)*(1+params(21))*params(22)*T305))-T91*T86*params(6)*T305+T89*T90*params(10)*params(6)*T305));
  g1(2,1)=T80*(-y(8))/(y(1)*y(1));
  g1(2,8)=(-(T74*params(1)*params(23)*x(it_, 3)*params(6)*T252*getPowerDeriv(y(8),params(1)-1,1)-T80*1/y(1)-T86*params(6)*T252*(-y(29))/(y(8)*y(8))*2*T90+T90*params(10)*params(6)*T252*(-y(29))/(y(8)*y(8))+T89*params(10)*params(6)*T252*(-y(29))/(y(8)*y(8))));
  g1(2,29)=(-((-(T86*params(6)*T252*2*T90*1/y(8)))+T90*params(10)*params(6)*T252*1/y(8)+T89*params(10)*params(6)*T252*1/y(8)));
  g1(2,9)=(-(T70*params(1)*params(23)*x(it_, 3)*params(6)*T252*getPowerDeriv(y(9),params(2),1)));
  g1(2,36)=(-(T74*T70*params(1)*params(23)*params(6)*T252));
  g1(2,33)=(-((1-params(4))*params(6)*T512/params(8)+T74*T70*params(1)*params(23)*x(it_, 3)*T513-T91*T86*T513+T89*T90*params(10)*T513));
  g1(3,7)=(-(T293/params(9)-T118*params(11)*T295));
  g1(3,28)=(-(params(6)*(1+params(21))*params(22)*T305/params(9)+(1-params(5))*params(6)*T305/params(9)+T111*T109*params(2)*params(23)*x(it_, 3)*params(6)*T305-T118*params(11)*1/(1+params(21))*(-(params(6)*(1+params(21))*params(22)*T305))-T126*T121*params(6)*T305+T124*T125*params(11)*params(6)*T305));
  g1(3,8)=(-(T109*params(2)*params(23)*x(it_, 3)*params(6)*T252*getPowerDeriv(y(8),params(1),1)));
  g1(3,2)=T115*(-y(9))/(y(2)*y(2));
  g1(3,9)=(-(T111*params(2)*params(23)*x(it_, 3)*params(6)*T252*getPowerDeriv(y(9),params(2)-1,1)-T115*1/y(2)-T121*params(6)*T252*(-y(30))/(y(9)*y(9))*2*T125+T125*params(11)*params(6)*T252*(-y(30))/(y(9)*y(9))+T124*params(11)*params(6)*T252*(-y(30))/(y(9)*y(9))));
  g1(3,30)=(-((-(T121*params(6)*T252*2*T125*1/y(9)))+T125*params(11)*params(6)*T252*1/y(9)+T124*params(11)*params(6)*T252*1/y(9)));
  g1(3,36)=(-(T111*T109*params(2)*params(23)*params(6)*T252));
  g1(3,33)=(-((1-params(5))*params(6)*T512/params(9)+T111*T109*params(2)*params(23)*x(it_, 3)*T513-T126*T121*T513+T124*T125*params(11)*T513));
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
  g1(5,1)=y(2)^params(2)*params(23)*x(it_, 3)*getPowerDeriv(y(1),params(1),1);
  g1(5,2)=params(23)*x(it_, 3)*y(1)^params(1)*getPowerDeriv(y(2),params(2),1);
  g1(5,17)=(-1);
  g1(5,36)=y(2)^params(2)*params(23)*y(1)^params(1);
  g1(6,1)=1-params(4);
  g1(6,8)=(-(1+params(21)));
  g1(6,10)=params(8);
  g1(7,2)=1-params(5);
  g1(7,9)=(-(1+params(21)));
  g1(7,11)=params(9);
  g1(8,12)=(-(T35*(params(14)*exp(params(14)*(y(12)-params(18)-params(17)*y(19)))-params(15))));
  g1(8,14)=1;
  g1(8,19)=(-(T35*(exp(params(14)*(y(12)-params(18)-params(17)*y(19)))*params(14)*(-params(17))-params(15)*(-params(17)))));
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
  g1(13,31)=(-((1+params(21))/(1+params(12))));
  g1(13,24)=(-1);
  g1(14,1)=(-(T86*T83^2+y(1)*T86*(-y(8))/(y(1)*y(1))*2*T83));
  g1(14,8)=(-(y(1)*T86*2*T83*1/y(1)));
  g1(14,22)=1;
  g1(15,2)=(-(T121*T118^2+y(2)*T121*(-y(9))/(y(2)*y(2))*2*T118));
  g1(15,9)=(-(y(2)*T121*2*T118*1/y(2)));
  g1(15,21)=1;
  g1(16,7)=T293;
  g1(16,28)=params(6)*(1+params(21))*params(22)*T305;
  g1(16,20)=params(7)*getPowerDeriv(y(20),(-params(3)),1);
  g1(16,32)=params(7)*(-(params(6)*(1+params(21))*params(22)*getPowerDeriv(y(32),(-params(3)),1)));
  g1(17,7)=(-1);
  g1(17,6)=(-params(22));
  g1(17,25)=1;
  g1(18,20)=(-1);
  g1(18,5)=(-params(22));
  g1(18,23)=1;
  g1(19,18)=(-x(it_, 1));
  g1(19,24)=1;
  g1(19,34)=(-y(18));
  g1(20,18)=(-x(it_, 4));
  g1(20,26)=1;
  g1(20,37)=(-y(18));
  g1(21,28)=(-1);
  g1(21,27)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],21,1369);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],21,50653);
end
end
