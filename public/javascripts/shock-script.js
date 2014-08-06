// var to keep track of whether we drew the tables or not
// only want to draw them once
var drawTables = true;

$(function() {

    // set the number of periods to fill the tables with
    T = 30;

    // get the list of shocks to display
    var shockList;
    $.ajax({
	url: '/getShockList',
	type: 'GET',
	data: { model : whichModel },
	async: false,
	success: function(res) {
	    shockList = res;
	}
    });

    // make an accordion bin for each shock
    var accord = makeAccordion(shockList);
    $('#shockTables').append(accord);
   
    /* put the hands on table in each shock div
       if it is not the first shock, set display to none 
       set the height (25px to a row) before each table is drawn */
    first = true;
    for (shock in shockList) {
	
	$("#" + shock + "-temp-table").height(50);
	$("#" + shock + "-temp-table")
	    .handsontable({
		data       : [ makeZeroArray(T) ],
		colHeaders : makeSeqArray(T),
		colWidths  : colWidth()	
	    });

	for (var i=0; i<2; i++) {
	    $("#" + shock + "-perm-table-" + (i+1)).height(75);
	    $("#" + shock + "-perm-table-" + (i+1))
		.handsontable({
		    data       : [ [0], [0], [0] ],
		    rowHeaders : [ ["start"],["end"], ["value"] ]
		});
	    $("#" + shock + "-perm-table-" + (i+1))
		.css("padding-left", colWidth());
	}	
	
	if (first) {
	    $("#" + shock + "-temp-table").css('display', 'block');
	    $("#" + shock + "-perm-table-1").css('display', 'block');
	    $("#" + shock + "-perm-table-2").css('display', 'block');
	    first = false; }
	else {
	    $("#" + shock + "-temp-table").css('display', 'none');
	    $("#" + shock + "-perm-table-1").css('display', 'none');
	    $("#" + shock + "-perm-table-2").css('display', 'none'); }
	
    }
    
    $('#accordion a').click(function(e) {

	// see which shock table is visible (before closing)
	var open = '';
	for (shock in shockList) {
	    if ($('#collapse-' + shock).hasClass('in')) {
		open = shock }
	}
	
	// hide the table of the open shock
	$("#" + open + "-temp-table").css('display', 'none');
	$("#" + open + "-perm-table-1").css('display', 'none');
	$("#" + open + "-perm-table-2").css('display', 'none');

    });

    $('#accordion').on('shown.bs.collapse', function(e) {
	// see which shock table is visible (after opening)
	var open = e.target.id.replace('collapse-', '');

	// show the table of the open shock
	$("#" + open + "-temp-table").css('display', 'block');
	$("#" + open + "-perm-table-1").css('display', 'block');
	$("#" + open + "-perm-table-2").css('display', 'block');
	$("#" + open + "-temp-table").click();
	$("#" + open + "-perm-table-1").click();
	$("#" + open + "-perm-table-2").click();

    });

});

/* helper method to make divs for each shock table */
var makeShockDivs = function(shock) {
    var div = '<div class=\"temp-shock-holder\" id=\"';
    div += shock;
    div += '-temp-table\"></div>';
    
    div += '<div class=\"perm-shock-holder\" id=\"';
    div += shock;
    div += '-perm-table-1\"></div>';
    
    div += '<div class=\"perm-shock-holder\" id=\"';
    div += shock;
    div += '-perm-table-2\"></div>';
    
    return div;
}

/* create a zero array to fill the shock tables */
function makeZeroArray (n) {
    var arr = new Array(n);
    for (var i=0; i<n; i++) 
	arr[i] = 0;
    return arr;
};

/* create an array of sequential integers to fill the shock table 
   column headers */
function makeSeqArray (n) {
    var arr = new Array(n);
    for (var i=0; i<n; i++)
	arr[i] = i+1;
    return arr;
};

/* returns the larger of 30 or 1/30th of the available horizontal space 
   this ensures there is a minimum width if the view size is small */
var colWidth = function() {
    //return Math.max(30, $('.temp-shock-holder').width() / 30);
    return 33;
}

/* makes HTML code for accordion of shocks */
var makeAccordion = function(shockList) {
    var accord = '<div class="panel-group" id="accordion">';
    var first = true;
    for (shock in shockList) {
	var id = 'collapse-' + shock;
	accord += '<div class="panel panel-default">';
	accord += '<div class="panel-heading">';
	accord += '<h4 class="panel-title">';
	accord += '<a data-toggle="collapse" data-parent="#accordion" href="#';
	accord += id + '">';
	accord += shockList[shock].desc;
	accord += '</a></h4></div>';
	if (first) {
	    accord += '<div id="'+id+'" class="panel-collapse collapse in">';
	    first = false; }
	else {
	    accord += '<div id="'+id+'" class="panel-collapse collapse">'; }
	accord += '<div class="panel-body">';
	accord += makeShockDivs(shock);
	accord += '</div></div></div>';
    }
    accord += '</div>';
    return accord;
}
