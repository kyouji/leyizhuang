<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>修改密码</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/modify.css"/>
<link href="/touch/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
    
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
});

function subPassword(){
     $("#form1").submit();
};
</script>

</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>修改密码</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
</header>
<div class="main">
<form id="form1" action="/touch/user/password" method="post"> 
  <input name="__STATE" type="hidden" value="${user.password}"/>
  <div class="member_ch"><p>旧密码</p>
        <input name="oldPassword" type="password"  class="textInput" value=""  datatype="*" errormsg="原始密码不正确" recheck="__STATE"/>
       <br> <span class="Validform_checktip"></span>
  </div>
  <div class="member_ch"><p>新密码</p>
        <input name="newPassword" type="password"  class="textInput" value="" datatype="*6-18"/>
        <br><span class="Validform_checktip"></span>
  </div>
  <div class="member_ch"><p>确认密码</p>
        <input type="password"  class="textInput" value="" datatype="*" recheck="newPassword" />
        <br><span class="Validform_checktip"></span>
  </div>
  <div class="ok_mainbox">
    <p><a href="javascript:subPassword();"  id="sub">确 定</a></p>
  </div>
</form>
</div><!--main END-->

<#include "/touch/common_footer.ftl" />
</body>
</html>
