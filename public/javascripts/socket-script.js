var socket = io();

$('form').submit(function(){
    socket.emit('chat message', $('#m').val());
    $('#m').val('');
    return false;
});

socket.on('chat message', function(msg){
    $('#messages').append($('<li>').text(msg));
});

socket.on('model update', function(msg) {
    $('#console-text').append('<p>' + msg + '</p>');
});
