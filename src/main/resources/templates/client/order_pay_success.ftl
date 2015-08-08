<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<link href="/client/css/Complete_payment.css" rel="stylesheet" type="text/css" />
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
<!--完成支付-->
<div class="complete_payment">
	<img src="/client/images/correct.png" />
    <div class="right">
        <p class="pay">您已成功付款&nbsp;${order.totalPrice?string('0.00')}&nbsp;元</p>
      <!--  <p>本次交易获得积分&nbsp;380&nbsp;点</p>     -->
        <p class="address">支付方式</p>
        <p>${order.payTypeTitle!''}</p>
        <p class="security_alert">安全提醒：您的订单已提交成功，请勿相信各种退款信息！</p>
        <p class="acceptable">您还可以： <a href="/cart">查看购物车</a>  <a href="/">继续购物</a>  查看<a href="#">订单详情</a>   返回<a href="#">我的积分</a></p>
    </div>
</div>

<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
