<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-注册</#if></title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/login.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
  searchTextClear(".logintext01","手机号/邮箱","#999","#333");
  searchTextClear(".logintext02","输入验证码","#999","#333");
  
  //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
});
</script>
</head>

<body style="background:#fff;">
<header class="l_comhead">
  <div class="main">
    <p>注册</p>
    <a class="a1" href="javascript:history.go(-1);">返回</a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="25" /></a>
  </div>
</header>
<div class="l_comhead_bg"></div>

<section class="loginbox">
  <div class="main">
  <form id="form1" method="post" action="/touch/reg">
    <div class="logintext">
        <input class="logintext01" name="mobile" type="text" datatype="m" placeholder="手机号" ajaxurl="/touch/reg/check/username" nullmsg="请输入手机号！" errormsg="手机号码格式不正确！"/>
    </div>
    <div class="logintext">
        <input class="logintext02" name="password" type="password" placeholder="请输入密码" datatype="s6-20"/>
    </div>
    <div class="logintext">
        <input class="logintext02" name="repassword" type="password" placeholder="请再次输入密码" datatype="*" recheck="password" nullmsg="请再次输入密码！" errormsg="两次输入的密码不一致！"/>
    </div>
    <div class="logintext logintext_y">
        <input type="text" class="logintext02" name="code" datatype="*" ajaxurl="/touch/reg/check/yzm"/ nullmsg="请输入验证码！" errormsg="验证码错误！">
    </div>
    <a href="javascript:;" class="login_yzm"><img onclick="this.src = '/code?date='+Math.random();" src="/code" /></a>
    <div class="clear"></div>
        <input type="submit" class="loginbtn" value="注册" />
    <p class="login_a">
     <a href="javascript:;"> 注册即表示您同意《用户协议》</a>
    </p>
    </form>
  </div>
  
</section>
<div class="clear h15"></div>
</body>
</html>
