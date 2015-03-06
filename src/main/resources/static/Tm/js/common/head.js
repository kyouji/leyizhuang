jQuery(function($) {

  //经过城市切换和内容都显示
  $("#city").mouseover(function(){
     $("#change").css({"display":"block"});

  })

  $("#change").mouseover(function(){
     $("#change").css({"display":"block"});

  })

  //离开城市和离开内容都隐藏
  $("#change").mouseout(function(){
     $("#change").css({"display":"none"});
  })

  $("#city").mouseout(function(){
      $("#change").css({"display":"none"});
  })
  
  $(".cityqh ul li a").click(function(){
      $("#city").html($(this).html());
      $("#change").css({"display":"none"});
  });
});


