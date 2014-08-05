$(function() {
    
    // show/hide divs according to what was clicked
    $('.nav-sidebar a').on('click', function() {
	$('.content').hide();
	$($(this).attr('href')).show();
    });

    // update active li element accordingly
    $('.nav-sidebar li').on('click', function() {
	$('.nav-sidebar li').removeClass('active');
	$(this).addClass('active');
    });
    
});
