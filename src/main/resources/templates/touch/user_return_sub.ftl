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
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/return.css">
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
    <div class="main">
        <p>退/换货</p>
        <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
        <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  
    </div>
</header>

<div class="main">
  
  <div class="member_check">
     <ul>
       <li>提交成功！！！</li>
	   <li>等待商家处理申请</li>
	   <li class="li_1">如果商家同意，退货申请将达成需要您退货给商家</li>
	   <li class="li_1">如果商家拒绝，将需要您修改退货申请</li>
	   <li>点击返回<a href="/touch/user">个人中心</a></li>
	 </ul>
  </div>
  
</div><!--main END-->

<#include "/touch/common_footer.ftl" />
</body>
</html>