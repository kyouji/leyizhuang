<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>修改昵称</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/modify.css"/>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>修改昵称</p>
    <a class="a1" href="#"><img src="images/back.png" height="22" /></a>
    <a class="a2" href="#">确定</a>  </div>
</header>

<div class="main">

    <div class="member_check"  ><input type="text" name="nickname"  class="textInput" value="" /><p>4-20个字符，可由中英文、数字、"_"、"-"组成</p></div>
  
    <div class="member_check"  ><input type="text" name="email"  class="textInput" value="" /><p>填写常用的邮箱</p></div>

    <div class="member_1"  ><input type="radio" name="sex"  value="rd1" />男</div>
    <div class="member_1"  ><input type="radio" name="sex"  value="rd2"  />女</div>
    <div class="member_1 member_m" ><input type="radio" name="sex"  value="rd3" />保密</div>
</div><!--main END-->


</body>
</html>
