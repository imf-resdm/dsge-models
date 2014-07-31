@#define exogenous = 1
@#define endogenous_domestic = 0
@#define endogenous_commercial = 0

@#include "dsf_main.mod"
@#include "shocks.mod"

// this prints residuals at each iteration
options_.debug = 1;

// run the simulation
simul(periods=500);