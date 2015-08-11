<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-注册</title>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/client/js/regist.js"></script>
<script>
$(document).ready(function(){
	$("#regist_form").Validform({
	 	tiptype: 3
	 });
});
</script>
</head>
<body>
<!--顶部-->
<div class="top_all">
	<div class="top">
    	<div class="top_left">    
        	<div class="top_left_welcome">欢迎光临正品惠客</div>
            <a href="#" title="" >请登录</a>
            <a href="#" title="" >免费注册</a>
        </div>
        <div class="top_right">
        	<a href="#" title="">我的惠客</a>
            <a class="top_right_my_collection" href="#" title="">我的收藏</a>
            <a class="top_right_hk" href="#" title="">手机惠客</a>
        </div>
    </div>
</div>	
<!--头部-->
<div class="header">
	<!--logo大小：190 58-->
	<div class="header_logo">
    	<img src="/client/images/logo_1.png" />
    </div>
    <div class="user_registration">用户注册</div>
</div>

<!--注册内容-->
<div class="register_content">
	<div class="content">
		<form id="regist_form" action="/reg" method="post">
	    	<ul class="register_mode">
	    		<#if type??&&type=="email">
		        	<li>
		            	<input name="regist_method" type="radio" value="phone" onclick="phoneMethod()"/>手机注册
		            </li>
		            <li>
		            	<input name="regist_method" type="radio" value="email" onclick="emailMethod()" checked="checked"/>邮箱注册
		            </li>
	            <#else>
		            <li>
		            	<input name="regist_method" type="radio" value="phone" onclick="phoneMethod()" checked="checked"/>手机注册
		            </li>
		            <li>
		            	<input name="regist_method" type="radio" value="email" onclick="emailMethod()"/>邮箱注册
		            </li>
	            </#if>
	        </ul>
        	<#if type??&&type=="email">
	        	<div class="input_information phone_number">
					用户邮箱：
					<input name="email" datatype="e" ajaxurl="/reg/check/email" value="请输入您的邮箱" />
		        </div>
        	<#else>
	        	<div class="input_information phone_number">
					手机号码：
					<input name="mobile" datatype="m" ajaxurl="/reg/check/mobile" value="请输入您的手机号" />
		        </div>
        	</#if>
	        <div class="input_information password">
				用户密码：
				<input name="password" type="password" datatype="*6-12" value="请输入6-12位密码" />
	        </div>
	        <div class="input_information repeat_password">
				重复密码：
				<input name="repassword" type="password" datatype="*6-12" recheck="password" value="请重复输入密码" />
	        </div>
	        <div class="input_information security_code">
	        	&nbsp;&nbsp;&nbsp;验证码：
		        <input name="yzm" type="text" datatype="s4-4" errormsg="请填写4位字符！" value="见右图" />
		        <img id="yzm_image" src="/client/images/security_code.png" />
		        <a href="javascript:changeYzm()" class="another">看不清，换一张？</a>
	        </div>
        </form>
        <div class="agree">
        	<a class="btn" href="javascript:submitRegistForm()">同意协议并注册</a>
            <a href="#">《正品惠客协议》</a>
        </div>
        <div class="agree_1">
           	 已经注册，马上
            <a href="#">登录</a>
        </div>
    </div>
</div>

<!--底部-->
<div class="register_footer">
	<div class="top_footer">
    	<a href="#">关于我们</a>
        <a class="shu">丨</a>
        <a href="#">特色服务</a>
        <a class="shu">丨</a>
        <a href="#">支付方式</a>
        <a class="shu">丨</a>
        <a href="#">配送方式</a>
        <a class="shu">丨</a>
        <a href="#">售后服务</a>
        <a class="shu">丨</a>
        <a href="#">帮助中心</a>
    </div>
    <div class="bottom_footer">
    	<span>友情链接：</span>
        <a href="#">曲靖信息港</a>
        <a href="#">宝善街网</a>
        <span>Copyright©2006-2014 All Rights Reserved 丫丫网 版权所有 滇ICP备07004173号 </span>
    </div>
</div>
</body>
</html>
