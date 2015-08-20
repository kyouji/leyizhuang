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


<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function(){
    /**
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    navDownList("navdown","li",".nav_showbox");
    menuDownList("mainnavdown","#navdown",".a2","sel");
    checkNowHover("shopping_down","shopping_sel");
    **/
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
});
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
            <div class="content_2_1">
                <ul>
                    <li class="li_1">验证身份 </li>
                    <li class="li_2">修改密码</li>
                    <li class="li_3">完成</li>
                </ul>
            </div>
            <div class="right_yes">
                <img src="images/secret_03.png">
                <a class="secret_title_01">恭喜您，修改密码成功！</a>
                <a href="/" title="返回首页" class="secret_title_02">返回首页</a> 
            </div>
        </div>
    </div>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
