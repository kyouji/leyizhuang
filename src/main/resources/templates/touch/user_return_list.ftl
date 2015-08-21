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
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/return_list.css"/>
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
      <div class="main">
      <p>退换货</p>
      <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
      <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  </div>
</header>
<div class="main">
      <div class="clear15"></div>
      <#if return_page??>
          <#list return_page.content as item>
               <section class="carlist"> 
                    <h2>订单编号&nbsp; ${item.orderNumber!''}</h2>
                    <div class="clear15"></div>
                    <b><a href="/touch/goods/${item.goodsId!'0'}"><img src="${item.goodsCoverImageUri!''}" /></a></b>
                    <p class="w"><a href="/touch/goods/${item.goodsId!'0'}">${item.goodsTitle!''}</a></p>
                    <p class="pt5 pb5" >单价：<span class="sc">￥<label>${item.goodsPrice?string('0.00')}</label></span></p>
                    <p class="pt5 pb5" >数量：<span class="sc">${item.returnNumber!''}</span></p>
                    <p class="pt5 pb5">退换时间：<span class="sc">${item.returnTime!''}</span></p>
                    <p class="pt5 pb">原因：<span class="sc">${item.reason!''}</span></p>
                    <div class="clear"></div>
                    <#if item.statusId?? && item.statusId==0><a class="a1" href="/touch/user/return/end">待审核</a></#if>
                    <#if item.statusId?? && item.statusId==1><a class="a2" href="/touch/user/return/end?cmd=已审核">已审核</a></#if>
               </section>
          </#list>
      </#if>
</div>
<!--main END-->
<#include "/touch/common_footer.ftl" />
</body>
</html>
