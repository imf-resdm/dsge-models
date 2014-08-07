$(function() {

    $('#inst-main').append(main());
    $('#inst-param').append('<p>' + param() + '</p>');
    $('#inst-init').append('<p>' + init() + '</p>');
    $('#inst-fiscal').append('<p>' + fiscal() + '</p>');
    $('#inst-shocks').append('<p>' + shocks() + '</p>');
    $('#inst-results').append('<p>' + results() + '</p>');
    $('#inst-console').append('<p>' + console() + '</p>');

});

var main = function() {
    var text = '';
    text += '<p>With this application, you can use the model developed at the IMF Research Department to run country-specific policy simulations. The basic steps to run a simulation are:</p>';
    text += '<ol>';
    text += '<li> Calibrate the deep parameters of the model. The default setting is for an average low-income country. You can use this as a starting point and add any country-specific parameters as appropriate.';
    text += '<li> Set the initial conditions for the simulation. Data from the latest IMF Debt Sustainability Analysis is often a good starting point for this step.';
    text += '<li> Depending on the model, choose the appropriate settings for the fiscal adjustment (DIG model only).';
    text += '<li> Set the paths for exogenous variables. The IMF DSA is also a good starting point here.';
    text += '<li> Click on the <strong>Actions</strong> menu to the left and run the simulation. Once you click <strong>Run simulation</strong>, you can look at the <strong>Console</strong> tab to see the Octave/Dynare output (i.e. take a look under the hood.';
    text += '<li> When the simulation is done running, click on the <strong>Results</strong> tab to see the simulation results. To download the results as a CSV file, click <strong>Download results</strong> under the <strong>Actions</strong> menu.';
    text += '</ol>';
    text += '<p>If you want to save the current parameters/initial conditions/shock paths, you can clickd <strong>Save this scenarion</strong> under the <strong>Actions</strong> menu to save a settings file. This file can be uploaded later if you want to continue your work.</p>';
    text += '<p>Some models also have built-in scenarios that you can use as a starting point for your own simulations.</p>';
    return text
}

var param = function() {
    var text = 'The model is calibrated to an average low-income country. You can change these deep parameters to run your own simulations.';
    return text;
};

var init = function() {
    var text = 'Set the initial macroeconomic conditions for a given economy. These will be the starting values for each simulation.';
    return text;
};

var fiscal = function() {
    var text = 'In the short run, investment scaling-up can be paid for with borrowing, but in the long run, the higher taxes or lower transfers must cover all costs. Choose what type and how fast the fiscal adjustment should be.';
    return text;
};

var shocks = function() {
    var text = 'Set the paths of exogenous variables below. These shocks are added to the initial levels for each corresponding variable.';
    return text;
};

var results = function() {
    var text = 'Take a look at the simulation results here. You can download the data as a CSV file in the <strong>Actions</strong> menu to the left.';
    return text;
};

var console = function() {
    var text = 'Take a look at the output of the Octave/Dynare code that solves the model and runs the simulation. You can use this to debug any errors that the model produces.';
    return text;
};
