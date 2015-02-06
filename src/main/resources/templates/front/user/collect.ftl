<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--我的收藏</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
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
<div class="member_lef fll"> <span class="sp55">新手入门</span>
      <ul class="haoh pt10">
       <li><a href="/order/list" >全部订单</a></li>
        <li><a href="/order/obligation?status=0" >待付款订单</a></li>
        <li><a href="/order/startorder?status=1">待收货订单</a></li>
        <li><a href="/order/orderok?status=3">已完成订单</a></li>
         <li><a href="/order/orderno?status=4">已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" >密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
        <li><a href="/user/collect" class="act">我的收藏</a></li>
        <li><a href="/user/point" >我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="/help/question/1">帮助中心</a></li>
  
      </ul>
    </div>

<div class="flr right">
<div class="list_banner1">
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="javascript:void(0)">个人中心</a>&gt;<a href="javascript:void(0)">我的收藏</a>&gt; </div>
 <div class="gwc1_lm mt15">
<table>
<tr>
<td>商品信息</td>
<td>价格</td>
<td>操作</td>
</tr>
</table>
</div>

<div class="member_dd">
<table>
<#if collectedProductIds??>
<#list collectedProductIds as collect>
<tr class="member_ddhe">
<td class="member_sc_a"><span><a href="#"><img src="<#if collect.coverImageUri??>${collect.coverImageUri}</#if>" width="76" height="76"></a></span><a href="#"><p><#if collect.name??>${collect.name}</#if></p></a></td>
<td class="member_sc_b"><span>￥<#if collect.flashSalePrice??>${collect.flashSalePrice?c}</#if></span></td>
<td class="member_sc_e"><a href="/cart">购买产品</a><a href="javascript:void(0)" onclick="tm_del(this)">删除收藏</a></td>
</tr>
</#list>
</#if>
</table>
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





<script type="text/javascript">
function tm_del(obj){
	 if (window.confirm('确定要删除该收藏吗？')) {
	 	alert("正在开发!")
	 }
}
</script>
</body>
</html>
