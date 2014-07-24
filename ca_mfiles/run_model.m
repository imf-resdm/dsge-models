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
eval(["dynare " model_name ".mod noclearall"]);
