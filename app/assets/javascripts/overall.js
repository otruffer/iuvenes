$(document).ready(function() {
    $(".detail_tooltip").parent().css("position", "relative");
    $(".detail_tooltip").parent().mouseover(function(){
       $(this).children(".detail_tooltip").fadeIn(0);
    }).mouseout(function(){
       $(this).children(".detail_tooltip").fadeOut(0);
    });

    $(".start_search_button").click(function(){
        $('.section_search').fadeToggle(0);
    });

    $(".notice_closer").click(function(){
        $('.notice_block').fadeOut(0);
    });

    if($(".search_input").val() != ""){
        $('.section_search').fadeIn(0);
    }
});