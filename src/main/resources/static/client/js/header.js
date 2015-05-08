$(document).ready(function(){
    $("#id-all").hover(function(){
        $(".all_postion").css("display", "block");
    }, function(){
        $(".all_postion").css("display", "none");
    });
    
    $("ul.flmenu li").hover(function(){
        $("#shopsub" + $(this).attr("index")).css("display", "block");
    }, function(){
        $("#shopsub" + $(this).attr("index")).css("display", "none");
    });
});