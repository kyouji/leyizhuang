$(document).ready(function(){
   $(".flmenu li").hover(function(){
      $("#shopsub" + $(this).index()).css("display", "block");
   });
   
   $(".flmenu li").mouseleave(function(){
       $("#shopsub" + $(this).index()).css("display", "none");
   });
   
   $(".hot-index li a").hover(function(){
       $(this).find(".shine").stop();
       $(this).find(".shine").css("background-position","-160px 0"); 
       $(this).find(".shine").animate({backgroundPosition: '160px 0'},500);
       $(this).find(".title").stop().animate({left:'0px'},{queue:false,duration:450});
   }, function(){
       $(this).find(".title").stop().animate({left:'-160px'},{queue:false,duration:200});
   });
   
});