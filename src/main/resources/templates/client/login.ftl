<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-登录</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<script src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/log_in.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(function(){
        $("#btn_login").click(function(){
            login();
        });
    });

    document.onkeydown = function(event){
        if((event.keyCode || event.which) == 13){
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
            url: "login",
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
</script>

</head>
<body>
<!--顶部-->

    <div class="top_all">
    	<div class="top">
        	<div class="top_left">    
            	<div class="top_left_welcome">欢迎光临正品惠客</div>
                <a href="/login" title="请登录" >请登录</a>
                <a href="/reg" title="免费注册" >免费注册</a>
            </div>
            <div class="top_right">
            	<a href="/user" title="我的惠客">我的惠客</a>
                <a class="top_right_my_collection" href="/user/collect/list" title="我的收藏">我的收藏</a>
                <a class="top_right_hk" href="/user" title="手机惠客">手机惠客</a>
            </div>
        </div>
    </div>	
    <!--头部-->
    <div class="header">
    	<!--logo大小：190 58-->
    	<div class="header_logo">
        	<img src="<#if site??>${site.logoUri!''}</#if>" />
        </div>
        <div class="user_registration">用户登录</div>
    </div>
    
    <!--注册内容-->
    <div class="register_content">
    	<div class="content">
            <div class="input_information phone_number">
            	&nbsp;&nbsp;&nbsp;用户名：
            	<input id="txt_loginId" class="text" type="text"/>
            </div>
            <div class="input_information password">
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：
            	<input id="txt_loginPwd" class="text" type="password" />
            </div>
            <div class="agree">
            	<a class="btn" href="javascript:;" id="btn_login">登录</a>
            </div>
            <div class="remeber">
                <input name="" type="checkbox" value="" />&nbsp;&nbsp;记住用户名
                <a class="forget" href="#">忘记密码</a>
                <a>丨</a>
                <a href="/reg">立即注册</a>
            </div>
            <!--
            <div class="agree_1">您还可以使用以下正品惠客合作伙伴登录：</div>
            <div class="agree_2">
                <a href="#"><img src="/client/images/weixin.png" /></a>
                <a href="#"><img src="/client/images/qq.png" /></a>
                <a href="#"><img src="/client/images/weibo.png" /></a>
                <a href="#"><img src="/client/images/zhifubao.png" /></a>
            </div>
            -->
        </div>
    </div>
    
    <!--底部-->
    <div class="register_footer">
    	<div class="top_footer">
        	<#if help_level0_cat_list??>
                <#list help_level0_cat_list as item>
                    <a href="/info/list/${item.id!''}">${item.title!''}</a>
                </#list>
            </#if>
        </div>
        <div class="bottom_footer" style="text-align:center">
        	<span>友情链接：</span>
            <#if site_link_list??>
                <#list site_link_list as item>
                    |&emsp;&emsp;<a href="${item.linkUri!''}">${item.title!''}</a> 
                </#list>
            </#if>
            <br />
            <span> ${site.copyright!''}</span>
        </div>
    </div>
</body>
</html>
