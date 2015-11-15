<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<link href="/client/css/Successfully_joined.css" rel="stylesheet" type="text/css" />
<link href="/client/css/order_pay.css" rel="stylesheet" type="text/css" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--顶部-->
<#include "/client/common_header.ftl" />

<!--完成支付-->
<div class="main">
   
    <div class="car_success">
        <p class="fc fs30 lh40 pb10" style="font-size:20px;color:#ef7c00">订单提交成功! </p>
        <p> 订单号：<a href="/user/order?id=${order.id!''}">${order.orderNumber!''}</a></p>
        <p> 支付方式：${order.payTypeTitle!''}</p>
        <p>应付金额￥${order.totalPrice?string('0.00')} <a style="color:#b61d1d" class="blue" href="/order/dopay/${order.id?c}">点击支付</a></p>
        <p>您还可以<a style="color:#b61d1d" class="blue" href="/user/order/list/0">查看订单</a>或在订单详情页面<a class="blue" href="/user/order?id=${order.id!''}">修改支付方式</a></p>
    </div>
  
    <div class="clear"></div> 
</div>

<!--底部footer-->

<#include "/client/common_footer.ftl" />
</body>
</html>
