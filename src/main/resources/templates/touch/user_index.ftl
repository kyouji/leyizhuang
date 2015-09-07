<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link rel="stylesheet" type="text/css" href="/touch/css/style.css"/>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/mycenter.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
  searchTextClear(".comserch_text","搜索关键字","#999","#333");
});
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>会员中心</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  </div>
</header>

<div class="main">
  <section class="member_info">
    <b><img src="${user.headImageUri!'/mag/style/user_avatar.png'}" /></b>
    <p class="nc">昵称：<span class="fc">${user.username!''}</span></p>
    <p>积分：<span class="sc">${user.totalPoints!'0'}</span>分</p>
    <div class="clear"></div>
  </section>
  
 
  <div class="member_line">
    <div class="member_lin">
      
      <ul>
        <a href="/touch/user/order/list/2">
        <li><img src="/touch/images/img1/icon_7.png" /></li>
        <li class="gn">待付款<span>${total_unpayed!'0'}</span></li>
        </a>
      </ul>
    </div>
    <div class="member_lin">
      <ul>
      <a href="/touch/user/order/list/3">
        <li><img src="/touch/images/img1/icon_8.png" /></li>
        <li class="gn">待发货<span>${total_undelivered!'0'}</span></li>
        </a>
      </ul>
    </div>
    <div class="member_lin">
      <ul>
      <a href="/touch/user/order/list/4">
        <li><img src="/touch/images/img1/icon_9.png" /></li>
        <li class="gn">待收货<span>${total_unreceived!'0'}</span></li>
        </a>
      </ul>
    </div>
    <div class="member_lin">
      <ul>
      <a href="/touch/user/order/list/5">
        <li><img src="/touch/images/img1/icon_10.png" /></li>
        <li class="gn">待评价<span>${total_finished!'0'}</span></li>
        </a>
      </ul>
    </div>
  </div>
   <div class="member_check">
        <a href="/touch/user/order/list/0">
            <img src="/touch/images/img1/icon_1.png" /><label>全部订单(<span>${order_page.content?size!0}</span>)</label>
        </a>
   </div>
   <div class="member_check" >
      <a href="/touch/user/collect/list">
            <img src="/touch/images/img1/icon_2.png" /><label>我的关注</label>
      </a>
  </div>
  
  <div class="member_check" >
        <a href="/touch/user/return/list">
        <img src="/touch/images/img1/icon_3.png" /><label>退换货</label>
        </a>
  </div>

  <div class="member_check ">
        <a href="/touch/user/address/list">
        <img src="/touch/images/img1/icon_4.png" /><label>收货地址</label>
        </a>
  </div>
  <div class="member_check">
     <a href="/touch/user/data">
        <img src="/touch/images/img1/icon_5.png" /><label>个人信息</label>
      </a>
  </div>
  <div class="member_check ">
       <a href="/touch/user/password">
        <img src="/touch/images/img1/icon_15.png" /><label>修改密码</label>
       </a>
  </div>
  <div class="member_check ">
       <a href="/touch//user/setting">
        <img src="/touch/images/img1/icon_16.png" /><label>关于我们</label>
       </a>
  </div>
</div><!--main END-->

<#include "/touch/common_footer.ftl" />

</body>
</html>
