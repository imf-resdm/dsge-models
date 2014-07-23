function moveScroller() {
    
    var indent = parseInt($("#param-tab-east").width()) + 
	    parseInt($("#param-tab-east").css("padding-left")) + 
	    parseInt($("#param-tab-east").css("padding-right")) + 
	    parseInt($("#main-container").css("margin-left")) +  
	    parseInt($("#main-container").css("padding-left")) - 7;
    	
    var move = function() {
	
        var st = $(window).scrollTop();
        var ot = $("#scroller-anchor").offset().top;
        var s = $("#param-tab-east");
        if(st > ot) {
            s.css({
                position: "fixed",
                top: "0px",
		left: indent
            });
        } else {
            if(st <= ot) {
                s.css({
                    position: "relative",
                    top: "",
		    left: ""
                });
            }
        }
    };
    $(window).scroll(move);
    move();
}

var getScrollBarSize = function() {
   var inner = $('<p></p>').css({
      'width':'100%',
      'height':'100%'
   });
   var outer = $('<div></div>').css({
      'position':'absolute',
      'width':'100px',
      'height':'100px',
      'top':'0',
      'left':'0',
      'visibility':'hidden',
      'overflow':'hidden'
   }).append(inner);

   $(document.body).append(outer);

   var w1 = inner.width(), h1 = inner.height();
   outer.css('overflow','scroll');
   var w2 = inner.width(), h2 = inner.height();
   if (w1 == w2 && outer[0].clientWidth) {
      w2 = outer[0].clientWidth;
   }
   if (h1 == h2 && outer[0].clientHeight) {
      h2 = outer[0].clientHeight;
   }

   outer.detach();

   return [(w1 - w2),(h1 - h2)];
};
