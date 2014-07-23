$(function() {

    /* populate the paramtable div with a table according to the
       names and descriptions of each parameter */
    $.get("/getParamList", 
	  { model : whichModel }, 
	  function(paramList) {
	      var htmlTable = makeTableHeader();
	      htmlTable += "<tbody>";
	      for (param in paramList) {
		  htmlTable += makeTableElement(param,
						paramList[param].val,
						paramList[param].desc,
						paramList[param].latex);
	      }
	      htmlTable += "</tbody>";
	      $("#param-table").append(htmlTable);
	      
	      /* include this line so mathjax runs again */
	      MathJax.Hub.Queue(["Typeset",MathJax.Hub,"param-table"]);
	  });
    
    /* make a table header row
       column 1 = parameter (in latex/mathjax)
       column 2 = value
       column 3 = description
      */
    var makeTableHeader = function() {
	var tableHeader = "<thead><tr>";
	tableHeader += "<th>Paremeter</th>";
	tableHeader += "<th>Value</th>";
	tableHeader += "<th>Description</th>";
	tableHeader += "</tr></thhead>";
	return tableHeader;
    };
    
    /* make an HTML code block that looks like:
       <tr>
       <td>name</td>
       <td><input type="text" id="name-pbox" value="val"></td>
       <td>desc</td>
       </tr>
       to be inserted into a table of parameters */ 
    var makeTableElement = function(name, val, desc, latex) {
	var htmlString = "<tr><td>";
	htmlString += "\\(" + latex + "\\)";
	htmlString += "</td><td><input type=\"text\" size=\"8\" id=\"";
	htmlString += name;
	htmlString += "-pbox\" value=\"";
	htmlString += val;
	htmlString += "\"></td><td>";
	htmlString += desc;
	htmlString += "</td></tr>";
	return htmlString;
    };

});
