<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>车有同盟</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>

<link href="/client/style/common.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });

});
</script>
</head>

<body>
<header class="logintop">
  <div class="main pt20">
    <a class="fl" href="/"><img src="/client/images/liebiao_03.png" /></a>
    <p class="p3">售后保障</p>
    <p class="p2">100%品牌制造商</p>
    <p class="p1">100%正品保障</p>
    <div class="clear"></div>
  </div>
</header>
<div class="logingbg">
    <section class="loginbox">
        <span style="color: #F00">${error!''}</span>
        <form id="form1" method="post" action="/reg">
            <div>
                <p>请输入用户名/邮箱/车牌号码</p>
                <input class="text" name="username" type="text" datatype="s6-20"/>
            </div>
            <div>
                <p>请输入车牌号码（选填）</p>
                <input class="text" name="carCode" type="text" />
            </div>
            <div>
                <p>请输入密码</p>
                <input class="text" name="password" type="password" datatype="s6-20"/>
            </div>
            <div>
                <p>请确认密码</p>
                <input class="text" type="password" recheck="password"/>
            </div>
            <div>
                <p>请输入验证码</p>
                <div class="clear"></div>
                <input class="text fl" name="code" type="text" style="width:35%;" datatype="s4-4" errormsg="请填写4位字符"/>
                <img src="/code" onclick="this.src = '/code?date='+Math.random();" id="yzm" height="37"/>
            </div>
            <div class="clear h15"></div>
            <p class="pb10">
                <input type="checkbox" name="" value="1" datatype="*"/>
                <span>我已阅读并同意<a href="javascript:;">《车友同盟用户协议》</a></span>
                <span class="absolute-r">已有账号？<a href="/login">点击登录</a></span>
            </p>
            <input type="submit" class="sub" value="注册" />
        </form>
        <div class="clear h15"></div>
    </section>
</div><!--logingbg END-->

<footer class="loginfoot">
    <nav>
        <#if help_level0_cat_list??>
            <#list help_level0_cat_list as item>
                <a href="/info/list/${item.id!''}">${item.title!''}</a>
            </#list>
        </#if>
    </nav>
    <p>友情链接：
        <#if site_link_list??>
            <#list site_link_list as item>
                <a href="${item.linkUri!''}">${item.title!''}</a> |
            </#list>
        </#if>
    </p>
    <p>${site.copyright!''}</p>
    <p>${site.address!''} 电话：${site.telephone!''} </p>
    <p><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a>技术支持：<a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></p>
</footer>
</body>
</html>
