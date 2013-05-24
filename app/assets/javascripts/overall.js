$(document).ready(function() {
    $(".detail_tooltip").parent().css("position", "relative");
    $(".detail_tooltip").parent().mouseover(function(){
       $(this).children(".detail_tooltip").fadeIn(0);
    }).mouseout(function(){
       $(this).children(".detail_tooltip").fadeOut(0);
    });
});