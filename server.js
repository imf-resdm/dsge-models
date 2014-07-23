var express      = require('express');
var childProcess = require('child_process');
var fs           = require('fs');
var bodyParser   = require('body-parser');
var modWriter    = require(__dirname + '/mod-writer.js');
var app          = express();
var http         = require('http').Server(app);
var io           = require('socket.io')(http);

app.use(bodyParser.json());
app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  res.sendfile('index.html');
});

/*************************************************************
************************* AJAX CALLS *************************
*************************************************************/

/* run worker that has the Octave script as a child process */
app.get('/runWorker', function(req, res) {
    
    var worker = childProcess.fork(__dirname + '/worker', [req.query.model]);
    res.end();

    worker.on('message', function(data) {
	console.log('message: ' + data);
	io.emit('model update', data);
    });

    worker.on('close', function() {
	console.log('--- done running model ---');
	io.emit('model complete', 'done');
    });

});

/* write parameters to file */
app.post('/writeParams', function(req, res) {
    console.log("writing parameter file");

    var fpath = __dirname + '/' + req.body.model + '_mfiles/';

    // write the param file with JS
    fs.writeFile(fpath + 'set_params.m', 
		 modWriter.writeParamFile(req.body.paramData), 
		 function (err) {
		     if (err) console.log(err);
		 });

    res.end();
});

/* write shocks to file */
app.post('/writeShocks', function(req, res) {
    console.log("writing shock file");

    var fpath = __dirname + '/' + req.body.model + '_mfiles/';

    // write the shocks file with JS
    fs.writeFile(fpath + 'shocks.mod', 
		 modWriter.writeShockFile(req.body.shockData), 
		 function (err) {
		     if (err) console.log(err);
		 });

    res.end();
});

/* write fiscal settings to file (DSF only) */
app.post('/writeDSFfiles', function(req, res) {
    console.log("writing dsf files");

    var fpath = __dirname + '/' + req.body.model + '_mfiles/';
    
    fs.writeFile(fpath + 'set_params_fiscal.m', 
		 modWriter.writeFiscalFile(req.body.fiscalData), 
		 function (err) {
		     if (err) console.log(err);
		 });
    fs.writeFile(fpath + 'dsf.mod', 
		 modWriter.writeModFile(req.body.fiscalData), 
		 function (err) {
		     if (err) console.log(err);
		 });
    
    res.end();
});

/* write scenario json to server file */
app.post('/saveScenario', function(req, res) {
    var fname = __dirname + '/' + req.body.model 
	+ '_mfiles/scenarios/' + req.body.model + '_scenario.json';
    fs.writeFile(fname, JSON.stringify(req.body), 
		 function (err) {
		     if (err) console.log(err);
		 });

    res.end();
});

/* give variable json to client */
app.get('/getVarList', function(req, res) {
    var fname = __dirname + '/' + req.query.model
	+ '_mfiles/json/var_list.json';
    fs.readFile(fname, 'utf8', function (err, data) {
	if (err) {
	    console.log('error: ' = err); }
	data = JSON.parse(data);
	res.json(data);
    });
});

/* give equation json to client */
app.get('/getEqnList', function(req, res) {
    var fname = __dirname + '/' + req.query.model
	+ '_mfiles/json/eqn_list.json';
    fs.readFile(fname, 'utf8', function (err, data) {
	if (err) {
	    console.log('error: ' = err); }
	data = JSON.parse(data);
	res.json(data);
    });
});

/* give param json to client */
app.get('/getParamList', function(req, res) {
    var fname = __dirname + '/' + req.query.model
	+ '_mfiles/json/param_list.json';
    fs.readFile(fname, 'utf8', function (err, data) {
	if (err) {
	    console.log('error: ' = err); }
	data = JSON.parse(data);
	res.json(data);
    });
});

/* give shock json to client */
app.get('/getShockList', function(req, res) {
    var fname = __dirname + '/' + req.query.model
	+ '_mfiles/json/shock_list.json';
    fs.readFile(fname, 'utf8', function (err, data) {
	if (err) {
	    console.log('error: ' = err); }
	data = JSON.parse(data);
	res.json(data);
    });
});

/* send results json to client */
app.get('/getResults', function(req, res) {
    var fname = __dirname + '/' + req.query.model 
	+ '_mfiles/' + req.query.model + '_results.json';
    fs.readFile(fname, 'utf8', function (err, data) {
	if (err) {
	    console.log('error: ' = err); }
	data = JSON.parse(data);
	res.json(data);
    });
});


http.listen(process.env.PORT || 8080, function(){
    console.log('listening on port 8080');
});
