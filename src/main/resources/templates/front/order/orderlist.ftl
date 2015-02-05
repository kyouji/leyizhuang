<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--我的订单</title>
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
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="#">手机产品</a>&gt;<a href="#">手机筛选</a>&gt; </div>
        
<#list shopping_order_list as shopping_order>
	 <#assign total = 0>
        <#list shopping_order.orderItemList as item>
           <#if item??> <#assign total = total + item.quantity * item.price></#if>
        </#list>
    <tr class="member_ddhe" style="border-bottom:1px solid #ddd; height:30px; line-height:30px; background:#f2f2f2 ;">
        <td width="331" class="member_dd_a"><em id="changebackground" style="width:55px;text-align:center;font-size:12px;float:left;color:#fff;height:40px;line-height:40px;background:#2881D5;display:block;"><#if shopping_order.status??>${shopping_order.status}</#if></em><div class="fl" style="line-height:40px;">&nbsp;&nbsp;&nbsp;&nbsp;<#if shopping_order.orderTime??>${shopping_order.orderTime}</#if>&nbsp;&nbsp;&nbsp;&nbsp;订单号：<i><#if shopping_order.orderNumber??>${shopping_order.orderNumber}</#if></i></div></td>
        <td colspan="4" class="member_dd_b"><div class="fr"><span style="color:#f60">￥${total?string("#.##")}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <#if shopping_order.status?? && shopping_order.status=="0">
            <a href="javascript:void(0)" onclick="destroy(${shopping_order.id})">删除订单</a>&nbsp;|&nbsp;
            <a href="#">立即支付</a>&nbsp;|&nbsp;
        <#else>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </#if>
        <a href="#">订单详情</a>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <div class="clear"></div>
    </tr>
		<div class="member_dd">
		
		<#list shopping_order.orderItemList as shopping_order_orderItemList>
		<table>
		<tr class="member_ddhe">
		<td class="member_dd_a"><span><a href="#"><img src="img/chdjfk.jpg" width="76" height="76"></a></span><a href="/product/${shopping_order.id}"><#if shopping_order_orderItemList.productBrief??><p>${shopping_order_orderItemList.productBrief}</p></#if></a></td>
		<td class="member_dd_b"><#if shopping_order_orderItemList.price??><span>${shopping_order_orderItemList.price}</span></#if></td>
		<#if shopping_order_orderItemList??><td class="member_dd_c">${shopping_order_orderItemList.quantity}</td></#if>
		<#if shopping_order.statusCode??><td class="member_dd_d">${shopping_order.statusCode}</td></#if>
		
		</tr>
		</table>
		</#list>
		</div>
	
</#list>

</div>
        <div class="clear h20"></div>
        <div class="flr fot_fanye"><ul class="haoh">
        <li><a href="#" ><<</a></li>
         <li><a href="#" class="act">1</a></li>
          <li><a href="#">2</a></li>
           <li><a href="#">>></a></li>
        </ul></div>
        
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




  











