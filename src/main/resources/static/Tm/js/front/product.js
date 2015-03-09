jQuery(function($) {
    // 选择版本
    $(".verSelect").click(function(){
        $(this).addClass("SelectPackage_on").siblings().removeClass("SelectPackage_on");
        
        var co = $(".colorSelect.SelectPackage_on").html();
        var na = $(".nameSelect.SelectPackage_on").html();
        var ca = $(".capSelect.SelectPackage_on").html();
        
        var query = "?";
        
        if (co && "" != co)
        {
            query += "co=";
            query += co;
        }
        
        if (na && "" != na)
        {
            query += "&na=";
            query += na;
        }
        
        if (ca && "" != ca)
        {
            query += "&ca=";
            query += ca;
        }
        
        window.location="/product/"+$("#id-pid").val() + query;
    });
    
    // 鼠标移到切换组合类型
    $(".tuijianzuhe_bt a").mouseenter(function(){
       $(this).addClass("tuijianzuhe_btxz").siblings().removeClass("tuijianzuhe_btxz");
       
       var i = $(this).index();
       
       $(".tuijianzuhe_a").css("display", "none");
       $(".tuijianzuhe_a").eq($(this).index()-1).css("display", "block");
    });
    
    // 点击选择或取消组合价格
    $(".combi-price-check").click(function(){
        var price = parseFloat($(this).siblings("span").html().replace(/￥/g, ""));
        var oldPrice = parseFloat($(this).parent().parent().find("b").eq(0).html().replace(/￥/g, ""));
        var priceSpan = oldPrice - price;
        
        var selectedNum = parseInt($("#combi-num").html());
        var priceTotal = parseFloat($("#combi-price-total").html().replace(/￥/g, ""));
        var priceOrigin = parseFloat($("#combi-price-origin").html().replace(/￥/g, ""));
        var priceSaved = parseFloat($("#combi-price-saved").html().replace(/￥/g, ""));
        
        // 选中, 加法
        if ($(this).prop("checked"))
        {
            $("#combi-num").html(selectedNum+1);
            $("#combi-price-total").html("￥" + (priceTotal + price));
            $("#combi-price-origin").html("￥" + (priceOrigin + oldPrice));
            $("#combi-price-saved").html("￥" + (priceSaved + priceSpan));
        }
        // 取消，减法
        else
        {
            $("#combi-num").html(selectedNum-1);
            $("#combi-price-total").html("￥" + (priceTotal - price));
            $("#combi-price-origin").html("￥" + (priceOrigin - oldPrice));
            $("#combi-price-saved").html("￥" + (priceSaved - priceSpan));
        }
    });
    
    // 清除选项
    $("#clear-select").click(function(){
        var combis = $(".combi-price-check");
        var i;
        
        for (i=0; i<combis.length; i++)
        {
            if (combis.eq(i).prop("checked"))
            {
                combis.eq(i).trigger("click");
            }
        }
    });
    
    // 立即购买
    $("#id-buy").click(function(){
        if ($(".verSelect").length >=3 && $(".SelectPackage_on").length < 3)
        {
            alert("请选择版本");
            return;
        }
        
        // 判断是否登录
        if ($("#id-username").length <= 0)
        {
            window.location.href = "/login";
            return;
        }
        
        $.ajax({
            type:"post",
            url:"/add",
            data:{"pid":$("#id-pid").val(), "vid":$("#id-vid").val(), "quantity":$("#quantity").val()},
            success:function(data){
                if(data=="success")
                {
                    window.location.href="/cart";
                }
                else if (data="nulluser")
                {
                    window.location.href="/login";
                }
                else
                {
                    alert(data);
                }
            }
        });
        
    });
});