<!doctype html>
<html>
	<title>荣诚手机超市--登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="keywords" content="荣诚手机超市" />
	<meta name="description" content="荣诚手机超市" />
	<meta name="copyright" content="荣诚手机超市 版权所有" />
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="Tm/css/manhuaTip1.1.0.css" />
	<script async type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
	<script async type="text/javascript" src="/Tm/js/mainTip.js"></script>
	<script async type="text/javascript" src="/Tm/js/util.js"></script>
	<script async type="text/javascript" src="/Tm/js/front/login.js"></script>
</head>
<body style="background:#eee;">
<div class="logo2">
  <h1><a href="login" title="荣诚手机超市">荣诚手机超市-登录</a></h1>
</div>
<div class="loginbox"> <img src="/images/logingg.png" />
  <div class="login_r"> 
    <input type="text" class="login_txt2" id="name" autofocus="autofocus" maxlength="20" placeholder="请输入用户名"/>
    <!--<span>请输入密码</span>-->
    <input type="password" class="login_txt2" id="password" maxlength="20" placeholder="请输入密码"/>
     <span></span>
    <div id="verifs" style="">
    <input type="text" class="login_txt2" id="verif" style="width:170px; float:left" maxlength="4" placeholder="请输入验证码" />
    <a href="javascript:void(0)"><img onclick="this.src = '/verify?date='+Math.random();" src="/verify" id="yzm"/></a><!--&nbsp;&nbsp;<a href="#" style="line-height:40px">看不清楚？换一张</a>-->
   	</div>
    <div class="clear"></div>
    <p>
      <label>
        <input name="" type="checkbox" value="" />
        &nbsp;自动登录</label>
      &nbsp;&nbsp;<b class="wj"><a href="/forget">忘记密码？</a></b></p>
    <p class="mt5">还不是会员？<b class="zc"><a href="/reg">免费注册</a></b></p>
    <input type="button" class="login_btn" value="立即登录" onclick="tm_register(this)"/>
    
    <span class="fll kszc">合作登录：</span> <div class="qq1 fll mt10 ml10"><a href="#" title="QQ"></a></div><div class="xinlang fll mt10 ml10"><a href="#" title="新浪"></a></div><div class="zhifubao fll mt10 ml10"><a href="#" title="支付宝"></a></div>

  </div>
</div>

<div class="bottom2">
<p>©2014 荣诚手机超市&nbsp;&nbsp;&nbsp;&nbsp;<a href="/">www.rcsj.com </a>  &nbsp;&nbsp;&nbsp;&nbsp; 滇ICP证8888888号  587 号 <a href="http://www.ynyes.com" target="_blank" title="云南网站建设">网站建设</a>技术支持：<a href="http://www.ynyes.com" target="_blank" title="云南网站建设">昆明天度网络公司</a></p>
</div>
<!--js-->
<script type="text/javascript">$(document).keydown(function(e){if(e.keyCode == 13){tm_register(this)}})</script>
</body>
</html>