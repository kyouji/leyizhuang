<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>设置</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/information.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>设置</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  </div>
</header>

<div class="main">
<div class="clear15"></div>
    <#if setting??>
      <div class="member_check" ><label>网站名称：${setting.title!''}</label></div>
      <div class="member_check" ><label>公司名称：${setting.company!''}</label></div>
      <div class="member_check " ><label>公司地址：${setting.address!''}</label></div>
      <div class="member_check" ><label>客服热线：${setting.telephone!''}</label></div>
      <div class="member_check" ><label>传真号码：${setting.fex!''}</label></div>
      <div class="member_check" ><label>服务QQ：${setting.qq!''}</label></div>
    </#if>
</div><!--main END-->

<#include "/touch/common_footer.ftl" />
</body>
</html>
