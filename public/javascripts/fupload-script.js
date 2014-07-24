$(function() {

    /* when the load scenario button gets clicked, trigger the (hidden!) file
       input so that it acts like it has been cliced. this allows us to have
       the behavior of a form with the UI of a dropdown menu */
    $("#load-scen-btn").click(function() {
	$("input:file").trigger("click");
    });
    
    /* when the input file is changed, load in the selected scenario
       NOTE: this will not work if you load a file, make some changes, and
       then try to load the same file -- I need to fix this */
    $("input:file").on("change", function(evt) {
	evt.preventDefault();
	var formData = new FormData();
	var file = document.getElementById('myFile').files[0];

	readFile(file, function(data) {
            var fileString = data.target.result;
	    try {
		var fileJSON = $.parseJSON(fileString);
		checkJSON(fileJSON);
		useNewScenario(fileJSON);
	    }
	    catch (e) {
		alert("Not a valid scenario file. " + e);
	    }
	});
    });

    /* once a scenario has been validated, fill the app in with all its data */
    var useNewScenario = function(fileJSON) {

	// insert parameters
	var paramList = fileJSON.paramData;
	for (param in paramList)
	    $("#" + param + "-pbox").val(paramList[param]);

	// insert shocks
	var shockList = fileJSON.shockData;
	for (shock in shockList) {
	    $("#" + shock + "-temp-table").data("handsontable")
		.loadData([shockList[shock].tempVals]);
	}

	// for DSF model, insert fiscal data
	if (fileJSON.model=='dsf') {
	    var fisc = fileJSON.fiscalData;
	    loadFiscalSettings(fisc);
	}
    };

    /* for the DSF model only, put in the user-defined fiscal settings */
    var loadFiscalSettings = function(fisc) {
	
	// set text boxes
	$('#lambda-val').val(fisc.lambda);
	$('#lambda1-val').val(fisc.lambda1);
	$('#lambda2-val').val(fisc.lambda2);
	$('#lambda3-val').val(fisc.lambda3);
	$('#lambda4-val').val(fisc.lambda4);
	$('#hbar-input').val(fisc.hbar);
	$('#Tbar-input').val(fisc.Tbar);

	// set debt type and adjust tax settings
	if (fisc.debt=='exog') {
	    $('#debt-comm').attr('checked', false);
	    $('#lab-comm').removeClass('active');
	    $('#debt-dom').attr('checked', false);
	    $('#lab-dom').removeClass('active');
	    $('#debt-exog').attr('checked', true);
	    $('#lab-exog').addClass('active');
	    $(".tax-gp").addClass("disabled");
            $(".trans-gp").addClass("disabled");
            $("#Tbar-input").prop("disabled", true);
            $("#hbar-input").prop("disabled", true);
	}
	else if (fisc.debt=='comm') {
	    $('#debt-exog').attr('checked', false);
	    $('#lab-exog').removeClass('active');
	    $('#debt-dom').attr('checked', false);
	    $('#lab-dom').removeClass('active');
	    $('#debt-comm').attr('checked', true);
	    $('#lab-comm').addClass('active');
	    $(".tax-gp").removeClass("disabled");
            $(".trans-gp").removeClass("disabled");
            $("#Tbar-input").prop("disabled", TbarOFF);
            $("#hbar-input").prop("disabled", hbarOFF);
	}
	else {
	    $('#debt-comm').attr('checked', false);
	    $('#lab-comm').removeClass('active');
	    $('#debt-exog').attr('checked', false);
	    $('#lab-exog').removeClass('active');
	    $('#debt-dom').attr('checked', true);
	    $('#lab-dom').addClass('active');
	    $(".tax-gp").removeClass("disabled");
            $(".trans-gp").removeClass("disabled");
            $("#Tbar-input").prop("disabled", TbarOFF);
            $("#hbar-input").prop("disabled", hbarOFF);
	}
	
	// based on tax/trasnfer settings, activate/de-activate cap/floors
	if (fisc.theta_hbar==1 && fisc.debt!='exog') {
            hbarOFF = false;
            $("#hbar-input").prop("disabled", hbarOFF);
	    $("#hbar-lab").removeClass('disabled');
	    $("#hstag-lab").addClass('disabled');
	}
	else if (fisc.theta_hbar==0 && fisc.debt!='exog') {
	    hbarOFF = true;
            $("#hbar-input").prop("disabled", hbarOFF);
	    $("#hbar-lab").addClass('disabled');
	    $("#hstag-lab").removeClass('disabled');   
	}

	if (fisc.theta_Tbar==1) {
            TbarOFF = false;
            $("#Tbar-input").prop("disabled", TbarOFF);
	}
	else {
            TbarOFF = true;
            $("#Tbar-input").prop("disabled", TbarOFF);
	}

    };
    
    /* checks to see if the fileJSON is a scenario file that can be used
       by the application. looks to see that fileJSON has all the right keys 
       (i.e. model, paramData, shockData) and that it has only 3 keys */
    var checkJSON = function(fileJSON) {
	var keys = Object.keys(fileJSON);
	/*if (keys.length!=3 || keys[0]!="model" || 
	    keys[1]!="paramData" || keys[2]!="shockData")
	    throw "JSON, but not a scenario file";*/
	if  (fileJSON.model!=whichModel)
	    throw "Scenario file but for a different model";
    };

    /* reads the text of the selected file */
    var readFile = function(file, onLoadCallback){
	var reader = new FileReader();
	reader.onload = onLoadCallback;
	reader.readAsText(file);
    };
    
});
