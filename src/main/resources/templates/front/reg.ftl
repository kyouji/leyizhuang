<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--注册</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Tm/css/manhuaTip1.1.0.css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/util.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/front/reg.js"></script>
</head>
<body style="background:#eee;">
<div class="logo2">
  <h1><a href="/reg" title="荣诚手机超市">荣诚手机超市-注册</a></h1>
</div>
<div class="loginbox"> <img src="images/logingg.png" style="margin-top:65px;" />
  <div class="login_r" style="height:450px">
    <input type="text" class="login_txt1" id="name" autofocus="autofocus" maxlength="20" placeholder="请输入用户名"/>
    <input type="text" class="login_txt3" id="phone" maxlength="11" placeholder="请输入手机号码" />
    <input type="password" class="login_txt2" id="password" maxlength="20" placeholder="请输入密码,8-16位, 允许数字、大小写英文字母、下划线以及常用英文符号"/>
    <input type="password" class="login_txt2" id="newpassword" maxlength="20" placeholder="请再次输入密码"/>
    <input type="text" class="login_txt2" id="verif" style="width:170px; float:left" maxlength="4" placeholder="请输入验证码"/>
    <a href="javascript:void(0)"><img onclick="this.src = '/verify?date='+Math.random();" src="/verify" id="yzm"/></a>&nbsp;&nbsp;
    <div class="clear"></div>
    <p>
      <label>
        <input name="" type="checkbox" value="" checked="true"/>
        &nbsp;我已认真阅读并同意</label>
      &nbsp;<b class="wj"><a href="javascript:void(0)">《荣诚手机用户协议》</a></b></p>
    <input type="button" class="login_btn" value="立即注册"   onclick="tm_reg(this)"/>
  </div>
</div>
<div class="bottom2">
<p>©2014 荣诚手机超市&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">www.rcsj.com </a>  &nbsp;&nbsp;&nbsp;&nbsp; 滇ICP证8888888号  587 号 <a href="http://www.ynyes.com" target="_blank" title="云南网站建设">网站建设</a>技术支持：<a href="http://www.ynyes.com" target="_blank" title="云南网站建设">昆明天度网络公司</a></p>
</div>
<script type="text/javascript">$(document).keydown(function(e){if(e.keyCode == 13){tm_reg(this)}})</script
</body>
</html>