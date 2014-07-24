@#define exogenous = 0
@#define endogenous_domestic = 0
@#define endogenous_commercial = 1

@#include "dsf_main.mod"
@#include "shocks.mod"

simul(periods=1000);