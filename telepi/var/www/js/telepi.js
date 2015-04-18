/*************************************************************
 * twitter @JackFilose
 * inspired by http://dribbble.com/shots/580766-expswitch

*************************************************************/
//$(document).ready(function(){
  // $( "#date" ).datepicker();
  // $( "#dialog" ).dialog();
  // $("#eso").one("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){ alert("I am an alert box!"); });
//});
var semaforo=true;
jQuery(function($){
   //$( "#date" ).datepicker();
   //$( "#dialog" ).dialog();
   //$("#eso").one("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function(){ alert("I am an alert box!"); });
   $("#eso").bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",
       function(){ 
          if (semaforo) {
            semaforo=false;
            setTimeout(function() {semaforo=true;
                                   if ($('#eso').hasClass('botonoff2')) $("#eso").addClass("botonoff").removeClass("botonoff2");
                                   if ($('#eso').hasClass('botonon2')) $("#eso").addClass("botonon").removeClass("botonon2");
                                  }, 200); 
            if ($('#eso').hasClass('botonoff')) {
              $("#eso").addClass("botonon2").removeClass("botonoff");
            } else {
              $("#eso").addClass("botonoff2").removeClass("botonon");
            }
          }
       }
   );
});

