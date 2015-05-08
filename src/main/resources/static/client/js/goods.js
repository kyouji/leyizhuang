$(document).ready(function(){
    // 点击tab
    $(".stab").click(function(){
        // tab特效切换
        $(".stab").removeClass("hover_xx");
        $(this).addClass("hover_xx");
        
        // tab页面切换
        $(".php_z").css("display", "none");
        $("#tab"+$(this).attr("tid")).css("display", "block");
    });
    
    
    $(".comb-checkbox").click(function(){
        var combop = parseFloat($("#combOriginPrice").html());
        var combcp = parseFloat($("#combCurrentPrice").html());
        var combsave = parseFloat($("#combSave").html());
        var combCount = parseInt($("#combCount").html());
        
        
        if ($(this).attr("checked"))
        {
            var index = $(".comb-checkbox").index($(this));
            
            var op = parseFloat($(".comb-origin-price").eq(index).html());
            var cp = parseFloat($(".comb-current-price").eq(index).html());
            var span = op - cp;
            
            $("#combOriginPrice").html(op + combop);
            $("#combCurrentPrice").html(cp + combcp);
            $("#combSave").html(span + combsave);
            $("#combCount").html(combCount + 1);
        }
        else
        {
            var index = $(".comb-checkbox").index($(this));
            
            var op = parseFloat($(".comb-origin-price").eq(index).html());
            var cp = parseFloat($(".comb-current-price").eq(index).html());
            var span = op - cp;
            
            $("#combOriginPrice").html(combop - op + "");
            $("#combCurrentPrice").html(combcp - cp + "");
            $("#combSave").html(combsave - span + "");
            $("#combCount").html(combCount - 1 + "");
        }
    });
    
    // 清除选择
    $("#clearComb").click(function(){
        $(".comb-checkbox:checked").each(function(){
            $(this).attr("checked", "false");
            $(this).click();
            
        });
    });
    
    $("#zhAddCart").click(function(){
        var str = "";
        $(".comb-checkbox:checked").each(function(){
            str += $(this).attr("zpid");
            str += ",";
        });
        var href = "/cart/init?id=" + $("#goodsId").val() + "&zpid=" + str;
        
        $(this).attr("href", href);
        
        return true;
    });
    
    // 提交评论
    $("#idSubmitComment").click(function(){
        var comment = $("#taComment").val();
        var code = $("#commentCode").val();
        var id = $("#goodsId").val();

        if (undefined == code || "" == code)
        {
            alert("请填写验证码!");
            return;
        }
        
        if (undefined == comment || "" == comment)
        {
            alert("请填写评论内容!");
            return;
        }
        
        $.ajax({
            type:"post",
            url:"/user/comment/add",
            data:{"comment": comment, "code": code, "goodsId": id},
            success:function(res){
                alert(res["code"]);
                if (0 == res.code)
                {
                    alert("提交评论成功");
                }
                else
                {
                    var ss = "" + res.message;
                    alert(res["message"]);
                }
            }
        });
    });
    
    // 提交咨询
    $("#idSubmitConsult").click(function(){
        var consult = $("#taConsult").val();
        var code = $("#consultCode").val();
        var id = $("#goodsId").val();

        if (undefined == code || "" == code)
        {
            alert("请填写验证码!");
            return;
        }
        
        if (undefined == consult || "" == consult)
        {
            alert("请填写咨询内容!");
            return;
        }
        
        $.ajax({
            type:"post",
            url:"/user/consult/add",
            data:{"consult": consult, "code": code, "goodsId": id},
            success:function(res){
                if (0 == res.code)
                {
                    alert("提交咨询成功");
                }
                else
                {
                    alert(res.message);
                }
            }
        });
    });
    
    $(".jqzoom").jqueryzoom({
        xzoom:400,
        yzoom:400,
        offset:10,
        position:"right",
        preload:1,
        lens:1
    });
    $("#spec-list").jdMarquee({
        deriction:"left",
        width:350,
        height:56,
        step:2,
        speed:4,
        delay:10,
        control:true,
        _front:"#spec-right",
        _back:"#spec-left"
    });
    
    $("#spec-list img").mouseover(function(){
        var src=$(this).attr("src");
        $("#spec-n1 img").eq(0).attr({
            src:src.replace("\/n5\/","\/n1\/"),
            jqimg:src.replace("\/n5\/","\/n0\/")
        });
        $(this).css({
            "border":"2px solid #ff6600",
            "padding":"1px"
        });
    });
    
    $("#spec-list img").mouseout(function(){
        $(this).css({
            "border":"1px solid #ccc",
            "padding":"2px"
        });
    });
   
    // 倒计时
    setInterval("timer()",1000);
});

 