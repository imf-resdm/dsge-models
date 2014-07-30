# housekeeping
clear all;

# change working directory to the directory of this file
cur_path = strrep(mfilename("fullpath"), ["/" mfilename()], "");
eval(["cd " cur_path]);

# set model name, do not icnlude ".mod"
model_name = "ca";

# set and save parameters (both explicit and implicit)
set_params;
set_params_imp;

# run model
itermax = 20;
eval(["dynare " model_name ".mod noclearall"]);

# save series to plot
# save main_data_riskpm_cal.mat c k s f ynon invs invk r tb ca gov ch govh y;
# save main_steadystate_riskpm_cal.mat cvalue kvalue svalue fvalue ynonvalue isvalue ikvalue rvalue tbvalue cavalue;
