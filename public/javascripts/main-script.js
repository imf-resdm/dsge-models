/* this global var keeps track of whether or not the model has been run
   if not, then the flots plot null values (empty plots)
   but if yes, they plot the latest results
   it is updated in the #run-btn click function */
var hasRun = 0;

$(function() {

    alert("hasRun = " + hasRun); // DEBUGGING ONLY

    /* a robust way to handle errors  */
    $.ajaxSetup({
        error: function(jqXHR, exception) {
            if (jqXHR.status === 0) {
                alert('Not connect.\n Verify Network.');
            } else if (jqXHR.status == 404) {
                alert('Requested page not found. [404]');
            } else if (jqXHR.status == 500) {
                alert('Internal Server Error [500].');
            } else if (exception === 'parsererror') {
                alert('Requested JSON parse failed.');
            } else if (exception === 'timeout') {
                alert('Time out error.');
            } else if (exception === 'abort') {
                alert('Ajax request aborted.');
            } else {
                alert('Uncaught Error.\n' + jqXHR.responseText + 
		      '\nException: ' + jqXHR.status);
            }
        }
    });
    
    /* run model when button is clicked */
    $("#run-btn").click(function() {

	// disable the dropdown menus for save scenario/download results
	// don't want them to be clicked on until new results are up
	$("#save-scen-li").addClass("disabled");
	$("#download-li").addClass("disabled");
	
	// post the param, shock, etc. info first, then call runModel
	$.when(
	    $.ajax({
		url: "/writeParams",
		type: "POST",
		data: JSON.stringify({ model: whichModel,
				       paramData: getParamData() }),
		contentType: "application/json",
		success: function() {},
		failure: function() { 
		    alert('error while writing parameters'); }
	    }),
	    $.ajax({
		url: "/writeShocks",
		type: "POST",
		data: JSON.stringify({ model : whichModel,
				       shockData : getShockData() }),
		contentType: "application/json",
		success: function() {},
		failure: function() { 
		    alert('error while writing shocks'); }
	    }),
	    $.ajax({
		url: "/writeDSFfiles",
		type: "POST",
		data: JSON.stringify({ model: whichModel,
				       fiscalData: getFiscalData() }),
		contentType: "application/json",
		success: function() {},
		failure: function() { 
		    alert('error while writing shocks'); }
	    })
	).done( function() {
	    
	    $.ajax({
		url: "/runWorker",
		type: "GET",
		data: { model: whichModel },
		success: function() {},
		failure: function() { 
		    alert('error while running model'); }
	    });

	});
	
	/* for the DFS model, save the fiscal settings, otherwise just save
	   the regular settings */
	if (whichModel == 'dsf') {
	    var data = { model      : whichModel,
			 paramData  : getParamData(),
			 fiscalData : getFiscalData(),
			 shockData  : getShockData()
		       };
	}
	else {
	    var data = { model      : whichModel,
			 paramData  : getParamData(),
			 shockData  : getShockData()
		       };
	}
	
	$.ajax({	    
	    url: "/saveScenario",
	    type: "POST",
	    data: JSON.stringify(data),
	    contentType: "application/json",
	    success: function() { alert('scenario saved'); },
	    failure: function() {}
	});
	
    });
    
    /* when a param table row is clicked, update the info div */
    $('#param-table').on('click', 'tr', function() {
	var rowIndex = this.rowIndex - 1; // account for zero-index
	$.get("/getParamList", 
	      { model : whichModel }, 
	      function(paramList) {
		  
		  // get data about params
		  var params = Object.keys(paramList);
		  var name = paramList[params[rowIndex]].name;
		  var latex = paramList[params[rowIndex]].latex; 
		  var val = paramList[params[rowIndex]].val;
		  var note = paramList[params[rowIndex]].note;
		  var eqnNums = paramList[params[rowIndex]].equations;
		  
		  // get list of equations
		  var eqnJSON;
		  $.ajax({
		      url : "/getEqnList",
		      data : { model : whichModel },
		      async : false,
		      success : function(eqnListJSON) {
			  eqnJSON = eqnListJSON;
		      }
		  });
		  var eqnLabels = Object.keys(eqnJSON);
		  var eqns = [];
		  for (var prop in eqnJSON){
		      eqns.push(eqnJSON[prop]);}
		  
		  // update param info tab with param data
		  $("#param-tab-east").
		      html(makeParamInfo(latex, val, note, 
					 eqns, eqnLabels, eqnNums));
		  
		  /* include this line so mathjax runs again */
		  MathJax.Hub.Queue(["Typeset",MathJax.Hub,"param-tab-east"]);
	      });
    });

    /* when a param table row is clicked, update the info div */
    $('#init-table').on('click', 'tr', function() {
	var rowIndex = this.rowIndex - 1; // account for zero-index
	$.get("/getInitList", 
	      { model : whichModel }, 
	      function(initList) {
		  
		  // get data about params
		  var inits = Object.keys(initList);
		  var name = initList[inits[rowIndex]].name;
		  var latex = initList[inits[rowIndex]].latex; 
		  var val = initList[inits[rowIndex]].val;
		  var note = initList[inits[rowIndex]].note;
		  var eqnNums = initList[inits[rowIndex]].equations;
		  
		  // get list of equations
		  var eqnJSON;
		  $.ajax({
		      url : "/getEqnList",
		      data : { model : whichModel },
		      async : false,
		      success : function(eqnListJSON) {
			  eqnJSON = eqnListJSON;
		      }
		  });
		  var eqnLabels = Object.keys(eqnJSON);
		  var eqns = [];
		  for (var prop in eqnJSON){
		      eqns.push(eqnJSON[prop]);}
		  
		  // update init info tab with init data
		  $("#init-tab-east").
		      html(makeParamInfo(latex, val, note, 
					 eqns, eqnLabels, eqnNums));
		  
		  /* include this line so mathjax runs again */
		  MathJax.Hub.Queue(["Typeset",MathJax.Hub,"init-tab-east"]);
	      });
    });
    
    /* helper function that creates text to put in the param info div */
    var makeParamInfo = function(latex, val, note, 
				 eqns, eqnLabels, eqnNums) {
	var info = "<p style=\"font-weight:bold;\">Parameter:</p><p>\\(" 
	    + latex + "\\)</p>";
	info += "<p style=\"font-weight:bold;\">Default value:</p><p>" 
	    + val + "</p>";
	info += "<p style=\"font-weight:bold;\">Notes:</p><p>"
	    + note + "</p>";
	info += "<p style=\"font-weight:bold;\">";
	info += "Appears in the following equations:</p>";
	
	// add mathjax/latex equations 
	for (var i=0; i<eqnNums.length; i++) {
	    var index = eqnNums[i] - 1;
	    info += "<p>" + eqnLabels[index] + "</p>";
	    info += "<p style=\"margin-left:3em\">\\(" 
		+ eqns[index] + "\\)</p>";
	}
	
	return info;
    };
    
    /* make a data structure out of shock paths */
    var getShockData = function() {
	var shockData = {};
	$.ajax({
	    url: "/getShockList",
	    data: { model : whichModel },
	    success: function (shockList) {
		for (shock in shockList) {
		    var tempVals = $("#" + shock + "-temp-table")
			.data("handsontable").getData();
		    
		    var permData1 = $("#" + shock + "-perm-table-1")
			.data("handsontable").getData();
		    var permData2 = $("#" + shock + "-perm-table-2")
			.data("handsontable").getData();
		    
		    var permVals = [permData1[2], permData2[2]];
		    var permPds1 = [permData1[0], permData1[1]];
		    var permPds2 = [permData2[0], permData2[1]];

		    // 1 -- make a data structure for each shock
		    var command1 = "var " + shock + " = { name:\"" + 
			shock + "\", tempVals: [" + tempVals + "], permVals: ["
			+ permVals + "], permPds1: [" + permPds1 
			+ "], permPds2: [" + permPds2 + "]};";
		    eval(command1);
		    
		    // 2 -- add that structure to the shockData object 
		    var command2 = "shockData." + shock + "=" + shock + ";";
		    eval(command2);
		}
	    },
	    async: false
	});
	return shockData;
    };
    
    /* make a data structure out of parameter values
       must use ajax (not get) so that the process can be asynchronous
       otherwise paramData cannot be filled inside the call */
    var getParamData = function() {
	var paramData = {};

	// get params and initial condition JSONs
	var paramList = {};
	var initList = {};
	$.ajax({
	    url: "/getParamList",
	    data: { model : whichModel }, 
	    success: function (res) {
		paramList = res; },
	    async: false
	});
	$.ajax({
	    url: "/getInitList",
	    data: { model : whichModel }, 
	    success: function (res) {
		initList = res; },
	    async: false
	});

	// merge inits with params
	for (init in initList) {
	    paramList[init] = initList[init]; }

	// collect data on params and inits
	for (param in paramList) {
	    //var name = param;
	    var val = $("#" + param + "-pbox").val();
	    var command = 
		"paramData." + param + "=" + val + ";";
	    eval(command);
	}
	
	return paramData;
    };

    /* make a data structure of out fiscal settings */
    var getFiscalData = function() {
	var fiscalData = {};

	// lambda values
	fiscalData.lambda = $("#lam-box").val();
	fiscalData.lambda1 = $("#lam1-box").val();
	fiscalData.lambda2 = $("#lam2-box").val();
	fiscalData.lambda3 = $("#lam3-box").val();
	fiscalData.lambda4 = $("#lam4-box").val();

	// 'exog', 'comm', or 'dom' debt
	fiscalData.debt = debtType;

	// theta_hbar + hbar
	fiscalData.hbar = $("#hbar-input").val();
	fiscalData.theta_hbar = theta_hbar;
	fiscalData.Tbar = $("#Tbar-input").val();
	fiscalData.theta_Tbar = theta_Tbar;

	return fiscalData;
    };
    
});
