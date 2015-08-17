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
<link href="/touch/css/login.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/common.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
    searchTextClear(".logintext01","手机号/邮箱","#999","#333");
    searchTextClear(".logintext02","输入密码","#999","#333");
    
    $("#btn_login").click(function(){
        var username = $("#txt_loginId").val();
        var password = $("#txt_loginPwd").val();
        
        if (username.length < 6 || password.length < 6)
        {
            alert("用户名或密码长度输入不足");
            return;
        }
        
        $.ajax({
                type: "post",
                url: "login",
                data: { "username": username, "password": password },
                dataType: "json",
                success: function (data) {
                    if (data.code == 0) {
                        var url = document.referrer;
                        if(undefined==url || ""==url){
                            window.location.href="/";
                        }else{
                            window.location.href = url; 
                        }
                    } else {
                        alert(data.msg);
                    }
                }
            });
    });
});
</script>
</head>

<body style="background:#fff;">
<header class="l_comhead">
  <div class="main">
    <p>登录</p>
    <a class="a1" href="javascript:history.go(-1);">返回</a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="25" /></a>
  </div>
</header>

<div class="l_comhead_bg" ></div>



<section class="loginbox">
  <div class="main">
    <div class="logintext">
    <input type="text" class="logintext01" value="" id="txt_loginId"/>
    </div>
    <div class="logintext logintext_p">
    <input type="text" class="logintext02" value="" id="txt_loginPwd"/>
    </div>
    <input type="submit" class="loginbtn" value="登录" id="btn_login"/>
    <p class="login_a">
      <a href="javascript:;">找回密码</a>
      <a class="a1" href="/touch/reg">注册</a>
    </p>
  </div>
  <!--
  <div class="otherlogin">
    <p class="ta-c fs10 pb20"><span>第三方账号登录</span></p>
    <a href="#"><img src="images/login01.png" height="40" /><span>支付宝</span></a>
    <a href="#"><img src="images/login02.png" height="40" /><span>微信</span></a>
    <a href="#"><img src="images/login03.png" height="40" /><span>腾讯QQ</span></a>
  </div>
  -->
</section>

<div class="clear h15"></div>
<section class="botlogin">
  <#if username??>
  <a href="/touch/user">${username!''}</a>
  <a class="ml20" href="/touch/logout">退出</a>
  <#else>
  <a href="/touch/login">登录</a><a class="ml20" href="/touch/reg">注册</a>
  </#if>
  <a class="a1" href="javascript:$('html,body').animate({scrollTop:0},500);">TOP</a>
</section>
<footer class="comfoot main">
    <a href="/">电脑版</a>
    <a href="/touch">触屏版</a>
</footer>
<p class="bottext mainbox">${site.copyright!''}</p>
<p class="bottext mainbox">${site.icpNumber!''}</p>
</body>
</html>
