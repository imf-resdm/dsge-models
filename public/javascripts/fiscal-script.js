// variables to keep track of whether hbar and Tbar fields are on or off
var hbarOFF = false;
var TbarOFF = false;
var debtType = 'exog';
var theta_hbar = 1; // cap on taxes
var theta_Tbar = 1; // floor on transfers

$(function() {

    /* set the size of all input elements to be the same as the debt button
       group. can only do this after the tab is visible, otherwise the width of
       the button group will appear to be 0 */
    /*$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	if ($(e.target).attr('href')=='#fiscal') {

	    // set height to match Tbar latex
	    var height = $("#Tbar-addon").height() + 
		parseInt($("#Tbar-addon").css("padding-top")) + 
		parseInt($("#Tbar-addon").css("padding-bottom")) + 
		parseInt($("#Tbar-addon").css("border-top")) + 
		parseInt($("#Tbar-addon").css("border-bottom"));
	    $("#Tbar-input").css("height", height);
	    $("#hbar-input").css("height", height);
	    
	    // set width of elements to match half of a column
	    var width = $("#tax-settings").width() / 2;
	    $("#lambda-input").css("width", width);
	    $(".lambda-div").css("width", width);
	    $(".half-width").css("width", width);	    
	}
    });*/ 

    
    // update enabled/disabled buttons when debt type is changed
    $('#debt-exog, #debt-comm, #debt-dom').change(function() {
    
	//var debtVal = this.id.replace('debt-','');
	debtType = this.id.replace('debt-','');

	if (debtType == "exog") {
	    $(".tax-gp").addClass("disabled");
	    $(".trans-gp").addClass("disabled");
	    $("#Tbar-input").prop("disabled", true);
	    $("#hbar-input").prop("disabled", true);
	}
	else {
	    $(".tax-gp").removeClass("disabled");
	    $(".trans-gp").removeClass("disabled");
	    $("#Tbar-input").prop("disabled", TbarOFF);
	    $("#hbar-input").prop("disabled", hbarOFF);
	}
    });

    // update enabled/disabled buttons when tax settings are changed
    $('#hbar-lab, #hstag-lab').change(function() {
	if (this.id=='hbar-lab') {
	    theta_hbar = 1;
	    hbarOFF = false;
	    $('#hbar-input').prop('disabled', hbarOFF); }
	else {
	    theta_hbar = 0;
	    hbarOFF = true;
	    $('#hbar-input').prop('disabled', hbarOFF); }
    });

    // update enabled/disabled buttons when transfer settings are changed
    $('#Tbar-lab, #Tstag-lab').change(function() {
	if (this.id=='Tbar-lab') {
	    theta_Tbar = 1;
	    TbarOFF = false;
	    $('#Tbar-input').prop('disabled', TbarOFF); }
	else {
	    theta_Tbar = 0;
	    TbarOFF = true;
	    $('#Tbar-input').prop('disabled', TbarOFF); }
    });

    window.setAlignment = function() {
	// set height to match Tbar latex
	var height = $("#Tbar-addon").height() + 
	    parseInt($("#Tbar-addon").css("padding-top")) + 
	    parseInt($("#Tbar-addon").css("padding-bottom")) + 
	    parseInt($("#Tbar-addon").css("border-top")) + 
	    parseInt($("#Tbar-addon").css("border-bottom"));
	$("#Tbar-input").css("height", height);
	$("#hbar-input").css("height", height);
	
	// set width of elements to match half of a column
	var width = $("#tax-settings").width();
	$("#lambda-input").css("width", Math.round(width*3/4));
	$(".lambda-div").css("width", Math.round(width*3/4));
	$('#debt-btns').css('width', Math.round(width*3/4));
	$(".half-width").css("width", Math.round(width/2));
    }

});

