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
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
  $(document).ready(function(){
    
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3,
        ajaxPost:true,
        callback: function(data) {
            if (data.code==0)
            {
                alert("提交评论成功");
                window.location.reload();
            }
            else
            {
                alert(data.message);
            }
        }
    });
});

</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>订单详细</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a></div>
  </div>
</header>

<div class="main">
  <div class="clear20"></div>
  <h2 class="myorder_tit">订单编号:${order.orderNumber!''}<span><#if order.checkTime??>${order.checkTime}</#if></span></h2>
  <p class="myorder_text"><span>收货人：</span>${order.shippingName!''}</p>
  <p class="myorder_text"><span>联系方式：</span>${order.shippingPhone!''}</p>
  <p class="myorder_text"><span>收货地址：</span>${order.shippingAddress!''}</p>
  
  <#if order.orderGoodsList?? && order.orderGoodsList?size gt 0>
        <#list order.orderGoodsList as og>
            <div class="myorder_list">
                <a class="a1 a0" href="/touch/goods/${og.goodsId}">
                  <span class="sp1"><img src="${og.goodsCoverImageUri!''}"  width="90px;"/></span>
                  <p class="mb10">${og.goodsTitle!''}</p>
                  <p>单价：<span class="sc">￥${og.price?string('0.00')}</span>&nbsp;&nbsp;数量：${og.quantity}</p></a> 
                  <div class="clear"></div>
                
                 <a class="a2" href="/touch/user/return/${order.id?c}?goodsId=${og.id?c}">换货/换货</a>
             </div>
             <#if order.statusId==5 && !og.isCommented>
                 <div id="order_comment">
                    <form action="/touch/user/comment/add" method="post" id="form1">
                         <input type="hidden" name="orderId" value=${order.id?c} />
                         <input type="hidden" name="ogId" value=${og.id} />
                         <input type="hidden" name="goodsId" value=${og.goodsId} />
                        <textarea class="myorder_area" name="content" datatype="*5-255" nullmsg="请输入内容"></textarea>
                        <input class="myorder_sub" type="submit" value="提交评论" />
                    </form>
                 </div>
             </#if>
        </#list>
  </#if>
  
  <div class="clear10"></div>
  
  <#if order.statusId == 2>
       <a class="blue_more" href="/order/dopay/${order.id?c}">前往付款</a>
  </#if>
  <#if order.statusId == 4>
       <a class="blue_more" href="/touch//user/order/confirmed?id=${order.id?c}">确认收货</a>
  </#if>
  
  
</div><!--main END-->


<#include "/touch/common_footer.ftl" />
</body>
</html>
