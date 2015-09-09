<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>基本信息</title>
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
        <p>基本信息</p>
        <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
        <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  
    </div>
</header>

<div class="main">

  <div class="member_c" ><label>头像</label><span><img src="${user.headImageUri!''}"  height="80"/></span></div>
  <div class="member_check11" ><label>用户名</label><span>${user.username!''}</span></div>
  <div class="member_check" ><label>昵称</label><span>${user.nickname!''}</span></div>
  <div class="member_check member_check1"><label>性别</label><span>${user.sex!'保密'}</span></div>
  <div class="member_check " ><label>出生日期 </label>
    <#if user.birthday??>
        <span>${user.birthday?string("yyyy-MM-dd")}</span>
    <#else>
        <span></span>
    </#if>
  </div>
  <div class="member_check" ><label>联系电话 </label><span>${user.mobile!''}</span></div>
  <div class="member_check " ><label>邮箱</label><span>${user.email!''}</span></div>
  
  <div class="ok_mainbox">
    <a href="/touch/user/info"  id="sub"><p>修 改 信 息</p></a>
  </div>
</div><!--main END-->
<!--
<#include "/touch/common_footer.ftl" />
-->
</body>
</html>
