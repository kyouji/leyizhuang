<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/password_1.css"/>
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript">
<!--
$(document).ready(function(){
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
});
-->

function checkForm(){
    var oldPassword = document.getElementById("oldPassword").value;
    var newPassword = document.getElementById("newPassword").value;
    var rePassword = document.getElementById("rePassword").value;
    <#if user??>
        var userPassword = '${user.password}';
    <#else>
        alert("未知原因，修改未能成功！请稍后重试！");
    </#if>
    if(oldPassword != userPassword){
        alert("原密码输入错误！");
        return;
    }
    
    if(newPassword != rePassword){
        alert("两次输入的密码不一致!");
        return;
    }
    
    if(newPassword ==""||newPassword.length<6||newPassword.length>12){
        alert("请输入一个长度大于6小于12的新密码");
        return;
    }
    
    alert("修改成功！");
    
    document.getElementById("form1").submit();
}
</script>

</head>
<body>
    <#include "/client/common_header.ftl" />
    <!-- 内容 -->
    <div class="content"> 
        <!-- 左侧 -->
        <#include "/client/common_user_menu.ftl" />
        <!-- 右侧 -->
        <div class="content_2">
            <div class="content_2_2">
                <form id="form1" action="/user/password" method="POST">
                <div class="content_2_2_1"><span>原始密码：</span>
                    <input type="password" name="oldPassword" id="oldPassword" class="textInput" value="" />
                </div> 
                <div class="content_2_2_1"><span>新密码：</span>
                    <input type="password" name="newPassword" id="newPassword" class="textInput" value="" />
                </div> 
                <div class="content_2_2_1">
                    <span>再次输入密码：</span>
                    <input type="password" name="rePassword" id="rePassword" class="textInput" value="" />
                </div>
                <div class="content_2_2_1">
                    <input id="button1" type="button" onclick="checkForm();" value="提交" name="btnChange">
                </div>
                </form>
            </div>
        </div>
    </div>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
