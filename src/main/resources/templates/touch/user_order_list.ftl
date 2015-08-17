<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>我的订单</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/order.css"/>
<script type="text/javascript">
$(document).ready(function(){
  
});
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>我的订单</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="images/home.png" height="22" /></a></div>
</header>

 <div class="main">
  <div class="clear15"></div>
  <table class="content_check">
    <tr>
      <td>
        <a class="a2 <#if status_id?? && status_id==0>sel</#if>" href="/touch/user/order/list/0"><p>全部订单</p></a>
      </td>
      <td class="two-border">
        <a class="a2 <#if status_id?? && status_id==2>sel</#if>" href="/touch/user/order/list/2"><p>待付款</p></a>
      </td>
      <td class="two-border">
        <a class="a2 <#if status_id?? && status_id==3>sel</#if>" href="/touch/user/order/list/3"><p>待发货</p></a>
      </td>
      <td>
        <a class="a2 <#if status_id?? && status_id==4>sel</#if>" href="/touch/user/order/list/4"><p>待收货</p></a>
      </td>
      <td>
        <a class="a2 <#if status_id?? && status_id==6>sel</#if>" href="/touch/user/order/list/6"><p>已完成</p></a>
      </td>
    </tr>
  </table>
  
  <div class="myorder_list">
    <#if order_page??>
    <#list order_page.content as order>
        <h2>订单编号&nbsp; ${order.orderNumber!''}<span>${order.orderTime!''}</span></h2>
        <#list order.orderGoodsList as og>
            <a class="a1" href="/touch/goods/${og.goodsId}">
              <span class="sp1"><img src="${og.goodsCoverImageUri}" /></span>
              <p class="mb10">${og.goodsTitle!''}</p>
              <p>单价：<span class="sc">￥${og.price?string("0.00")}</span>&nbsp;&nbsp;数量：${og.quantity!''}</p>
              <div class="clear"></div>
            </a>
         </#list>
         <p>总价：￥${order.totalPrice?string("0.00")}元</p>
         <#if order.statusId==2>
    </#list>
    </#if>
</div>
  
<!--main END-->


</body>
</html>
