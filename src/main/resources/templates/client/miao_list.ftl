<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-惠客秒杀</title>
<!--css-->
<link rel="shortcut icon" href="/images/zphk_logo.ico">
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/Spike.css" rel="stylesheet" type="text/css" />
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script>
function checkTime(i)  
{  
    if (i < 10) {  
        i = "0" + i;  
    }  
    return i;  
}

function flashBuy(id){
    if(null != id){
            var goodsId = id;
        }else{
            alert("获取商品信息失败！");
            return;
        }
    window.open("/order/promotionBuy?goodsId="+goodsId+"&promotion=miao");
}

function changeMiao(pageId){
    if(null == pageId){
        var totalPages = 0;
        var pageId = document.getElementById("now_flash_page").value;
        <#if miao_goods_page??>
            totalPages = ${miao_goods_page.totalPages!'0'};
        <#else>
            return;
        </#if>        
        <#-- 判断是否为数字 -->
        if(isNaN(pageId)){
            return;
        }
        
        <#-- 判断是否大于最大页数 -->
        if(pageId>totalPages){
            return;
        }
        
        <#-- 判断是否小于1 -->
        if(pageId<1){
            return;
        }
        
        pageId = pageId - 1;
    }
    var nowPage = pageId;
    
    $.ajax({
        type:"post",
        url:"/promotion/changeMiao",
        data:{"pageId":nowPage},
        success:function(data){
            $("#now_miao_by_dx").html(data);
        }
    });
}    
    
</script>
</head>

<body>
<#include "/client/common_useR_header.ftl">

<!--秒杀开始-->
<div id="now_miao_by_dx" class="wrapper">
    <#include "/client/now_miao.ftl">
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl">
</div>
</body>
</html>
