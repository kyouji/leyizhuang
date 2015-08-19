<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
  searchTextClear(".order_words","给商家留言（选填、45字以内）：","#999","#333");
  
  $("#form1").Validform({
        tiptype: 1
    });
    
});
</script>

</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>提交订单</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>
  </div>
</header>
<div class="clear"></div>

<div class="main">
    <form action="/touch/order/submit" method="post" id="form1">
        <#if address_list??>
            <#list address_list as item>
                <#if item.isDefaultAddress>
                    <div class="order_info">
                        <h4 class="c3">收货人信息</h4>
                        <p>收货人：<span>${item.receiverName!''}</span></p>
                        <p>联系方式：<span>${item.receiverMobile!''}</span></p>
                        <p>地址：<span>${item.province!''}${item.city!''}${item.disctrict!''}${item.detailAddress!''}</span></p>
                        <a href="/touch/user/add"><img src="/touch/images/front/arrow04.png" /></a>
                    </div>
                </#if>
            </#list>
        </#if>
    
        <div class="order_info">
        	<h4 class="c3">商品详情</h4>
    		<a href="#"><img src="/touch/images/front/arrow04.png" /></a>
        </div>
        
        <#if selected_goods_list?? && selected_goods_list?size gt 0>
        <div class="whitebg">
          <ul class="car_list main">
            <#list selected_goods_list as cg>
                <li>
                  <a class="a2" href="/touch/goods/${cg.goodsId}<#if cg.qiang??>?qiang=${cg.qiang!''}</#if>" style="background-image:url(${cg.goodsCoverImageUri!''}); height:64px;">
                     <p style="height:30px;overflow:hidden; margin-bottom:5px;">${cg.goodsTitle!''}</p>
                     <p class="c9 lh16">颜色：黑色</p>
                     <p class="c9 lh16">赠品：无</p>
                  </a>
                  <div class="car_num">
                       <span class="red">￥${(cg.price*cg.quantity)?string("0.00")}</span>
                  </div>
                  <div class="clear"></div>
                </li>
            </#list>
          </ul>
        </div>
        </#if>
        
        
    
        <div class="order_info">
    	<h4 class="c3">支付方式</h4>
        <p>在线支付</p>
		<a href="#"><img src="/touch/images/front/arrow04.png" /></a>
    </div>
    
    <div class="order_info">
    	<h4 class="c3">配送方式</h4>
        <p>惠客配送</p>
		<a href="#"><img src="/touch/images/front/arrow04.png" /></a>
    </div>
    
    <div class="order_info">
    	<input type="text" class="order_words" value=""  />
    </div>
     <#assign totalQuantity=0>
     <#assign totalPrice=0>
     <#if selected_goods_list??>
        <#list selected_goods_list as sg>
            <#assign totalQuantity=totalQuantity+sg.quantity>
            <#assign totalPrice=totalPrice+(sg.price*sg.quantity)>
        </#list>
    </#if>
    
    </form>
</div>

<div class="clear60"></div>
<!--main END-->

<footer class="orderfoot">
  <div class="order_mainbox">
    <p><span style="margin-left:5%;">实付款：</span>￥<span>${totalPrice?string('0.00')}</span></p>
    <input class="sub" type="submit" value="提交订单" />
  </div>
</footer>

</body>
</html>
