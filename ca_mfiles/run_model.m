# housekeeping
clear all;

# change working directory to the directory of this file
cur_path = strrep(mfilename("fullpath"), ["/" mfilename()], "");
eval(["cd " cur_path]);

# set and save parameters (both explicit and implicit)
set_params;
set_params_imp;

# run model
itermax = 20;
dynare ca.mod noclearall;

# save plot vars
make_plot_vars;
