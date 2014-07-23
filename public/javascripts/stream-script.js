$(function() {

    $("#btn").click(function() {
	alert("click");	
    });
    
    var eventList = document.getElementById("eventlist");
    var evtSource = new EventSource("/msg");
    
    var newElement = document.createElement("li");
    newElement.innerHTML = "Messages:";
    eventList.appendChild(newElement);
    
    
    evtSource.onmessage = function(e) {
	console.log("received event");
	console.log(e);
	var newElement = document.createElement("li");
	
	newElement.innerHTML = "message: " + e.data;
	eventList.appendChild(newElement);
    };      
    
    evtSource.onerror = function(e) {
	console.log("EventSource failed.");
    };
    
    console.log(evtSource);
    
});

