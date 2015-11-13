<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-登录</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/client/js/jquery.cookie.js"></script>

<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/client/css/content_l.css" />

<script type="text/javascript">
  $(document).ready(function(){
    loginBgChange("loginbg","li",7000);
    searchTextClear(".text01","用户名/邮箱/手机号","#999","#555");
    
    //记住密码
    if ($.cookie("rmbUser") == "true") { 
        $("#rmbUser").attr("checked", true); 
        $("#txt_loginId").val($.cookie("userName")); 
        $("#txt_loginPwd").val($.cookie("passWord")); 
    } 
});

 $(function(){
        $("#btn_login").click(function(){
            saveUserInfo();
            login();
        });
    });

    document.onkeydown = function(event){
        if((event.keyCode || event.which) == 13){
            saveUserInfo();
            login();
        }
    }
   
   function login(){
        var username = $("#txt_loginId").val();
        var password = $("#txt_loginPwd").val();
        
        if (username.length < 6 || password.length < 6)
        {
            alert("用户名或密码长度输入不足");
            return;
        }
        $.ajax({
            type: "post",
            url: "/login",
            data: { "username": username, "password": password },
            dataType: "json",
            success: function (data) { 
            <!-- 修改 -->
                if (data.role == 2){
                    window.location.href="/user/diysite/order/list/0";
                }    
                else if (data.code == 0) {
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
    }
    
    //保存用户信息 
function saveUserInfo() { 
    if (document.getElementById("rmbUser").checked==true) { 
        var userName = $("#txt_loginId").val(); 
        var passWord = $("#txt_loginPwd").val(); 
        $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie 
        $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie 
        $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie 
    } 
    else { 
        $.cookie("rmbUser", "false", { expires: -1 }); 
        $.cookie("userName", '', { expires: -1 }); 
        $.cookie("passWord", '', { expires: -1 }); 
    } 
}     
</script>
</head>

<body>

<header class="login_top">
  <div class="main">
    <a class="a1" href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a>
    <nav>
      <a href="/list/1">手机大全</a>
      <a href="/list/2">笔记本</a>
      <a href="/list/3">配件中心</a>
    <!--  <a href="">会员专享</a> -->
      <a href="/shop/list">门店</a>
    </nav>
  </div>
</header>

<section class="loginmain">
  <ul id="loginbg">
    <li><img src="/client/images/photo/banner02.png" /></li>
    <li><img src="/client/images/photo/banner03.png" /></li>
    <li><img src="/client/images/photo/banner04.jpg" /></li>
  </ul>
  <div class="main">
    <section class="loginbox">
      <h3 class="fw400 pb20">
        <span class="ml20 fs20 red">用户登录</span>
        <a class="unl fs14 ml100" href="javascript:void(0);" onclick="$('#register').fadeIn(300);">注册新账号</a>
      </h3>
      
      <div class="login_dl">
        <i><img src="/client/images/member/login_arrow.png" height="11" /></i>
        <p class="p1"><input onfocus="$(this).parent().css({'box-shadow':'1px 1px 2px 2px #fdebb2','border':'1px solid #eee'})" onblur="$(this).parent().css({'box-shadow':'none','border':'1px solid #d5dbdb'})" class="text text01" id="txt_loginId" type="text" value="" /></p>
        <p class="p1 p2"><input class="text" onfocus="$(this).parent().css({'box-shadow':'1px 1px 2px 2px #fdebb2','border':'1px solid #eee'})" onblur="$(this).parent().css({'box-shadow':'none','border':'1px solid #d5dbdb'})" id="txt_loginPwd" type="password" /></p>
        <p class="p3">
          <input type="checkbox" id="rmbUser"/>
          <span>记住密码</span>
          <a href="#">忘记密码？</a>
        </p>
        <div class="login_more">
          <input class="sub fr" type="submit" id="btn_login" value="登 录" />
          <div class="clear"></div>
          <p class="pt20">
            <span class="fl">其他登录方式</span>
            <a href="#"><img src="/client/images/member/login03.png" /></a>
            <a href="#"><img src="/client/images/member/login04.png" /></a>
            <a href="#"><img style="top:7px;" src="/client/images/member/login05.png" /></a>
          </p>
          <div class="clear"></div>
        </div>
      </div><!--login_dl END-->
      
    </section><!--loginbox END-->
  </div>
</section>

<footer class="mainfoot">
  <section class="main">
    <nav>

      <a href="#">关于我们</a>|
      <a href="#">团队介绍</a>|
      <a href="#">高薪诚聘</a>|
      <a href="#">业务合作</a>|
      <a href="#">会员积分</a>|
      <a href="#">投诉建议</a>|
      <a href="#">友情链接</a>
    </nav>
    <p class="c9 w100">
      <#if site??>${site.copyright!''}</#if> 
              <br />
        ${site.address!''} 电话：${site.telephone!''}
      
    </p>
    <span><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a><a>技术支持：</a><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
  </section>
</footer><!--mainfoot END-->

<#include "/client/regwindow.ftl">
<!--winbox END-->

</body>
</html>
