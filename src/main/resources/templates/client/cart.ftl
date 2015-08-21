<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>

<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/Shopping_cart.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/Shopping_cart_empty.css"/>

<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/cart.js"></script>
</head>

<body>
    <!--顶部-->
    <#include "/client/common_header.ftl" />

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

    <div id="cart-main" class="wrapper">
        <#include "/client/cart_goods.ftl" />
    </div>

    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
