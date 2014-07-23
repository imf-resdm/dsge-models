var express = require('express');
var cp = require('child_process');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);

// add static files to path
app.use(express.static(__dirname + '/public'));

// main method to display app
app.get('/', function(req, res){
  res.sendfile('index.html');
});

// socket.io set up connection
io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    io.emit('chat message', msg);
  });
});

// run model
app.get('/runWorker', function(req, res) {
    console.log('model: ' + req.query.model);

    var worker = cp.fork(__dirname + '/worker', [req.query.model]);
    
    res.end();

    worker.on('message', function(data) {
	console.log('message: ' + data);
	io.emit('model update', data);
    });

    worker.on('close', function() {
	console.log('--- done running model ---');
	io.emit('model update', 'done');
    });

});

// listen through port to test app
http.listen(8080, function(){
    console.log('listening on port 8080');
});
