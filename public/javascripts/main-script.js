/* this global var keeps track of whether or not the model has been run
   if not, then the flots plot null values (empty plots)
   but if yes, they plot the latest results
   it is updated in the #run-btn click function */
var hasRun = 0;

$(function() {

    alert("hasRun = " + hasRun);
    
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

    // socket.io test
    var socket = io.connect('http://ec2-54-201-118-146.us-west-2.compute.amazonaws.com:8080/');
    socket.on('news', function (data) {
	console.log(data);
	socket.emit('my other event', { my: 'data' });
    });
    
    /* run model when button is clicked */
    $("#run-btn").click(function() {
	
	// post the param, shock, etc. info first, then call runModel
	$.when(
	    $.ajax({
		url: "/writeParams",
		type: "POST",
		data: JSON.stringify({ model: whichModel,
				       paramData: getParamData() }),
		contentType: "application/json",
		success: function() {}
	    }),
	    $.ajax({
		url: "/writeShocks",
		type: "POST",
		data: JSON.stringify({ model : whichModel,
				       shockData : getShockData() }),
		contentType: "application/json",
		success: function() {}
	    }),
	    $.ajax({
		url: "/writeDSFfiles",
		type: "POST",
		data: JSON.stringify({ model: whichModel,
				       fiscalData: getFiscalData() }),
		contentType: "application/json",
		success: function() {}
	    })
	).done( function() {
	    
	    $.ajax({
		url: "/runWorker",
		type: "GET",
		data: { model: whichModel },
		timeout: 60*1000,
		success: function(data) {

		    hasRun = 1;
		    updatePlots();
		    
		    $("#save-scen-li").removeClass("disabled");
		    $("#download-li").removeClass("disabled");
		    
		    $("#console-text").append(data);
		    $("#console-text").scrollTop($("#console-text")[0]
						 .scrollHeight);
		}
	    });

	    /*$.get("/runWorker", 
		  { model: whichModel } )
		.done( function(data) {
		    hasRun = 1;
		    updatePlots();
		    
		    $("#save-scen-li").removeClass("disabled");
		    $("#download-li").removeClass("disabled");

		    $("#console-text").append(data);
		    $("#console-text").scrollTop($("#console-text")[0]
						 .scrollHeight);
		    
		})*/
	});
	
	// save the current scenario so the user can download it
	$.ajax({
	    url: "/saveScenario",
	    type: "POST",
	    data: JSON.stringify({ model      : whichModel,
				   paramData  : getParamData(),
				   fiscalData : getFiscalData(),
				   shockData  : getShockData()
				 }),
	    contentType: "application/json",
	    success: function() {},
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
    
    /* when the shocks tab is shown, re-run Mathjax */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	if ($(e.target).attr('href')=='#shocks'){
	    MathJax.Hub.Queue(["Typeset",MathJax.Hub,"shockTables"]);	    
	}
    }); 


    /* make a data structure out of parameter values
       must use ajax (not get) so that the process can be asynchronous
       otherwise paramData cannot be filled inside the call */
    var getParamData = function() {
	var paramData = {};
	$.ajax({
	    url: "/getParamList",
	    data: { model : whichModel }, 
	    success: function (paramList) {
		for (param in paramList) {
		    //var name = param;
		    var val = $("#" + param + "-pbox").val();
		    var command = 
			"paramData." + param + "=" + val + ";";
		    eval(command);
		}	
	    },
	    async: false
	});
	return paramData;
    };
    
    /* make a data structure of out fiscal settings */
    var getFiscalData = function() {
	var fiscalData = {};

	// lambda values
	fiscalData.lambda = $("#lambda-val").val();
	fiscalData.lambda1 = $("#lambda1-val").val();
	fiscalData.lambda2 = $("#lambda2-val").val();
	fiscalData.lambda3 = $("#lambda3-val").val();
	fiscalData.lambda4 = $("#lambda4-val").val();

	// 'exog', 'comm', or 'dom' debt
	fiscalData.debt = $("#debt-btns input:radio:checked").val();
	
	// theta_hbar + hbar
	fiscalData.hbar = $("#hbar-input").val();
	if ($("#tax-btns input:radio:checked").val()=="hbar")
	    fiscalData.theta_hbar = 1;
	else
	    fiscalData.theta_hbar = 0;

	// theta_Tbar + Tbar
	fiscalData.Tbar = $("#Tbar-input").val();
	if ($("#trans-btns input:radio:checked").val()=="Tbar")
	    fiscalData.theta_Tbar = 1;
	else
	    fiscalData.theta_Tbar = 0;

	return fiscalData;
    };
    
});
