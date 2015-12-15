$(document).ready(function(){ 
  $(".solo").hover(function (event) {
    
        $(".solo-quote",this).fadeIn(200,'swing' );},
                    function (event) {
    
        $(".solo-quote",this).fadeOut(200,'swing' );
      });
});