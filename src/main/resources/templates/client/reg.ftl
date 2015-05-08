<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——用户注册</title>
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
});
</script>
</head>
<body>
<div class="w100 bor_bot1 fl">
<div id="main">
        <div class="logo fl mt10"><a href="/" title="博大生活网"><img src="/client/images/login/login_logo.png" width="261" height="81" /></a></div>
        
      <div class="fr mt20">
           <dd class="login_top">您好，欢迎光临博大生活网！ &nbsp;&nbsp;&nbsp;<a href="/login">请登录</a><a href="/info/list/12" class="help">帮助中心？</a></dd>
      </div>
</div> 
</div>
<!--header结束-->
<article class="bg fl">
<div id="main">
    <div id="regBox">
        <div id="regBox_Top">
            <div id="regBox_Top_Right">
                <span>我已经是会员</span>
                <a href="/login">立即登录</a>
            </div>
            <h2>新会员注册</h2>
            <dd>注册成为【博大生活网】Fans Member</br> 
                注册成功即可获赠100积分。</dd>
        </div>
        <div id="regBox_Content">
            <form id="form1" method="post" action="/reg">
            <table align="center">
                <tbody>
                <tr>
                    <td class="lbl"><b>*</b>用户名：</td>
                    <td>
                        <input type="hidden" name="shareId" value="${share_id!''}" />
                        <input name="username" type="text" class="in1" maxlength="20" datatype="s6-20" errormsg="用户名由字母、数字、下划线组成，最少6位，最多20位">
                        <span class="Validform_checktip"><#if errCode?? && errCode==2>${error!''}</#if></span>
                    </td>
                </tr>
                <tr>
                    <td class="lbl"><b>*</b>设置密码：</td>
                    <td>
                        <input name="password" type="password" class="in2" maxlength="20" datatype="s6-20">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td class="lbl"><b>*</b>确认密码：</td>
                    <td>
                        <input type="password" class="in3" datatype="*" recheck="password">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td class="lbl"><b>*</b>手机号码：</td>
                    <td>
                        <input name="mobile" type="text" class="in4" datatype="m">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">电子邮箱：</td>
                    <td>
                        <input name="email" type="text" class="in5" datatype="*0|e">
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">验证码：</td>
                    <td>
                        <input name="code" type="text" class="input" datatype="s4-4" errormsg="请填写4位字符">
                        <img onclick="this.src = '/code?date='+Math.random();" src="/code" width="80" height="30" class="yzm" />
                        <dd class="no_zy Validform_checktip" ><#if errCode?? && errCode==1>${error!''}<#else>点击图片切换下一张</#if></dd>
                    </td>
                </tr>
                <tr>
                	<td></td>
                    <td><dd class="red_que">点击注册，则表示您同意博大生活网<b>《服务协议》</b></dd></td>
                    <td></td>
                </tr>
                <tr>
                	<td></td>
                    <td><dd class="red_que"><input type="submit" value="立即注册" class="red_lj"></td>
                    <td></td>
                </tr>

            </tbody>
            </table>
            </form>
        </div>
    </div>
</div>
<!--主体结束-->
<div id="main">
<div class="foot_login fl mt20">滇ICP备13044278号|合字B1.B2-20130004|营业执照</br>
Copyright © 博大生活网 2015-2018 All Rights Reserved </div>
</div>
</article>
</body>
</html>
