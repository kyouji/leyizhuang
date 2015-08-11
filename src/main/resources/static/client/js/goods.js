$(document).ready(function(){

    // 点击tab
    $(".stab").click(function(){
       
    	// tab特效切换
        $(".stab").removeClass("sel");
        $(this).addClass("sel");
       
        // tab页面切换
        $(".php_z").css("display", "none");
        $("#tab"+$(this).attr("tid")).css("display", "block");
        if($(this).attr('tid')==0){
        	$("#tab5").css("display", "block");
        }
        
       
    });
//
//    $(".comb-checkbox").click(function(){
//        var combop = parseFloat($("#combOriginPrice").html());
//        var combcp = parseFloat($("#combCurrentPrice").html());
//        var combsave = parseFloat($("#combSave").html());
//        var combCount = parseInt($("#combCount").html());
//        
//        
//        if ($(this).attr("checked"))
//        {
//            var index = $(".comb-checkbox").index($(this));
//            
//            var op = parseFloat($(".comb-origin-price").eq(index).html());
//            var cp = parseFloat($(".comb-current-price").eq(index).html());
//            var span = op - cp;
//            
//            $("#combOriginPrice").html(op + combop);
//            $("#combCurrentPrice").html(cp + combcp);
//            $("#combSave").html(span + combsave);
//            $("#combCount").html(combCount + 1);
//        }
//        else
//        {
//            var index = $(".comb-checkbox").index($(this));
//            
//            var op = parseFloat($(".comb-origin-price").eq(index).html());
//            var cp = parseFloat($(".comb-current-price").eq(index).html());
//            var span = op - cp;
//            
//            $("#combOriginPrice").html(combop - op + "");
//            $("#combCurrentPrice").html(combcp - cp + "");
//            $("#combSave").html(combsave - span + "");
//            $("#combCount").html(combCount - 1 + "");
//        }
//    });
});

function addCollect(goodsId)
{
    if (undefined == goodsId)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/user/collect/add",
        data:{"goodsId": goodsId},
        dataType: "json",
        success:function(res){
    		/**
    		 * 修改了原来的代码
    		 * 根据res中message的值判断是否关注成功，关注成功则显示出成功提示的DIV
    		 * （原来的代码是通过alert语句弹出成功提示）
    		 * @author dengxiao
    		 */
        	if(res.message!="添加成功"){
        		alert(res.message);
        	}else{
        		document.getElementById("collectGoods").style.display="block";
        		document.getElementById("collectWindow").style.display="block";
        	}
        	
            // 需登录
            if (res.code==1)
            {
                setTimeout(function(){
                    window.location.href = "/login";
                }, 1000); 
            }
        }
    });
}

/**
 * 隐藏关注成功窗口的函数
 * @author dengxiao
 */
function close(){
	document.getElementById("collectWindow").style.display="none";
	document.getElementById("collectGoods").style.display="none";
}


 