/* create a string that will be saved as shocks.mod file */
exports.writeShockFile = function ( shockData ) {
    var shockString = "shocks; \n\n"
    for (shock in shockData) {
	// shock0 -- temporary (positive) shock
	shockString += "var e_" + shock + "0; \n";
	shockString += "periods " 
	    + makePdsArray(shockData[shock].tempVals.length) + "; \n";
	shockString += "values " + shockData[shock].tempVals + "; \n\n";

	// shock1 -- perm shock 1
	if (shockData[shock].permVals[0] != 0) {
	    shockString += "var e_" + shock + "1; \n";
	    shockString += "periods " + shockData[shock].permPds1[0] + ":"
		+ shockData[shock].permPds1[1] + "; \n";
	    shockString += "values " + shockData[shock].permVals[0] + "; \n\n";
	}
	
	// shock2 -- perm shock 2
	if (shockData[shock].permVals[1] != 0) {
	    shockString += "var e_" + shock + "2; \n";
	    shockString += "periods " + shockData[shock].permPds2[0] + ":"
		+ shockData[shock].permPds2[1] + "; \n";
	    shockString += "values " + shockData[shock].permVals[1] + "; \n\n";
	}
    }
    shockString += "end; \n\n";
    return shockString;
};

/* create a string that will be saved as set_fiscal_params.m (DSF only) */
exports.writeFiscalFile = function( fiscalData ) {
    var fiscalString = "";

    fiscalString += "lambda = " + fiscalData.lambda + ";\n";
    fiscalString += "lambda1 = " + fiscalData.lambda1 + ";\n";    
    fiscalString += "lambda2 = " + fiscalData.lambda2 + ";\n";
    fiscalString += "lambda3 = " + fiscalData.lambda3 + ";\n";
    fiscalString += "lambda4 = " + fiscalData.lambda4 + ";\n";

    fiscalString += "theta_hbar = " + fiscalData.theta_hbar + ";\n";
    fiscalString += "theta_Tbar = " + fiscalData.theta_Tbar + ";\n";

    fiscalString += "hbar = " + fiscalData.hbar + ";\n";
    fiscalString += "Tbar = " + fiscalData.Tbar + ";\n";

    fiscalString += "save(\"params.mat\", \"lambda\", \"lambda1\", \"lambda2\", \"lambda3\", \"lambda4\", \"theta_hbar\", \"theta_Tbar\", \"hbar\", \"Tbar\", \"-append\")\n";

    return fiscalString;
}

/* create a string that will be saved as DSF.mod (DSF only) */
exports.writeModFile = function( fiscalData ) {
    var modFile = ""

    if (fiscalData.debt=="exog") {
	modFile += "@#define exogenous = 1\n";
	modFile += "@#define endogenous_domestic = 0\n";
	modFile += "@#define endogenous_commercial = 0\n";
    }
    else if (fiscalData.debt=="comm") {
	modFile += "@#define exogenous = 0\n";
	modFile += "@#define endogenous_domestic = 0\n";
	modFile += "@#define endogenous_commercial = 1\n";	
    }
    else {
	modFile += "@#define exogenous = 1\n";
	modFile += "@#define endogenous_domestic = 1\n";
	modFile += "@#define endogenous_commercial = 0\n";
    }
    
    modFile += "\n@#include \"dsf_main.mod\"\n";
    modFile += "@#include \"shocks.mod\"\n\n";
    modFile += "options_.debug=1;\n";
    modFile += "simul(periods=750);";

    return modFile;
}

/* create a string that will be saved as set_params.m file */
exports.writeParamFile = function ( paramData ) {
    var paramString = "";
    
    var paramList = Object.keys(paramData);
    
    for (var i=0; i<paramList.length; i++) {
	param = paramList[i];
	paramString += param + " = " + paramData[param] + ";\n";
    }

    paramString += "save params.mat ";
    for (var j=0; j<paramList.length; j++) {
	paramString += paramList[j] + " "
    }

    paramString += ";";

    return paramString;
};

/* make a sequential array of counting numbers from 1 to T */
var makePdsArray = function( T ) {
    var pdsArray = [];
    for (var t=0; t<T; t++)
	pdsArray.push(t+1);
    return pdsArray;
};
