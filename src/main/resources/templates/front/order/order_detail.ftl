<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--我的订单----详细信息</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
   <script src="/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
</head>
<body>
<header>
<div class="main">
	<#include "/front/comment/header.ftl">
</div>
</header>

<div class="header1 main">
<#include "/front/comment/header1.ftl">

</div></nav>

<div class="gwcbg">
<div class="main mt12">
<div class="member_lef fll"> <span class="sp55">订单中心</span>
      <ul class="haoh pt10">
        <li><a href="/order/list" class="act">全部订单</a></li>
        <li><a href="/order/obligation?status=0">待付款订单</a></li>
        <li><a href="/order/startorder?status=1">待收货订单</a></li>
        <li><a href="/order/orderok?status=3">已完成订单</a></li>
        <li><a href="/order/orderno?status=4">已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" >密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
        <li><a href="/user/collect">我的收藏</a></li>
        <li><a href="/user/point" >我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="/help/question/1">帮助中心</a></li>
  
      </ul>
    </div>



<div class="flr right">
<div class="list_banner1">
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="#">手机产品</a>&gt;<a href="#">订单详情</a>&gt; </div>
<div>订单状态：      <#if order.statusCode==0>待付款
			   <#elseif order.statusCode==1>待收货
			   <#elseif order.statusCode==3>已完成
			   <#elseif order.statusCode==4>已关闭
			   </#if></div>
<div>收货地址：<#if shopping_order_list.shippingAddress??>${shopping_order_list.shippingAddress}</#if></div>
<div>配送方式：由荣诚同意发货</div>
<div>发票抬头：<#if shopping_order_list.invoiceTitle??>${shopping_order_list.invoiceTitle}</#if></div>     

        <div class="gwc1_lm mt15">
<table>
<tr>
<td></td>
<td>商品信息</td>
<td>单价</td>
<td>数量</td>
<td>合计</td>
</tr>
</table>
</div>
		<div class="member_dd">
		<#assign totalPrice = 0>
		<#list shopping_order_list.orderItemList as shopping_order_orderItemList>
		<table class="member_ddhe">
		<tr>
		<td class="member_dd_a"><span><a href="href="/product/${shopping_order_list.id}""><#if shopping_order_orderItemList.productCoverImageUri??><img src="${shopping_order_orderItemList.productCoverImageUri}" width="76" height="76"></#if></a>
		</td>
		<td> <#if shopping_order_orderItemList.productBrief??>${shopping_order_orderItemList.productBrief}</#if></td>
		<td class="member_dd_b"><#if shopping_order_orderItemList.price??>
		    <span>${shopping_order_orderItemList.price}</span></#if>
		</td>
		<#if shopping_order_orderItemList??><td class="member_dd_c">${shopping_order_orderItemList.quantity}</td></#if>
		<#if shopping_order_orderItemList.price?? && shopping_order_orderItemList.quantity??> <#assign ItemPrice = shopping_order_orderItemList.price*shopping_order_orderItemList.quantity>
        <#assign totalPrice = totalPrice + ItemPrice>
        <td class="gwc1_lm2_b1"><span>￥${ItemPrice?string("#.##")}</span></td>
        </#if>
		</tr>
		</table>
		</#list>
		</div>

    <div id="id-pagination" style="margin-top: 0px;float: right;">
          <div class="pagination">
          总计：￥<#if shopping_order_list.totalPrice??>
	              ${shopping_order_list.totalPrice}
	          </#if>XXXXXX元
          </div>
      </div>
        
</div></div>
</div>
</div>

<div class="clear"></div>

<div class="main mt20">
<#include "/front/comment/top.ftl">
</div>

<div class="clear"></div>

<div class="footallbg">
<#include "/front/comment/top1.ftl">

</div>


</body>
</html>

