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
<link rel="stylesheet" type="text/css" href="/touch/css/evaluate.css"/>
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>我的评价</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  
  </div>
</header>

<div class="main">
  <div class="clear20"></div>
 
  <#if comment_page??>
       <#list comment_page.content as item>
            <div class="myorder_list">
                <a class="a1 a0" href="/touch/goods/${item.goodsId}">
                  <span class="sp1"><img src="${item.goodsCoverImageUri!''}" /></span>
                  <p class="mb10">${item.goodsTitle!''}</p>
                  <p class="p1">订单号：<span>${item.orderNUmber!''}</span></p>
                  <div class="clear"></div>
                </a>
                <textarea class="myorder_area_2" readonly="true">${item.content!''}</textarea>
               
             </div>
       </#list>
  </#if>
  
</div>

<#include "/touch/common_footer.ftl" />
</body>
</html>
