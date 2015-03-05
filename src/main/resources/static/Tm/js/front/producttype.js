jQuery(function($) {
    // 跳转函数
    var hrefFunction = function() {
        var query = $("#type-id").val() + "-";
        var list = $("#prop-ul li");
        var length = list.length;
        var i;
        
        for (i=0; i<length; i++)
        {
            var index = list.eq(i).find(".sxon").index();
            query += index + "-";
        }
        
        // 排序字段
        query += $(".sxtj_on").parent().index() + "-";
        
        // 销量
        query += "0-";
        
        // 价格
        if ($("#sort-price").html().indexOf("↑")>0)
        {
            query += "1-";
        }
        else
        {
            query += "0-";
        }
        
        // 上架时间
        query += "0-";
        
        // 页号
        query += Number($("#page-index").html())-1;
        
        if (Number($("#minMoney").val()) > 0 || Number($("#maxMoney").val()) > 0)
        {
            query += "_" + $("#minMoney").val() + "-" + $("#maxMoney").val();
        }
        
        window.location="/list/"+query;
    };
    
    // 点击属性
    $("a.prop").click(function(){
        $(this).addClass("sxon").siblings().removeClass("sxon");
        hrefFunction();
    });
    
    // 点击排序
    $("#ul-sort li a").click(function(){
        $(this).addClass("sxtj_on").parent().siblings().children("a").removeClass("sxtj_on");
        
        var text = $(this).html();
        if ($(this).html().indexOf("↑") > 0)
        {
            text = text.substring(0, text.length-1) + "↓";
        }
        else if ($(this).html().indexOf("↓") > 0)
        {
            text = text.substring(0, text.length-1) + "↑";
        }
        
        $(this).html(text);
        
        hrefFunction();
    });
    
    // 价格搜索
    $("#priceSearch").click(function(){
        hrefFunction();
    });
    
    // 上一页
    $("#prev-page").click(function(){
        var pageIndex = Number($("#page-index").html());
        
        if (pageIndex > 1)
        {
            $("#page-index").html(pageIndex-1);
            hrefFunction();
        }
    });
    
    // 下一页
    $("#next-page").click(function(){
        var pageIndex = Number($("#page-index").html());
        var pageTotal = Number($("#page-total").html());
        
        if (pageIndex < pageTotal)
        {
            $("#page-index").html(pageIndex+1);
            hrefFunction();
        }
    });
});