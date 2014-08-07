$(function() {
    
    // show/hide divs according to what was clicked
    $('.nav-sidebar a').on('click', function() {
	$('.content').hide();
	$($(this).attr('href')).show();

	// only show flots once results tab is visible
	if ($(this).attr('href')=='#results') {
	    showPlots(); }
	
    });

    // update active li element accordingly
    $('.nav-sidebar li').on('click', function() {
	$('.nav-sidebar li').removeClass('active');
	$(this).addClass('active');
    });

    // click event for about button
    $('#about-btn').click(function() {
	$('#about-modal').modal();
    });

    // click event for contact button
    $('#contact-btn').click(function() {
	$('#contact-modal').modal();
    });

    // send modal text to each page
    $('#about-modal .modal-body').append(aboutMessage());
    $('#contact-modal .modal-body').append(contactMessage());

    // when contact modal button send is clicked, send email with form data
    $('#contact-send').click(function() {

	var email = $('#contact-email').val();
	var subject = $('#contact-subject').val();
	var message = $('#contact-message').val();

	$.ajax({
	    url: "/sendContactEmail",
	    type: "POST",
	    data: JSON.stringify({ email   : email,
				   subject : subject,
				   message : message }),
	    contentType: "application/json",
	    success: function(res) {
		$('#contact-modal .modal-footer').prepend('<div class="alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>Message sent</div>');
	    },
	    failure: function(res) {
		alert(res);
	    }
	});

    });
    
});

/* create HTML text of message to display in about modal */
var aboutMessage = function() {
    text = '';
    
    text += '<p>The <strong>DSGE Modeling App</strong> is meant to be used by IMF country teams and by country authorities to run deterministic simulations of some of the DSGE models developed in the Research Department at the International Monetary Fund.</p>';
    
    text += '<p>For more information on how to use this tool, open any of the models and click on the "Instructions" tab.</p>';

    text += '<p>The model simulations are run using Octave (3.8.1) and Dynare (4.4.2).</p>';
    
    text += '<p>This application was developed as part of a project on macroeconomic policy in low-income countries supported by the UK\'s Department for International Development. It is released under the <a target="_blank" href="http://opensource.org/licenses/MIT">MIT License</a>.</p>';

    text += '&copy; International Monetary Fund 2014';

    return text;
};

/* create HTML text of message to display in contact modal */
var contactMessage = function() {
    text = '';
    
    text += '<form role="form">';
    text += '<div class="form-group">'
    text += '<label>Your email address</label>';
    text += '<input type="email" class="form-control" id="contact-email" placeholder="Enter email">';
    text += '</div>';

    text += '<div class="form-group">'
    text += '<label>Subject</label>';
    text += '<input type="text" class="form-control" id="contact-subject" placeholder="Enter message subject">';
    text += '</div>';
    
    text += '<div class="form-group">';
    text += '<label for="inputEmail">Message</label>';
    text += '<textarea class="form-control" id="contact-message" rows="5" placeholder="Enter message text"></textarea>';
    text += '</div>';

    text += '</form>';

    return text;
};
