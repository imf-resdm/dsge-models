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
	$('#lam-box').val(fisc.lambda);
	$('#lam1-box').val(fisc.lambda1);
	$('#lam2-box').val(fisc.lambda2);
	$('#lam3-box').val(fisc.lambda3);
	$('#lam4-box').val(fisc.lambda4);
	$('#hbar-box').val(fisc.hbar);
	$('#Tbar-box').val(fisc.Tbar);

	// select type of debt and tax/transfers with programmatic click
	// this allows the fiscal-script logic to run and adjust 
	// tax and transfer settings automatically
	$('#lab-' + fisc.debt).click();
	
	if (fisc.theta_hbar==1) {
	    $('#hbar-lab').click(); }
	else if (fisc.theta_hbar==0) {
	    $('#hstag-lab').click(); }
	else {
	    alert('theta_hbar is not 0 or 1'); }

	if (fisc.theta_Tbar==1) {
	    $('#Tbar-lab').click(); }
	else if (fisc.theta_Tbar==0) {
	    $('#Tstag-lab').click(); }
	else {
	    alert('theta_Tbar is not 0 or 1'); }

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
