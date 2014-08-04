var socket = io();

socket.on('model update', function(msg) {
    
    $("#console-text").append(msg);
    $("#console-text").scrollTop($("#console-text")[0].scrollHeight);
    
});

socket.on('model complete', function(msg) {

    hasRun = 1;
    updatePlots();
    
    $("#save-scen-li").removeClass("disabled");
    $("#download-li").removeClass("disabled");
    
    $("#console-text").append(msg);
    $("#console-text").scrollTop($("#console-text")[0].scrollHeight);
    
});
