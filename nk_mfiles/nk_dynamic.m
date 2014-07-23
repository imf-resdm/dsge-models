function [residual, g1, g2, g3] = nk_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(10, 1);
T49 = 1/params(8)-1/(1+params(8));
lhs =y(13);
rhs =(1-params(5))*(1-params(5)*params(1))/params(5)*y(7)+params(1)*y(15);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =y(7)+y(12);
residual(2)= lhs-rhs;
lhs =params(3)*params(7)/(1-params(7))*y(5);
rhs =y(6)-y(14);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =y(14)+y(9);
residual(4)= lhs-rhs;
lhs =(-params(4))*y(11);
rhs =(-y(14))+T49*y(8);
residual(5)= lhs-rhs;
lhs =y(13)+y(10);
rhs =params(6)*y(1)+params(6)*y(4)+x(it_, 4)+x(it_, 5)+x(it_, 6);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(11)-y(2);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =y(8)-y(15);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(12)+y(5);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =params(2)*y(3)+x(it_, 1)+x(it_, 2)+x(it_, 3);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 22);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-((1-params(5))*(1-params(5)*params(1))/params(5)));
  g1(1,13)=1;
  g1(1,15)=(-params(1));
  g1(2,6)=1;
  g1(2,7)=(-1);
  g1(2,12)=(-1);
  g1(3,5)=params(3)*params(7)/(1-params(7));
  g1(3,6)=(-1);
  g1(3,14)=1;
  g1(4,9)=(-1);
  g1(4,14)=(-1);
  g1(4,16)=1;
  g1(5,8)=(-T49);
  g1(5,11)=(-params(4));
  g1(5,14)=1;
  g1(6,1)=(-params(6));
  g1(6,10)=1;
  g1(6,4)=(-params(6));
  g1(6,13)=1;
  g1(6,20)=(-1);
  g1(6,21)=(-1);
  g1(6,22)=(-1);
  g1(7,10)=1;
  g1(7,2)=1;
  g1(7,11)=(-1);
  g1(8,8)=(-1);
  g1(8,9)=1;
  g1(8,15)=1;
  g1(9,5)=(-1);
  g1(9,12)=(-1);
  g1(9,14)=1;
  g1(10,3)=(-params(2));
  g1(10,12)=1;
  g1(10,17)=(-1);
  g1(10,18)=(-1);
  g1(10,19)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,484);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,10648);
end
end
