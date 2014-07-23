var express = require('express');
var spawn   = require('child_process').spawn;

// establish file path
var model = process.argv[2];
var fpath = __dirname + '/' + model + '_mfiles/';
    
// run shell script with model code
var oc_command = spawn('octave', [fpath + 'run_model.m']);

oc_command.stdout.on('data', function (data) {
    //console.log('stdout: ' + data);
    process.send('' + data);
});

/*oc_command.stderr.on('data', function (data) {
  console.log('stderr: ' + data);
  });*/

oc_command.on('exit', function (code) {
//    console.log('child process exited with code ' + code);*/
    
    // python script will save results

    var py_command = spawn(
	'python', [ fpath + 'save_results.py', 
		    __dirname, model ] )

    py_command.stdout.on('data', function (data) {
	console.log('stdout: ' + data);
    });

    py_command.stderr.on('data', function (data) {
	console.log('stderr: ' + data);
    });
    
});

	
