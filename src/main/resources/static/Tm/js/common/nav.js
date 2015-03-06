jQuery(function($) {
    // 进入全部商品分类展示下拉框
    $("#nav-bar").mouseenter(function(){
        $("#nav-ul").css("display", "block");
    });
    
    // 离开全部商品分类隐藏下拉框
    $("#nav-main").mouseleave(function(){
        $("#nav-ul").css("display", "none");
    });
    
    $("#nav-ul li").mouseenter(function(){
       $(".threeright").css("display", "none")
       $(".threeright").eq($(this).index()).css("display", "block");
    });
});


