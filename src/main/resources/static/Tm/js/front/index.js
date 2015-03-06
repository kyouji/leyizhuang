jQuery(function($) {
    // 进入商品类型区域添加效果
    $(".floor_3_4_1_a").mouseenter(function(){
        $(this).children("a").addClass("floor_3_4_1_axz");
        $(this).siblings().children("a").removeClass("floor_3_4_1_axz");
        
        $(".floor_3_4_2 ul").eq($(this).index()).css("display", "block");
        $(".floor_3_4_2 ul").eq($(this).index()).siblings().css("display", "none");
    });
    
});


