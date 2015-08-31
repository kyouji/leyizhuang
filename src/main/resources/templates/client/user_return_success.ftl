<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/return_3.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/jquery.cityselect.js"></script>

<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript">
  $(document).ready(function(){
  //  menuDownList("top_phone","#top_phonelist",".a1","sel");
  //  phoneListMore();//单独下拉
 //   menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
//    navDownList("navdown","li",".nav_showbox");
//    menuDownList("mainnavdown","#navdown",".a2","sel");
//    checkNowHover("shopping_down","shopping_sel");
    
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
    
    $("#address").citySelect({
        nodata:"none",
        <#if address?? && address.province??>prov: "${address.province!''}",</#if>
        <#if address?? && address.city??>city: "${address.city!''}",</#if>
        <#if address?? && address.disctrict??>dist: "${address.disctrict!''}",</#if>
        required:false
    }); 
    

});
</script>

</head>
<body>
<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
  <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
  <div class="content_2">
<div class="content_2_1">
  <ul>
    <li class="li_1">买家申请退货 </li>
    <li class="li_2">商家处理退货申请</li>
    <li class="li_3">退货成功</li>
  </ul>
</div>
<div class="content_2_2">
<div class="content_2_2_1">
  <div class="l_1">退货商品信息</div>
  <#if order_goods??>
  <div class="l_2"> 
    <dl>
      <dt><img src="${order_goods.goodsCoverImageUri!''}" title="${order_goods.goodsTitle!''}"/></dt>
      <dd><a href="/goods/${order_goods.goodsId!''}" target="_blank">${order_goods.goodsTitle!''}</a></dd>
    </dl>
  </div>
  <div class="l_3">
    <dl>
      <dt>单  价：${order_goods.price}元       ×${order_goods.quantity}(数量)</dt>
      <dd>小计：<span>${order_goods.quantity * order_goods.price}</span>元</dd>
    </dl>
  </div>
  </#if>
  <#if order_info??>
  <div class="l_4">订单信息</div>
      <div class="l_5">
        <ul>
          <li>订单编号：<span class="sp_1"><a href="/user/order?id=${order_info.id!''}">${order_info.orderNumber!''}</a></span> </li>
          <li>运费：${order_info.deliverTypeFee!0.00}元</li>
          <li>总计：<span class="sp_2">${order_info.totalPrice!'' }</span>元</li>
          <li>成交时间： ${order_info.orderTime!''}</li>
        </ul>
      </div>
  </#if>
</div>
<div class="content_2_2_2">
  <dl>
    <dt><img src="/client/images/gou1.png" /></dt>
    <dd class="th">退货成功！</dd>
    <dd class="fh"><a href="/user" title="">返回个人中心</a></dd>
  </dl>
</div>
</div>
</div>
</div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
