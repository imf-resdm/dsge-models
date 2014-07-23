$(function() {

    $('#run').click(function() {
	alert('clicked run');
	
	$.ajax({
	    url: '/runWorker',
	    type: 'GET',
	    data: {model: 'nk'},
	    success: function() {
		alert('ran model');
	    }
	});

    });

});
