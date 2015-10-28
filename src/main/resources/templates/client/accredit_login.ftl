<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车有同盟</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<link href="/client/style/common.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css" />
<style>
.righta{float:right;}
.lefta{float:left;}
.contenta{ padding:20px 0; padding:20px; background:#fff; border-radius:5px; width:70%; margin-left:20%;}
.contenta h3{ font-size:18px; color:#999;font-family: 'Microsoft YaHei'; padding:20px 0; height:20px;}
.contenta button{ padding:10px 15px; border:0; background:#ff4454; color:#fff}
.contenta i{ width:5px; height:20px; display:inline-block; background:#ff4454; margin-right:10px; vertical-align:middle}
.contenta .lefta{ line-height:45px;}
.contenta .lefta input{ height:25px; border:1px solid #ececec; padding:2px 5px; width:150px; line-height:25px;}
.contenta .lefta span{ width:100px; text-align:right; display:inline-block}
.contenta .lefta button{ margin-left:100px;border-radius:3px;}
.contenta .righta{ border-left:1px solid #ececec; padding:10px 30px;}
.contenta .righta p{ color:#BDBABA; padding:20px 0}
.contenta .righta button{ margin-left:130px; width:200px; margin-top:15px; border-radius:3px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
    //searchTextClear(".text01","用户名/邮箱/手机号","#999","#555");  
});
function otherlogin(){    
    window.location.href = "/login/alipay_accredit/<#if qq??>${qq}<#else>zfb</#if>?useralipay_username=${alipay_user_id!''}";
} 
   
function cliLogin(){
        var username = $("#txtUser").val();
        var password = $("#Userpwd").val();      
        <#if qq??>
             var type = "qq";
        <#else>
             var type = "zfb";
        </#if>
        var alipayuser_id = $("#alipayuser_id").val();
        $.ajax({
                type: "post",
                url: "/login",               
                data: {"username": username, "password": password, "alipayuser_id": alipayuser_id, "type": type},
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
<div class="main">
    <!--QQ登录显示用户在Qzone的昵称-->
    <input type="hidden" name="mouseposY" <#if nickName??>id="qquser_id"<#else>id="alipayuser_id"</#if> value="${alipay_user_id!''}">
<div class="contenta">
            <div class="lefta">
                <h3><i style="background-color:#b61d1d;"></i>绑定已有账号</h3>
               <span> 用户名：</span><input type="text" id="txtUser"><br>
                <span>密码：</span><input type="password" id="Userpwd"><br>
                <button onclick="cliLogin()" style="background-color:#b61d1d;">确定绑定</button>
            </div>
            <div class="righta">
               <h3><i style="background-color:#b61d1d;"></i>授权登陆并绑定</h3>
                <button onclick="otherlogin()" style="background-color:#b61d1d;">授权登陆并绑定</button> 
                <p>
                    <b>说明：</b>【授权登陆并绑定】会自动帮您创建一个账户，账户名按照固定格式生成
                    

                </p>
            </div>
            <div class="clear"></div>
       </div><!--logingbg END-->
</div>
<div align="center">
<#include "/client/common_footer.ftl">
</div>
</body>
</html>
