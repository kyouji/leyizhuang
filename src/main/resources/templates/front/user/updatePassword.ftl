<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--密码修改</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Tm/css/manhuaTip1.1.0.css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/util.js"></script>
<script type="text/javascript" src="/Tm/js/front/uppass.js"></script>
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
        <li><a href="/order/obligation" >待付款订单</a></li>
        <li><a href="/order/startorder">待收货订单</a></li>
        <li><a href="/order/orderok">已完成订单</a></li>
         <li><a href="/order/orderno" >已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" class="act">密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
        <li><a href="/user/collect">我的收藏</a></li>
        <li><a href="/user/point" >我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="#">帮助中心</a></li>
  
      </ul>
    </div>

<div class="flr right">
<div class="list_banner1">
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="#">手机产品</a>&gt;<a href="#">手机筛选</a>&gt; </div>
        
        
        
<div class="user_r_table pt25 ml20">
      <table width="440" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="user_r_tit">原密码： </td>
          <td class="user_r_110"><input class="input" id="password" type="password" autofocus="autofocus" maxlength="20" placeholder="请输入密码,8-16位, 允许数字、大小写英文字母、下划线以及常用英文符号"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">新密码：</td>
          <td> <input class="input" type="password" id="newpassword"  maxlength="20" placeholder="请输入密码,8-16位, 允许数字、大小写英文字母、下划线以及常用英文符号"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">再次输入：</td>
          <td> <input class="input" type="password" id="oncepassword" maxlength="20" placeholder="请输入密码,8-16位, 允许数字、大小写英文字母、下划线以及常用英文符号"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit"></td>
          <td><input type="button" class="user_r_btn" value="确认修改" onclick="tm_update(this)"/></td>
          <td>&nbsp;<input type="hidden" value="${user.username}" id="hname"></td>
        </tr>
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

</body>
</html>
