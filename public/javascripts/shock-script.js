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
    $('#shockTables').append(accord);
   
    // put the hands on table in each shock div
    for (shock in shockList) {
	$("#" + shock + "-temp-table")
	    .handsontable({
		data       : [ makeZeroArray(T) ],
		colHeaders : makeSeqArray(T)
	    });
	
	for (var i=0; i<2; i++) {
	    $("#" + shock + "-perm-table-" + (i+1))
		.handsontable({
		    data       : [ [0], [0], [0] ],
		    rowHeaders : [ ["start"],["end"], ["value"] ]
		});
	    $("#" + shock + "-perm-table-" + (i+1))
		.css("padding-left",colWidth());
	}
	
    }

    /* populate the shockTables div with a series of handsontable 
       objects that match up with the list of shocks */
    /*$.get("/getShockList",
	  { model : whichModel },
	  function(shockList) {

	      // call server to get list of equations
	      var eqnsList;
	      $.ajax({
		  data: { model : whichModel },
		  url: "/getEqnList",
		  success: function(res) {
		      eqnsList = res;
		  },
		  async: false
	      });
	      var eqnsDesc = Object.keys(eqnsList);
	      var eqnsTex = [];
	      for (var key in eqnsList) {
		  eqnsTex.push(eqnsList[key]); }

	      // 1 -- add a div for each shock table to be stored
	      var htmlDivs = "";
	      for (shock in shockList) {
		  htmlDivs += makeHeader(shockList[shock], eqnsTex);
		  htmlDivs += "<div class=\"temp-shock-holder\" id=\"";
		  htmlDivs += shock; 
		  htmlDivs += "-temp-table\"></div>";

		  for (var i=0; i<2; i++) {
		      htmlDivs += "<div class=\"perm-shock-holder\" id=\"";
		      htmlDivs += shock; 
		      htmlDivs += "-perm-table-" + (i+1) + "\"></div>"; }
	      }
	      $("#shockTables").html(htmlDivs);

	      // 2 -- add the handsontable to each corresponding div
	      // table will fill width of viewspace, or be set to 30 if it is 
	      // too wide
	      for (shock in shockList) {
		  $("#" + shock + "-temp-table")
		      .handsontable({
			  data       : [ makeZeroArray(T) ],
			  colHeaders : makeSeqArray(T),
			  colWidths  : colWidth()
		      });
		  for (var i=0; i<2; i++) {
		      $("#" + shock + "-perm-table-" + (i+1))
			  .handsontable({
			      data       : [ [0], [0], [0] ],
			      rowHeaders : [ ["start"],["end"], ["value"] ],
			      colWidths  : colWidth()
			  });
		      $("#" + shock + "-perm-table-" + (i+1))
			  .css("padding-left",colWidth()); }
	      }

	      // make the row headers of the perm tables twice as wide as the
	      // regular columns
	      $(".handsontable col.rowHeader").width(colWidth()*2);	      
	      
	  });*/
    
    /* returns the larger of 30 or 1/30th of the available horizontal space 
       this ensures there is a minimum width if the view size is small */
    /*var colWidth = function() {
	return Math.max(30, $(".main").width() / 30);
    }*/

    /* make a header with equation description and latex equation */
    /*var makeHeader = function(shock, eqnsTex) {
	var N = shock.equations.length;
	var header = "<div class=\"shock-header\"";
	header += "style=\"clear:left; padding-bottom:5px\">";
	header += "<span style=\"font-weight:bold;padding-right:1em\">" + 
	    shock.desc + "</span>";
	
	return header;
    };*/
    
    /* create a zero array to fill the shock tables */
    /*function makeZeroArray (n) {
	var arr = new Array(n);
	for (var i=0; i<n; i++) 
	    arr[i] = 0;
	return arr;
    };*/
    
    /* create an array of sequential integers to fill the shock table 
       column headers */
    /*function makeSeqArray (n) {
	var arr = new Array(n);
	for (var i=0; i<n; i++)
	    arr[i] = i+1;
	return arr;
    };*/
    
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
    return Math.max(30, $('#shockTables').width() / 30);
}
