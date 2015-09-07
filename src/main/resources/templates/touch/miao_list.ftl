<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="chinaz-site-verification" content="0571b99b-03be-45ff-b0b0-bc3be3aa6957" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1,user-scalable=0, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="/touch/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/sales.css"/>

<title>秒杀</title>
<script type="text/javascript">
function checkTime(i)  
{  
    if (i < 10) {  
        i = "0" + i;  
    }  
    return i;  
}
</script>
</head>

<body>
<!--Begin-->
<div class="zphk">

<!--顶部标题与搜索框-->
<header class="maintop">
    <div class="main">
        <p>惠客秒杀</p>
        <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
        <a class="a2" href="/touch"><img src="/touch/images/home2.png" height="25" /></a>
    </div>
</header>   
   
<div class="clear" style="margin-top:50px;"></div> 
	
    <#if miao_goods_list??&&miao_goods_list?size gt 0>
        <!--秒杀-->
        <div class="today_hot">
            <#list miao_goods_list as item>
            <span class="p_time" id="miao_time${item_index}"></span>
                        <script type="text/javascript" src="/touch/js/jquery-1.9.1.min.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function(){
                                miaoTimer${item_index}();
                                setInterval("miaoTimer${item_index}()",1000);
                            });
                    
                            function miaoTimer${item_index}(){
                                    var ts = (new Date(${item.flashSaleStopTime?string("yyyy")}, 
                                    parseInt(${item.flashSaleStopTime?string("MM")}, 10)-1, 
                                    ${item.flashSaleStopTime?string("dd")}, 
                                    ${item.flashSaleStopTime?string("HH")}, 
                                    ${item.flashSaleStopTime?string("mm")}, 
                                    ${item.flashSaleStopTime?string("ss")})) - (new Date());
                                    if (0 == ts)
                                    {
                                        window.location.reload();
                                    }
        
                                    var date = new Date();
                                    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
                                    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);
                                    var mm = parseInt(ts / 1000 / 60 % 60, 10);
                                    var ss = parseInt(ts / 1000 % 60, 10);
                                    dd = checkTime(dd);
                                    hh = checkTime(hh);
                                    mm = checkTime(mm);
                                    ss = checkTime(ss);
                                    $("#miao_time${item_index}").html("&emsp;剩余时间：<span>"
                                    + dd + "</span>天<span>"
                                    + hh + "</span>时<span>"
                                    + mm + "</span>分<span>"
                                    + ss + "</span>秒");
                                }
                        </script>
                <a class="phone_list" href="/touch/goods/${item.id?c}?promotion=miao">
                    <b><img src="${item.flashSaleImage!''}" /></b>
                    <p class="p1">${item.title!''}</p>
                    <p class="p_1">${item.subTitle!''}</p>
                    <p class="p2"><label class="p2_l1">秒杀价￥<span>${item.flashSalePrice?string("0.00")}</span></label></p>
                    <p class="p2"><label class="p2_l2">原价￥<span>${item.salePrice?string("0.00")}</span></label></p>
                   
                    <div class="clear1"></div>
                
                    <h6 style="margin-bottom:10px;">
                        <#if item.flashSaleLeftNumber==0>
                            <span>已售完</span>
                        <#else>
                            <span>还剩${item.flashSaleLeftNumber!'0'}件 </span>
                        </#if>
                    </h6>
                    <div style=" width:100%;clear:both;height:10px;"></div>
                    <span class="m_btn">立即购买</span>
                 </a>
             </#list>
        </div>
    </#if>
    
    <!--底部导航-->
    <#include "/touch/common_footer.ftl">
    
    <!--版权备案-->
    <#include "/touch/common_touch_copyright.ftl">
    
    <!--底部-->
    <#include "/touch/common_touch_menu.ftl">
</div>
<!--END!-->
</body>
</html>
