$(function() {

    /* make grid to store flot charts 
       takes advantage of bootstrap grid (row/column classes) built-ins */
    $.fn.makePlotGrid = function() {
	
	// call server to get list of vars
	var varList;
	$.ajax({
	    data: { model : whichModel },
	    url: "/getVarList",
	    success: function(res) {
		varList = res;
	    },
	    async: false
	});

	var shortNames = Object.keys(varList);
	var longNames = [];
	for (var key in varList) {
	    longNames.push(varList[key]); }

	// make and send html code
	var gridHTML = "";
	for (var i=0; i<3; i++) {
	    gridHTML += "<div class=\"row plot-row\">";
	    for (var j=0; j<3; j++) {
 		gridHTML += "<div class=\"col-md-4 plot-container\">";
		gridHTML += makeSelector(longNames, 3*i+j+1);
		gridHTML += "<div class=\"plot-holder\" id=\"plot" + (3*i+j+1);
		gridHTML += "\"></div>";
		gridHTML += "</div>"; }
	    gridHTML += "</div>"; } 
	$("#flot-grid").html(gridHTML);

	// set the series menus to their own series
	for (var k=0; k<i*j; k++) 
	    $("#dropdown"+(k+1)).prop("selectedIndex",k);
    }

    /* creates the dropdown menu with series names to be plotted */
    var makeSelector = function(longNames, index) {
	var menuHTML = "<div class=\"menu-holder\">";
	menuHTML += "<select class=\"form-control series-menu\" id=\"dropdown";
	menuHTML += index + "\">";
	for (var i in longNames) 
	    menuHTML += "<option>" + longNames[i] + "</option>";
	menuHTML += "</select></div>";
	return menuHTML;
    }

    /* when the results tab is clicked, draw flot charts 
       IMPORTANT: charts can only be drawn when the tab is visible
       otherwise, flot will have trouble aligning things correctly */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	if ($(e.target).attr('href')=='#results'){
	    if (hasRun == 0) {	    
		var blank = [];
		for (var i=0; i<=30; i++) {
		    blank.push(null); }
		for (var j=1; j<=9; j++) {
		    $.plot("#plot"+j, [{ data : blank,
					 color : "#008000" }]); }
	    }	
	    else {
		updatePlots();
	    }
	}
    }); 
    
    /* call the helper function listed below
       I make this separate so that I can include an async ajax call
       and it only works if it is done inside a parent method*/
    $.fn.makePlotGrid();
    
    /* set the size of the flot containers
       the width is set by bootstrap .row class, so just set height 
       IMPORTANT: order matters now -- this call only makes sense after 
       $.fn.makePlotGrid() is called */
    var side = $(".tab-content").width() / 3 - 30;
    $(".plot-container").css("height", side);
    
    /* when a series dropdown menu is changed, updated the corresponding
       plot to include the selected series */
    $('.series-menu').change(function(){
	updatePlots();
    });
    
    /* updates plots with results generated from running model
       the window. prefix is so that I can call this from the script.js file
       when the model is done running, so the plots will get updated again */
    window.updatePlots = function() {
	var varList;
	$.ajax({
	    data: { model : whichModel },
	    url: "/getVarList",
	    success: function(res) {
		varList = res;
	    },
	    async: false
	});
	var shortNames = Object.keys(varList);
	var longNames = [];
	for (var key in varList) {
	    longNames.push(varList[key]); }
	
	// call server to get results data
	var results;
	$.ajax({
	    data: { model : whichModel },
	    url: "/getResults",
	    success: function(res) {
		results = res;
	    },
	    async: false
	});
	
	for (var i=0; i<9; i++) {
	    var selectedIndex = $('option:selected',$("#dropdown"+(i+1)))
		.index();
	    var selectedSeries = shortNames[selectedIndex];
	    var rawData = results[selectedSeries];
	    var plotData = makePlotData(rawData);
	    $.plot($("#plot"+(i+1)), [{ data : plotData,
					color : "#008000" }]);
	}
    };
    
    /* makes an array of x-y pairs that can be plotted */
    var makePlotData = function(data) {
	T = 30; // how long to make each plotted series
	var plotData = [];
	for (var i=0; i<T; i++) {
	    plotData.push([i+1, data[i]]);
	}
	return plotData;
    };

});
