<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>订单确认</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />



</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>购买确认</p>
   <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>
  </div>
</header>
<div class="clear"></div>

<div class="main confirm mt20">
       <h4>共计：<b>￥<span><#if order??>${order.totalPrice?string('0.00')}</#if></span>元</b></h4>      
       <p class="mt10 fs08">订单已提交，请尽快支付！</p>
</div>

<div class="main confirm">

	<a href="/order/dopay/${order.id}">
    	<h5>立即支付</h5>
        <span><img src="/touch/images/front/arrow04.png" /></span>
    </a>
    
</div>




<!--main END-->



</body>
</html>
