<!doctype html>
<html>
	<title>荣诚手机超市</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="keywords" content="荣诚手机超市" />
	<meta name="description" content="荣诚手机超市" />
	<meta name="copyright" content="荣诚手机超市 版权所有" />
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		#nav{font-size:26px;font-family:微软雅黑;color:#666;padding-top:20px}
		#count{font-size:30px;color:red}
	</style>
	<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
	
</head>
<body style="background:#eee;">
<div class="logo2">
  <h1><a href="login" title="荣诚手机超市">荣诚手机超市</a></h1>
</div>
<div class="loginbox"> <img src="/images/logingg.png" />
  	<div id="nav">注册成功！继续去完善资料>><b id="count">5</b></div>
</div>

<div class="bottom2">
<p>©2014 荣诚手机超市&nbsp;&nbsp;&nbsp;&nbsp;<a href="/">www.rcsj.com </a>  &nbsp;&nbsp;&nbsp;&nbsp; 滇ICP证8888888号  587 号 <a href="http://www.ynyes.com" target="_blank" title="云南网站建设">网站建设</a>技术支持：<a href="http://www.ynyes.com" target="_blank" title="云南网站建设">昆明天度网络公司</a></p>
</div>
<!--js-->
	<script type="text/javascript">
    	var count = 5;
	  	window.onload = function(){
	  		setInterval(function(){
	  			count--;
	  			if(count<=0)window.location.href = "/user/info";
	  			document.getElementById("count").innerHTML = "<b>"+count+"</b>";
	  		},1000);
	  	};
   	</script>
</body>
</html>