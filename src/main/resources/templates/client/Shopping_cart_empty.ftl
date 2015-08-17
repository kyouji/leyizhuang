<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/Shopping_cart_empty.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--顶部-->
<#include "/client/common_user_header.ftl" />

<!--购物车进度条-->
<div class="progress_bar">
	<div class="bar_1">1、购物车</div>
    <div class="bar_2">2、订单信息</div>
    <div class="bar_3">3、支付完成</div>
</div>
<div class="product_information">
	<a class="merchandise">商品</a>
    <a class="unit_price">单价（元）</a>
    <a class="quantity">数量</a>
    <a class="total_price">总价（元）</a>
    <a class="operating">操作</a>
</div>


<!--空购物车-->
<div class="empty">
	<img src="images/empty_shopcar.png" />
    <div class="right">
        <p class="pay">您的购物车还是空的，<br />
			赶快去选购心怡的商品吧！
        </p>
        <p class="acceptable"><a href="#">立即去购物 >></a></p>
    </div>
</div>


<!--底部footer-->
<#include "/client/common_footer.ftl" />

</body>
</html>
