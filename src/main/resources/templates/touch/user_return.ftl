<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>退换货</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/return.css"/>
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function subReturn(){
    $(document).ready(function(){
    
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 2
    });
});


     $("#form1").submit();
}
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
  <p>退换货</p>
  <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a> 
  </header>
<div class="main">
  <div class="clear15"></div>
  <form action="/touch/user/return/save" method="post" id="form1">
  <section class="carlist"> 
        <input input name="orderId" type="hidden" value="${order.id?c}">
        <input input name="goodsId" type="hidden" value="${order_goods.goodsId}">
        <h2>订单编号&nbsp; ${order.orderNumber!''}<span><#if order.checkTime??>${order.checkTime!''}</#if></span></h2>
        <b><a href="/touch/goods/${order_goods.goodsId}"><img src="${order_goods.goodsCoverImageUri!''}" /></a></b>
        <p><a href="/touch/goods/${order_goods.goodsId}" style="display:block; overflow:hidden; height:20px; width:15%;">${order_goods.goodsTitle}</a></p>
        <p class="pt5 pb5">单价：<span class="sc">￥
          <label>${order_goods.price?string('0.00')}</label>
          </span></p>
        <p class="pt5 pb5">数量：<span class="sc">${order_goods.quantity!'0'}</span></p>
        <div class="clear"></div>
  </section>
  <div class="tuhuo"> 
    <ul>
      <li class="tuhuo_li1"><span></span>
        <input type="radio" name="isReturn"  value="f" />换货
        <input type="radio" name="isReturn"  value="t" />退货
      </li>
      <li class="tuhuo_li2"><span>联系电话：</span>
        <span class="wb">
            <input type="text" name="telephone" class="textInput" value="" datatype="m" errormsg="请输入正确的电话号码格式！" />
        </span>
      </li>
      <li class="tuhuo_li3"><span>退货说明：</span>
        <textarea rows="" cols="" name="reason" datatype="*5-128" errormsg="最少五个字符！"></textarea>
      </li>
    </ul>
  </form>  
    
  </div>
  <div class="ok_mainbox">
    <p><a href="javascript:subReturn();" id="sub">确 定</a></p>
  </div>
  
</div>
<!--main END-->
<#include "/touch/common_footer.ftl" />
</body>
</html>
