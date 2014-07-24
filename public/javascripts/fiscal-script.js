// variables to keep track of whether hbar and Tbar fiels are on or off
var hbarOFF = false;
var TbarOFF = false;

$(function() {

    /* set the size of all input elements to be the same as the debt button
       group. can only do this after the tab is visible, otherwise the width of
       the button group will appear to be 0 */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
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
    }); 

    // update enabled/disabled buttons when debt type is changed
    $("#debt-btns").change(function() {
	var debtVal = $("#debt-btns input:radio:checked").val();
	if (debtVal == "exog") {
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
    $("#tax-btns").change(function() {
	var taxVal = $("#tax-btns input:radio:checked").val();
	if (taxVal=="hbar") {
	    hbarOFF = false;
	    $("#hbar-input").prop("disabled", hbarOFF);
	}
	else {
	    hbarOFF = true;
	    $("#hbar-input").prop("disabled", hbarOFF);
	}
    });

    // update enabled/disabled buttons when transfer settings are changed
    $("#trans-btns").change(function() {
	var transVal = $("#trans-btns input:radio:checked").val();
	if (transVal=="Tbar") {
	    TbarOFF = false;
	    $("#Tbar-input").prop("disabled", TbarOFF);
	}
	else {
	    TbarOFF = true;
	    $("#Tbar-input").prop("disabled", TbarOFF);
	}
    });

});

