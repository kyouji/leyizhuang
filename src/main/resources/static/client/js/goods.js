$(document).ready(function(){

    // 点击tab
    $(".stab").click(function(){
       
    	// tab特效切换
        $(".stab").removeClass("c_R_tab_choiced");
        $(this).addClass("c_R_tab_choiced");
       
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

/**
 * 之前的关注方法（addCollect）在未知情况下不能使用了，重新定义新的方法以实现关注功能
 * @author dengxiao
 */
function userAddCollect(goodsId){
	
	//判断传入的商品ID是否未空
	if (undefined == goodsId)
    {
        return;
    }
	
	//将goodsId通过异步请求发送至后台
	$.post("/user/collect/add",{"goodsId":goodsId},function(data){
		//根据message的信息判断用户是否关注成功
		alert(data.message);
		
		//在没有用户登陆的情况下跳转到登陆页面
		if (data.code==1){
			setTimeout(function(){
				window.location.href = "/login";
			}, 1000); 
		}
		  
	});
}

function addCollect(goodsId)
{
    if (undefined == goodsId)
    {
        return;
    }
    
    $.post("/user/collect/add",{"goodsId":goodsId},function(data){
    	alert(data.message);
        // 需登录
        if (data.code==1)
        {
            setTimeout(function(){
                window.location.href = "/login";
            }, 1000); 
        }
    });
    
//    $.ajax({
//        type:"post",
//        url:"/user/collect/add",
//        data:{"goodsId": goodsId},
//        dataType: "json",
//        success:function(res){
//    		/**
//    		 * 修改了原来的代码
//    		 * 根据res中message的值判断是否关注成功，关注成功则显示出成功提示的DIV
//    		 * （原来的代码是通过alert语句弹出成功提示）
//    		 * @author dengxiao
//    		 */
//        	if(res.message!="添加成功"){
//        		alert(res.message);
//        	}else{
//        		document.getElementById("collectGoods").style.display="block";
//        		document.getElementById("collectWindow").style.display="block";
//        	}
//        	
//        }
//    });
}





 