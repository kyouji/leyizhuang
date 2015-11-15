<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/mymember.js"></script>


<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/client/css/content_l.css" />

<script type="text/javascript">
  $(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    searchTextClear(".bottext","查看所有门店","#fff","#fff");
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    myLeftMunu();//左侧菜单
    
    
});
</script>
</head>

<body>
<header class="maintop">
  <section class="main">
    <h1>亲，欢迎来到正品惠客</h1>
    <p class="p1">重庆</p>   
    <p class="p2"><#if site??>${site.telephone!''}</#if></p>
    <p class="p3">服务热线：</p>
    
    
    
    <a class="a2" href="http://wpa.qq.com/msgrd?v=3&uin=${site.qq!''}&site=qq&menu=yes">在线咨询</a>
    <a class="a3" href="/user">会员俱乐部</a>
    <a class="z-in10" href="#">帮助中心</a>
    <#if username??>
        <menu id="top_order">
          <a class="a4" href="/user/order/list/0">我的订单<i></i></a>
          <div class="clear"></div>
          <div id="top_orderlist">
            <p class="p_box">
            <a href="/user"><img src="/client/images/t_order01.png" />我的信息</a>
            <a href="/user/collect/list"><img src="/client/images/t_order02.png" />我的收藏</a>
            <a href="/user/return/list"><img src="/client/images/t_order03.png" />报修/退换货</a>
            <a href="/user/comment/list"><img src="/client/images/t_order04.png" />我拍到的宝贝</a>
            <a href="/user/consult/list"><img src="/client/images/t_order05.png" />我的商品咨询</a>
            <a href="/logout"><img src="/client/images/t_order06.png" />安全退出</a>
            </p>
          </div>
        </menu>
    <#else>
        <a class="z-in10" href="javascript:void(0);" onclick="$('#register').fadeIn(300);">免费注册</a>
        <a class="z-in10" href="/login">你好！请登录</a>
        
    </#if>
    <div class="clear"></div>
  </section>
</header><!--maintop-->

<!-- 浮动 -->
<aside class="floatbox">
 <a href="#" title="微信客服"><img src="/client/images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="<#if site??>${site.wxQrCode!''}</#if>" /></span></a>
  <a href="http://wpa.qq.com/msgrd?v=3&uin=${site.qq!''}&site=qq&menu=yes" title="在线咨询"><img src="/client/images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
  <a href="#" title="新浪微博"><img src="/client/images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
  <a href="#" title="服务热线"><img src="/client/images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><#if site??>${site.telephone!''}</#if></span></a>
  <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="/client/images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
</aside>

<!--会员顶部-->
<section class="member_top">
  <div class="main">
    <a class="logo" href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a>
    <nav>
      <a class="sel" href="/">首页</a>
      <a href="/user">个人主页</a>
      <a href="/user">账户管理</a>
      <a href="/user">消息</a>
    </nav>
    <div class="search">
       <form action="/search" method="get" style="width:290px">
            <input type="text" class="text" name="keywords" value="${keywords!keywords_list[0].title}"/>
            <input type="submit" class="sub" value="搜索" />
      </form>
    </div>
  </div>
</section><!--member_top END-->


<div class="clear"></div>

<!--mymember-->
<div class="myclear"></div>
<div class="mymember_out">
<div class="mymember_main">
  
  <div class="myclear" style="height:20px;"></div>
  
  
  <div class="mymember_mainbox newshopcar">
    <div class="mymember_info">
      <div class="mymember_order_search" style="border-bottom:1px solid #eee; padding-bottom:20px;">
        
        <!-- 提交成功 -->

    
  <!--商品订单-->
    <div class="main-tit">
      <h2>支付中心</h2>
    </div>
    <input id="pay_subject" name="pay_subject" type="hidden" value="购买商品">
    <div class="inner-box">
      <div class="dl-list">
        <dl>
          <dt>订 单 号：</dt>
          <dd>${order.orderNumber!''}</dd>
        </dl>
        <dl>
          <dt>收货人姓名：</dt>
          <dd>${order.shippingName!''}</dd>
        </dl>
        <dl>
          <dt>送货地址：</dt>
          <dd>${order.shippingAddress!''}</dd>
        </dl>
        <dl>
          <dt>手机号码：</dt>
          <dd>${order.shippingPhone!''}</dd>
        </dl>
        <dl>
          <dt>邮编：</dt>
          <dd>${order.postalCode!''}</dd>
        </dl>
        <dl>
          <dt>备注留言：</dt>
          <dd>${order.userRemarkInfo!''}</dd>
        </dl>
        <dl>
          <dt>支付金额：</dt>
          <dd>
            ${order.totalPrice!''} 元
          </dd>
        </dl>
        <dl>
          <dt>支付方式：</dt>
          <dd>${order.payTypeTitle!''}</dd>
        </dl>
        
        <dl>
          <dt></dt>
          <dd><input type="submit" class="btn pay_sub" onclick="location='/order/dopay/${order.id?c}'" value="确认支付"></dd>
        </dl>
        
      </div>
    </div>
    <!--/商品订单-->
    
        <!-- 提交成功end -->
    </div><!--mymember_info END-->
 
  </div><!--mymember_center END-->
  
  <div class="myclear"></div> 
</div><!--mymember_main END-->
<div class="myclear"></div>
</div>
<!--mymember END-->

<div class="clear h20"></div>
<#include "/client/common_footer.ftl" />
</body>
</html>
