function [residual, g1, g2] = ca_static(y, x, params)
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

residual = zeros( 21, 1);

%
% Model equations
%

T11 = y(1)^(-params(3));
T28 = params(13)/params(14)^2;
T46 = T11-params(6)*(1+params(21))*params(22)*y(21)^(-params(3));
T62 = y(3)^params(2);
T66 = y(2)^(params(1)-1);
T91 = y(2)^params(1);
T93 = y(3)^(params(2)-1);
T202 = getPowerDeriv(y(1),(-params(3)),1);
T295 = (-(params(6)*(1+params(21))*params(22)*getPowerDeriv(y(21),(-params(3)),1)));
lhs =0;
rhs =T11-T11*params(6)*(1+params(21))*params(22)-(1+y(8)+params(35)*y(6)*T28*(params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-params(15)))*params(6)*T46;
residual(1)= lhs-rhs;
lhs =0;
rhs =(-(T11-T11*params(6)*(1+params(21))*params(22)))/params(8)+(1-params(4))*params(6)*T46/params(8)+T62*T66*params(1)*params(6)*T46*params(23)*x(3);
residual(2)= lhs-rhs;
lhs =0;
rhs =(-(T11-T11*params(6)*(1+params(21))*params(22)))/params(9)+(1-params(5))*params(6)*T46/params(9)+T91*T93*params(2)*params(6)*T46*params(23)*x(3);
residual(3)= lhs-rhs;
lhs =0;
rhs =y(18)+y(11)+(1+params(21))*y(6)-(1+y(8))*y(6)-y(19)-y(4)-y(5)-y(17)-y(15)-y(16)+y(20);
residual(4)= lhs-rhs;
lhs =0;
rhs =y(11)-T62*params(23)*x(3)*T91;
residual(5)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(2)-(1-params(4))*y(2)-params(8)*y(4);
residual(6)= lhs-rhs;
lhs =0;
rhs =(1+params(21))*y(3)-y(3)*(1-params(5))-params(9)*y(5);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =params(12)+T28*(exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-(y(6)-params(18)-params(17)*y(13))*params(15)-params(16));
residual(8)= lhs-rhs;
lhs =0;
rhs =y(12)-y(19)-y(4)-y(5)-y(17)-y(16)-y(15)-y(10);
residual(9)= lhs-rhs;
lhs =0;
rhs =y(6)+y(7);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =y(20)+y(10)-y(8)*y(6);
residual(11)= lhs-rhs;
lhs =0;
rhs =y(12)-y(18)-y(11);
residual(12)= lhs-rhs;
lhs =0;
rhs =y(18)+(1+params(21))*y(13)/(1+params(12))-y(13);
residual(13)= lhs-rhs;
residual(14) = y(16);
residual(15) = y(15);
lhs =0;
rhs =T11-T11*params(6)*(1+params(21))*params(22)-params(7)*(y(14)^(-params(3))-params(6)*(1+params(21))*params(22)*y(14)^(-params(3)));
residual(16)= lhs-rhs;
lhs =0;
rhs =y(1)-(y(19)-params(22)*y(19));
residual(17)= lhs-rhs;
lhs =0;
rhs =y(14)-(y(17)-params(22)*y(17));
residual(18)= lhs-rhs;
lhs =y(18);
rhs =y(12)*x(1);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(12)*x(4);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(1);
residual(21)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(21, 21);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(T202-params(6)*(1+params(21))*params(22)*T202-(1+y(8)+params(35)*y(6)*T28*(params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-params(15)))*params(6)*T202));
  g1(1,6)=params(6)*T46*((params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-params(15))*params(35)*T28+params(35)*y(6)*T28*params(14)*params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13))));
  g1(1,8)=params(6)*T46;
  g1(1,13)=params(6)*T46*params(35)*y(6)*T28*params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))*params(14)*(-params(17));
  g1(1,21)=(1+y(8)+params(35)*y(6)*T28*(params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-params(15)))*params(6)*T295;
  g1(2,1)=(-((-(T202-params(6)*(1+params(21))*params(22)*T202))/params(8)+(1-params(4))*params(6)*T202/params(8)+T62*T66*params(1)*params(23)*x(3)*params(6)*T202));
  g1(2,2)=(-(T62*params(1)*params(6)*T46*params(23)*x(3)*getPowerDeriv(y(2),params(1)-1,1)));
  g1(2,3)=(-(T66*params(1)*params(6)*T46*params(23)*x(3)*getPowerDeriv(y(3),params(2),1)));
  g1(2,21)=(-((1-params(4))*params(6)*T295/params(8)+T62*T66*params(1)*params(23)*x(3)*params(6)*T295));
  g1(3,1)=(-((-(T202-params(6)*(1+params(21))*params(22)*T202))/params(9)+(1-params(5))*params(6)*T202/params(9)+T91*T93*params(2)*params(23)*x(3)*params(6)*T202));
  g1(3,2)=(-(T93*params(2)*params(6)*T46*params(23)*x(3)*getPowerDeriv(y(2),params(1),1)));
  g1(3,3)=(-(T91*params(2)*params(6)*T46*params(23)*x(3)*getPowerDeriv(y(3),params(2)-1,1)));
  g1(3,21)=(-((1-params(5))*params(6)*T295/params(9)+T91*T93*params(2)*params(23)*x(3)*params(6)*T295));
  g1(4,4)=1;
  g1(4,5)=1;
  g1(4,6)=(-(1+params(21)-(1+y(8))));
  g1(4,8)=y(6);
  g1(4,11)=(-1);
  g1(4,15)=1;
  g1(4,16)=1;
  g1(4,17)=1;
  g1(4,18)=(-1);
  g1(4,19)=1;
  g1(4,20)=(-1);
  g1(5,2)=T62*params(23)*x(3)*getPowerDeriv(y(2),params(1),1);
  g1(5,3)=params(23)*x(3)*T91*getPowerDeriv(y(3),params(2),1);
  g1(5,11)=(-1);
  g1(6,2)=(-(1+params(21)-(1-params(4))));
  g1(6,4)=params(8);
  g1(7,3)=(-(1+params(21)-(1-params(5))));
  g1(7,5)=params(9);
  g1(8,6)=(-(T28*(params(14)*exp(params(14)*(y(6)-params(18)-params(17)*y(13)))-params(15))));
  g1(8,8)=1;
  g1(8,13)=(-(T28*(exp(params(14)*(y(6)-params(18)-params(17)*y(13)))*params(14)*(-params(17))-params(15)*(-params(17)))));
  g1(9,4)=1;
  g1(9,5)=1;
  g1(9,10)=1;
  g1(9,12)=(-1);
  g1(9,15)=1;
  g1(9,16)=1;
  g1(9,17)=1;
  g1(9,19)=1;
  g1(10,6)=(-1);
  g1(10,7)=(-1);
  g1(11,6)=y(8);
  g1(11,8)=y(6);
  g1(11,9)=1;
  g1(11,10)=(-1);
  g1(11,20)=(-1);
  g1(12,11)=1;
  g1(12,12)=(-1);
  g1(12,18)=1;
  g1(13,13)=(-((1+params(21))/(1+params(12))-1));
  g1(13,18)=(-1);
  g1(14,16)=1;
  g1(15,15)=1;
  g1(16,1)=(-(T202-params(6)*(1+params(21))*params(22)*T202));
  g1(16,14)=params(7)*(getPowerDeriv(y(14),(-params(3)),1)-params(6)*(1+params(21))*params(22)*getPowerDeriv(y(14),(-params(3)),1));
  g1(17,1)=(-1);
  g1(17,19)=1-params(22);
  g1(18,14)=(-1);
  g1(18,17)=1-params(22);
  g1(19,12)=(-x(1));
  g1(19,18)=1;
  g1(20,12)=(-x(4));
  g1(20,20)=1;
  g1(21,1)=(-1);
  g1(21,21)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],21,441);
end
end
