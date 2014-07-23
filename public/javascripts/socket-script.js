var socket = io();

/*$('form').submit(function(){
    socket.emit('chat message', $('#m').val());
    $('#m').val('');
    return false;
});

socket.on('chat message', function(msg){
    $('#messages').append($('<li>').text(msg));
});*/

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
