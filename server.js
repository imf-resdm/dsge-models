// comment

var express      = require('express');
var childProcess = require('child_process');
var fs           = require('fs');
var bodyParser   = require('body-parser');
var modWriter    = require(__dirname + '/mod-writer.js');
var app          = express();
var http         = require('http').Server(app);
var io           = require('socket.io')(http);
var nodemailer   = require('nodemailer');

app.use(bodyParser.json());
app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  res.sendfile('index.html');
});

/* create reusable transporter object using SMTP transport */
var transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'imf.resdm@gmail.com',
        pass: 'andyberg'
    }
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

/* take contact form info and send email to a real person */
app.post('/sendContactEmail', function(req, res) {

    console.log(req.body);
    
    // setup e-mail data with unicode symbols
    var mailOptions = {
	replyTo: req.body.email, // original sender
	to: 'wclark3@gmail.com, PGupta@imf.org, MAndreolli@imf.org',
	subject: '[DSGE APP] ' + req.body.subject,
	text: req.body.message
    };
    
    // send mail with defined transport object
    transporter.sendMail(mailOptions, function(error, info){
	if(error){
            console.log(error);
	    res.send(500, {error : 'could not send message'});
	} else {
            console.log('Message sent: ' + info.response);
	    res.send(200); // success
	}
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
    var fname = __dirname + '/public/scenarios/' 
	+ req.body.model + '_scenario.json';
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

/* give initial conditions json to client */
app.get('/getInitList', function(req, res) {
    var fname = __dirname + '/' + req.query.model
	+ '_mfiles/json/init_list.json';
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
