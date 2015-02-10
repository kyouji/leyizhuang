<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--我的积分</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
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
         <li><a href="/order/orderno?status=4" >已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" >密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
        <li><a href="/user/collect">我的收藏</a></li>
        <li><a href="/user/point" class="act">我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="/help/question/1">帮助中心</a></li>
  
      </ul>
    </div>

<div class="flr right">
<div class="list_banner1">
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="javascript:void(0)">个人中心</a>&gt;<a href="javascript:void(0)">我的积分</a>&gt; </div>
        
        
 <#assign total=0>       
<#if Points??>
<#list Points as pointt>  
<#assign e=pointt.points><#--这里需要一个统计总数，去计算该用户的所有可用积分,现在还没有service-->
<div class="integration_a"><div class="fll integration_a_1">可用积分<span>${e}</span> 2015-12-31将过期积分<span>0分</span></div><div class="flr integration_a_2"><a href="#">积分使用详情</a></div></div>
</#list>
</#if>   
<div class="gwc2_psfs mt12">

<div class="gwc1_lm mt12">
<table>
<tr>
<td width="20%">日期</td>
<td width="15%">积分</td>
<td width="40%">涉及订单</td>
<td width="25%">详情</td>
</tr>
</table>
</div>

<div class="gwc1_lm255">
<table>
<#if Points??>
<#list Points as point>
<tr>
<td  width="20%" class="gwc1_lm2_a155"><#if point.time??>${point.time}</#if></td>
<td  width="15%" class="gwc1_lm2_b155"><span>+<#if point.points??>${point.points}</#if></span></td>
<td  width="40%" class="gwc1_lm2_c155"><p><a href="#"><#if point.shoppingOrderNumber??>${point.shoppingOrderNumber}</#if></a></p></td></td>
<td  width="25%" class="gwc1_lm2_b155"><span><#if point.detail??>${point.detail}</#if></span></td>
</tr>
</#list>
</#if>
</table>
</div>
</div>    
    
    
    
    <div class="sx_list5 mt15">
     
      <div class="clear"></div>
   <#--   <div class="page"> <span>共365条记录&nbsp;&nbsp;5/14页&nbsp;&nbsp;</span> <a href="/">首页</a> <a href="javascript:void(0)">上一页</a> <a href="#">1</a> <a href="#" class="pageon">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <span>...</span> <a href="#">18</a> <a href="javascript:void(0)">下一页</a> <a href="#">尾页</a> </div>-->
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




  











