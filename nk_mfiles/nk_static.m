function [residual, g1, g2] = nk_static(y, x, params)
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

residual = zeros( 10, 1);

%
% Model equations
%

T47 = 1/params(8)-1/(1+params(8));
lhs =y(9);
rhs =(1-params(5))*(1-params(5)*params(1))/params(5)*y(3)+y(9)*params(1);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(3)+y(8);
residual(2)= lhs-rhs;
lhs =params(3)*params(7)/(1-params(7))*y(1);
rhs =y(2)-y(10);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =y(10)+y(5);
residual(4)= lhs-rhs;
lhs =(-params(4))*y(7);
rhs =(-y(10))+T47*y(4);
residual(5)= lhs-rhs;
lhs =y(9)+y(6);
rhs =y(6)*params(6)+y(9)*params(6)+x(4)+x(5)+x(6);
residual(6)= lhs-rhs;
residual(7) = y(6);
lhs =y(5);
rhs =y(4)-y(9);
residual(8)= lhs-rhs;
lhs =y(10);
rhs =y(8)+y(1);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(2)+x(1)+x(2)+x(3);
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-((1-params(5))*(1-params(5)*params(1))/params(5)));
  g1(1,9)=1-params(1);
  g1(2,2)=1;
  g1(2,3)=(-1);
  g1(2,8)=(-1);
  g1(3,1)=params(3)*params(7)/(1-params(7));
  g1(3,2)=(-1);
  g1(3,10)=1;
  g1(4,5)=(-1);
  g1(5,4)=(-T47);
  g1(5,7)=(-params(4));
  g1(5,10)=1;
  g1(6,6)=1-params(6);
  g1(6,9)=1-params(6);
  g1(7,6)=1;
  g1(8,4)=(-1);
  g1(8,5)=1;
  g1(8,9)=1;
  g1(9,1)=(-1);
  g1(9,8)=(-1);
  g1(9,10)=1;
  g1(10,8)=1-params(2);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
end
end
