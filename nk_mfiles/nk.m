%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'nk';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nk.log');
M_.exo_names = 'e_e0';
M_.exo_names_tex = 'e\_e0';
M_.exo_names_long = 'e_e0';
M_.exo_names = char(M_.exo_names, 'e_e1');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_e1');
M_.exo_names_long = char(M_.exo_names_long, 'e_e1');
M_.exo_names = char(M_.exo_names, 'e_e2');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_e2');
M_.exo_names_long = char(M_.exo_names_long, 'e_e2');
M_.exo_names = char(M_.exo_names, 'e_em0');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_em0');
M_.exo_names_long = char(M_.exo_names_long, 'e_em0');
M_.exo_names = char(M_.exo_names, 'e_em1');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_em1');
M_.exo_names_long = char(M_.exo_names_long, 'e_em1');
M_.exo_names = char(M_.exo_names, 'e_em2');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_em2');
M_.exo_names_long = char(M_.exo_names_long, 'e_em2');
M_.endo_names = 'n';
M_.endo_names_tex = 'n';
M_.endo_names_long = 'n';
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'int');
M_.endo_names_tex = char(M_.endo_names_tex, 'int');
M_.endo_names_long = char(M_.endo_names_long, 'int');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'dm');
M_.endo_names_tex = char(M_.endo_names_tex, 'dm');
M_.endo_names_long = char(M_.endo_names_long, 'dm');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'torn');
M_.param_names_tex = char(M_.param_names_tex, 'torn');
M_.param_names_long = char(M_.param_names_long, 'torn');
M_.param_names = char(M_.param_names, 'v');
M_.param_names_tex = char(M_.param_names_tex, 'v');
M_.param_names_long = char(M_.param_names_long, 'v');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'rhom');
M_.param_names_tex = char(M_.param_names_tex, 'rhom');
M_.param_names_long = char(M_.param_names_long, 'rhom');
M_.param_names = char(M_.param_names, 'nstar');
M_.param_names_tex = char(M_.param_names_tex, 'nstar');
M_.param_names_long = char(M_.param_names_long, 'nstar');
M_.param_names = char(M_.param_names, 'istar');
M_.param_names_tex = char(M_.param_names_tex, 'istar');
M_.param_names_long = char(M_.param_names_long, 'istar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 6;
M_.endo_nbr = 10;
M_.param_nbr = 8;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.Sigma_e = zeros(6, 6);
M_.Correlation_matrix = eye(6, 6);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('nk_static');
erase_compiled_function('nk_dynamic');
M_.lead_lag_incidence = [
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 0;
 2 11 0;
 3 12 0;
 4 13 15;
 0 14 16;]';
M_.nstatic = 5;
M_.nfwrd   = 1;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:6];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(6, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 36;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
load params.mat;
for ii=1:length(M_.params)
param_name = M_.param_names(ii, :);
eval(['M_.params(ii)=' param_name ';']);
end
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
%
% SHOCKS instructions
%
make_ex_;
set_shocks(0,1, 1, 1);
set_shocks(0,2, 1, 0);
set_shocks(0,3, 1, 0);
set_shocks(0,4, 1, 0);
set_shocks(0,5, 1, 0);
set_shocks(0,6, 1, 0);
set_shocks(0,7, 1, 0);
set_shocks(0,8, 1, 0);
set_shocks(0,9, 1, 0);
set_shocks(0,10, 1, 0);
set_shocks(0,11, 1, 0);
set_shocks(0,12, 1, 0);
set_shocks(0,13, 1, 0);
set_shocks(0,14, 1, 0);
set_shocks(0,15, 1, 0);
set_shocks(0,16, 1, 0);
set_shocks(0,17, 1, 0);
set_shocks(0,18, 1, 0);
set_shocks(0,19, 1, 0);
set_shocks(0,20, 1, 0);
set_shocks(0,21, 1, 0);
set_shocks(0,22, 1, 0);
set_shocks(0,23, 1, 0);
set_shocks(0,24, 1, 0);
set_shocks(0,25, 1, 0);
set_shocks(0,26, 1, 0);
set_shocks(0,27, 1, 0);
set_shocks(0,28, 1, 0);
set_shocks(0,29, 1, 0);
set_shocks(0,30, 1, 0);
set_shocks(0,1, 4, 1);
set_shocks(0,2, 4, 0);
set_shocks(0,3, 4, 0);
set_shocks(0,4, 4, 0);
set_shocks(0,5, 4, 0);
set_shocks(0,6, 4, 0);
set_shocks(0,7, 4, 0);
set_shocks(0,8, 4, 0);
set_shocks(0,9, 4, 0);
set_shocks(0,10, 4, 0);
set_shocks(0,11, 4, 0);
set_shocks(0,12, 4, 0);
set_shocks(0,13, 4, 0);
set_shocks(0,14, 4, 0);
set_shocks(0,15, 4, 0);
set_shocks(0,16, 4, 0);
set_shocks(0,17, 4, 0);
set_shocks(0,18, 4, 0);
set_shocks(0,19, 4, 0);
set_shocks(0,20, 4, 0);
set_shocks(0,21, 4, 0);
set_shocks(0,22, 4, 0);
set_shocks(0,23, 4, 0);
set_shocks(0,24, 4, 0);
set_shocks(0,25, 4, 0);
set_shocks(0,26, 4, 0);
set_shocks(0,27, 4, 0);
set_shocks(0,28, 4, 0);
set_shocks(0,29, 4, 0);
set_shocks(0,30, 4, 0);
M_.exo_det_length = 0;
M_.sigma_e_is_diagonal = 1;
steady;
options_.periods = 1000;
simul();
save('nk_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nk_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nk_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nk_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nk_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
