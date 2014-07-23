#! /app/vendor/octave/bin/octave

#######################################################################
# development        - /usr/bin/octave
# staging/production - /app/vendor/octave/bin/octave
#######################################################################

# housekeeping
clear all;

# change working directory to the directory of this file
cur_path = strrep(mfilename("fullpath"), ["/" mfilename()], "");
eval(["cd " cur_path]);

# staging/production (i.e. deployed to Heroku) only
addpath /app/vendor/dynare/matlab

# set model name, do not icnlude ".mod"
model_name = "nk";

# set and save parameters (both explicit and implicit)
set_params;
set_params_imp;

# run model
eval(["dynare " model_name ".mod noclearall"]);

# make JSON file with results
jsonify_results([model_name "_results"]);
