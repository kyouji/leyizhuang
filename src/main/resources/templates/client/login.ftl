<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——登陆</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<script type="text/javascript" src="/client/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/html5.js"></script>
<script type="text/javascript">
$(function () {
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
    
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
<body>
<div class="w100 bor_bot1 fl">
<div id="main">
        <div class="logo fl mt10">
            <a href="/" title="博大生活网"><img src="/client/images/login/login_logo.png" width="261" height="81" /></a></div>
        
      <div class="fr mt20">
           <dd class="login_top">您好，欢迎光临博大生活网！ &nbsp;&nbsp;&nbsp;<a href="/login">请登录</a><a href="/info/list/12" class="help">帮助中心？</a></dd>
      </div>
</div> 
</div>
<!--header结束-->
<article class="bg fl">
<div id="middle" class="page">
        <div id="loginBox">
            <div id="loginBox_inner">
                <h2>会员登录</h2> <dt>还没有博大帐号？<a href="/reg">立即注册</a></dt>
                <form id="form1" method="post" action="/login">
                <table>
                    <tbody><tr>
                        <td class="lbl">用户名</td>
                        <td>
                            <span class="Validform_checktip" style="float:right; padding-right:40px; font-weight:normal; color:#d00000"></span>
                            <input id="txt_loginId" type="text" value="" errormsg="用户名为6-20位字符" datatype="s6-20">
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">密　码</td>
                        <td>
                            <span class="Validform_checktip" style="float:right; padding-right:40px; font-weight:normal; color:#d00000"></span>
                            <input id="txt_loginPwd" type="password" value="" errormsg="密码最少为6位" datatype="*6-20">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <span id="btn_login">登 录</span>
                            <a id="btn_getPwd" href="javascript:;">忘记密码？</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <#--
                        <td>
                        <dd>您也可以使用以下合作帐号进行登录本站</dd>
                        <p class="wb_wx">
						<a href="#"><img src="images/login/qq.png"/></a>	
						<a href="#"><img src="images/login/wb.png"/></a>	
						<a href="#"><img src="images/login/zfb.png"/></a>	
						<a href="#"><img src="images/login/wx.png"/></a>	
                        </p>
                        </td>
                        -->
                    </tr>
                </tbody></table>
                </form>
            </div>
        </div>
    </div>
    <div class="clear"></div>
<!--主体结束-->
<div id="main">
<div class="foot_login fl mt20">滇ICP备13044278号|合字B1.B2-20130004|营业执照</br>
Copyright © 博大生活网 2015-2018 All Rights Reserved </div>
</div>
</article>
</body>
</html>
