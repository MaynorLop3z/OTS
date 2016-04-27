//$(document).ready(function() {
//    $(document).mousemove(function(event) {
//        TweenLite.to($("body"), 
//        .5, {
//            css: {
//                backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px",
//            	"background-position": parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / 12) + "px, " + parseInt(event.pageX / 15) + "px " + parseInt(event.pageY / 15) + "px, " + parseInt(event.pageX / 30) + "px " + parseInt(event.pageY / 30) + "px"
//            }
//        });
//    });
//});
//$('#contenedor').mousemove(function( event ) {
//     
//var containerWidth = $(this).innerWidth(),
//    containerHeight = $(this).innerHeight(),
//    mousePositionX = (event.pageX / containerWidth) * 100,
//    mousePositionY = (event.pageY /containerHeight) * 100;
// 
//$(this).css('background-position', mousePositionX + '%' + ' ' + mousePositionY + '%');
// 
//});
$(".bg").interactive_bg({
   strength: 25,
   scale: 1.05,
   animationSpeed: "100ms",
   contain: true,
   wrapContent: false
 });
 $(document).ready(function(){
    $(".bg").interactive_bg(); // function call
});
 
  // change background size on window resize
  $(window).resize(function() {
      $(".bg > .ibg-bg").css({
        width: $(window).outerWidth(),
        height: $(window).outerHeight()
      });
   });

